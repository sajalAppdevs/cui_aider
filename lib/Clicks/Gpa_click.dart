import 'package:cui_aider/Screens/Class.dart';
import 'package:cui_aider/Screens/Gpa_Calculator.dart';
import 'package:cui_aider/Screens/Labs.dart';
import 'package:cui_aider/Screens/Offices.dart';
import 'package:cui_aider/Screens/Portal.dart';
import 'package:cui_aider/Screens/Portal_password.dart';
import 'package:cui_aider/Screens/Test.dart';
import 'package:cui_aider/Screens/Test_1.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/VR.dart';
class Clicks
{
  void gpa(BuildContext context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Gpa_Calculator(),));
  }
  void portal(BuildContext context) async
  {
   SharedPreferences pref=await SharedPreferences.getInstance();
   if(pref.getString("ROLLNO")!=null && pref.getString("PASS")!=null)
     {
       Navigator.push(context, MaterialPageRoute(builder: (context) =>Portal(),));
     }
   else
     {
       Navigator.push(context, MaterialPageRoute(builder: (context) =>Portal_Password(),));
     }
  }
  void Class_(BuildContext context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>CLass(),));
  }
  void lab(BuildContext context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>Labs(),));
  }
  void office(BuildContext context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>Office(),));
  }
  void Vr(BuildContext context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>VR(),));
  }
}