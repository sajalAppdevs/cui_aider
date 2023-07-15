import 'dart:io';

import 'package:cui_aider/Screens/VRs/Ground.dart';
import 'package:cui_aider/Screens/VRs/admin.dart';
import 'package:cui_aider/Screens/VRs/streight.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:panorama/panorama.dart';

class VR extends StatefulWidget {
  const VR({Key? key}) : super(key: key);

  @override
  State<VR> createState() => _VRState();
}

class _VRState extends State<VR> {
  double _panoramaY = 0;
  double width = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Panorama(
          child:Image.file(File("/storage/emulated/0/Android/data/com.comsats.aider/files/innergate.jpeg")),
          onTap: (longitude, latitude, tilt)async {
            if(longitude<18.0 && longitude>-2.0 && latitude<2 && latitude>-18 && tilt>-3 &&tilt<17)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Streight(),));
              }
            if(longitude<-44 && longitude>-66 && latitude<-2 && latitude>-22 && tilt>30 &&tilt<50)
            {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Admin(),));
            }
            if(longitude<102 && longitude>80 && latitude<-1 && latitude>-25 && tilt>-15 &&tilt<10)
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Ground(),));

            }
          },
        ),
      ),
    );
  }

}
