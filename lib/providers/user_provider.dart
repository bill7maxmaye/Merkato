import 'package:flutter/material.dart';
import 'package:merkato/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
  );

//since _user is a private variable, we have to use a getter
// to access it from outside this class.
  User get user => _user;

//down here we created a function called setUser that will update this user variable with the new user data that we want to set.
//that means for our app there are many users so each user's data will be stored to keep their state in the app

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners(); //notify all the widgets that are listening for changes in this user variable
  }
}
