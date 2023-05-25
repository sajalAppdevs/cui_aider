import 'dart:async';
import 'package:cui_aider/Animated_Screens/Account.dart';
import 'package:cui_aider/Screens/Home_Page.dart';
import 'package:cui_aider/Screens/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Check_Login
{
  void isLogin(BuildContext context) async
  {
    var auth=FirebaseAuth.instance;
    var user=auth.currentUser;
    if(user!=null)
      {
        Timer(Duration(milliseconds: 1000),(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
        });
      }
    else
        {
          Timer(Duration(milliseconds: 1000),(){
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp(),));
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Account(),));
          });
        }
  }
}