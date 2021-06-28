import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  var _isAuthenticated = false;
  var _user;

  get user => _user;

  void setUser(BuildContext context, var user){
    if (user != null){
      _isAuthenticated = true;
      Navigator.pushReplacementNamed(context, "/home");
      _user = user;
    } else{
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(context, "/loginPage");
    }
  }
   Future <void> currentUser() async{
    final instace = await SharedPreferences.getInstance(); 
    instace.setString("user", user);
    return;
  }

}