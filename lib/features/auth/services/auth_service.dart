import "dart:convert";

import "package:flutter/material.dart";
import "package:merkato/constants/error_handling.dart";
import "package:merkato/constants/global_variables.dart";
import "package:merkato/constants/utils.dart";
import "package:merkato/models/user.dart";
import "package:http/http.dart" as http;

class AuthService {
//a method that accepts named parameters for name, email, and password. if u call this method from some other part of ur app, you parameters are passed as named parameters.
//
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
      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });

      //it is possible that after successful submission(post request )of the form to the specified url, we will encouter error of d/t types. for instance if we try to signup with same email again, the form submits(makes post request) of the form data successfully b/c there is no error in the parameter(data) sent when validated in form validation, but at the backend it will throw a 404 client error for trying to signup with the same email. so we have to check what the response status code is sent to us from the server(backend) and decide to show what on  UI(whether to show loading, to show eror snackbar or to show success snackbar).  so the below error handler does that.

      httpErrorHandler(response: res, context: context, onSuccess: () {});
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
