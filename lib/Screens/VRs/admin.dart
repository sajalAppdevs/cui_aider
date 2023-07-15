import 'dart:io';

import 'package:cui_aider/Screens/VRs/Nextofentranceofcanteen.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:permission_handler/permission_handler.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  var check = false;
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
        child: Center(
          child: Panorama(
            zoom: 0,
            sensitivity: 2.5,
            minZoom: 1,
            child: Image.file(File("/storage/emulated/0/Android/data/com.comsats.aider/files/admin.jpeg")),
            onTap: (longitude, latitude, tilt) {
              // print(longitude);
              // print(latitude);
              // print(tilt);
              if(longitude<104 && longitude>84 && latitude<1 && latitude>-19 && tilt>-10 &&tilt<10)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NextofEntraceofCanteen(),));
              }

            },
          ),
        ),
      ),
    );
  }

}
