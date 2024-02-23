import "dart:convert";

import "package:flutter/material.dart";
import "package:merkato/common/widgets/bottom_bar.dart";
import "package:merkato/constants/error_handling.dart";
import "package:merkato/constants/global_variables.dart";
import "package:merkato/constants/utils.dart";
//import "package:merkato/features/home/screens/home_screen.dart";
import "package:merkato/models/user.dart";
import "package:http/http.dart" as http;
import "package:merkato/providers/user_provider.dart";
import "package:provider/provider.dart";
import "package:shared_preferences/shared_preferences.dart";

class AuthService {
//a method that accepts named parameters for name, email, and password. if u call this method from some other part of ur app, you parameters are passed as named parameters.
// signUpUser(name: bill, email: bill@gmail.com, password: 12345)

  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      //it is possible that after successful submission(post request )of the form to the specified url, we will encouter error of d/t types. for instance if we try to signup with same email again, the form submits(makes post request) of the form data successfully b/c there is no error in the parameter(data) sent when validated in form validation, but at the backend it will throw a 404 client error for trying to signup with the same email. so we have to check what the response status code is sent to us from the server(backend) and decide to show what on  UI(whether to show loading, to show eror snackbar or to show success snackbar).  so the below error handler does that.

      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account Created!! Login with the same credentials');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

//sign in user

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      //it is possible that after successful submission(post request )of the form to the specified url, we will encouter error of d/t types. for instance if we try to signup with same email again, the form submits(makes post request) of the form data successfully b/c there is no error in the parameter(data) sent when validated in form validation, but at the backend it will throw a 404 client error for trying to signup with the same email. so we have to check what the response status code is sent to us from the server(backend) and decide to show what on  UI(whether to show loading, to show eror snackbar or to show success snackbar).  so the below error handler does that.

      httpErrorHandler(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);

            await prefs.setString(
                "x-auth-token", jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
              context,
              BottomBar.routeName,
              (route) => false,
            );
          });
      //on success we have to save the token in local storage or wherever we want to keep the state of the user in the app.
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

//get User Data Route

  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("x-auth-token");

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      //the tokenRes is a boolean value that tells us if the token is valid or not. if the token is valid, we can get the user data from the server. if the token is not valid, we can show a snackbar to the user to login again.  //if the user is not logged in redirect to login page
      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-auth-token': token
            });

        var userProvider = Provider.of<UserProvider>(context, listen: false);

        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
