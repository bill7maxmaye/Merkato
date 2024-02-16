import 'package:flutter/material.dart';
import 'package:merkato/constants/global_variables.dart';

enum Auth{
  signin,
  signup,
}


class AuthScreen extends StatefulWidget {
  static const String routeName =  "/auth-screen";
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
           const Text("WELCOME",  style: TextStyle(fontSize: 22, fontWeight:FontWeight.w500 ),),
          ListTile(
            title:  Text("Create Account", style: TextStyle(fontWeight: FontWeight.bold),),
            leading: Radio(activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                groupValue: _auth,
                onChanged: (Auth ? val){
                    setState(() {
                      _auth = val!;
                    });
                }),
          ),
          ListTile(
            title:  Text("Sign-In", style: TextStyle(fontWeight: FontWeight.bold),),
            leading: Radio(activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                groupValue: _auth,
                onChanged: (Auth ? val){
                  setState(() {
                    _auth = val!;
                  });
                }),
          )

        ],),
      ))
    );
  }
}
