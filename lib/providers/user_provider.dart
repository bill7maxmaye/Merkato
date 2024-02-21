import 'package:flutter/material.dart';
import 'package:merkato/models/user.dart';

class UserProvider extends ChangeNotifier{

  User _user = User(
    id: '',
     name: '',
      email: '',
       password: '',
        address: '', 
        type: '', 
        token: '')

}