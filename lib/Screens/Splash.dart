import 'dart:async';
import 'dart:ui';

import 'package:cui_aider/Screens/Home_Page.dart';
import 'package:cui_aider/Screens/SignUp.dart';
import 'package:cui_aider/Utils/CheckLogin.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  var anim=false;
  @override
  void initState() {
    super.initState();
    animator();
  }
  animator() async
  {
    Timer(Duration.zero,(){
      setState(() {
        anim=true;
      });
    });
   await Future.delayed(Duration(microseconds: 1500),() {
     Check_Login().isLogin(context);
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width*1.7,
            left: 100,
            bottom: 100,
            child: Image.asset("Assets/images/Spline.png"),
          ),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 20,sigmaX: 20),
                child: SizedBox(),
          )),
          Positioned.fill(child: RiveAnimation.asset("Assets/riv/shapes.riv",)),
          Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 40,sigmaX: 40),
                child: SizedBox(),
              )),
          Align(
            alignment: anim?Alignment.center:Alignment.topCenter,
            child: Image.asset("Assets/images/noback.png",height: 200,width: 200,),
          )
        ],
      )
    );
  }
}
