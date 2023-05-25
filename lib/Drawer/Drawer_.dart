import 'package:cui_aider/Screens/Test_1.dart';
import 'package:cui_aider/Widgets/text.dart';
import 'package:flutter/material.dart';

import '../Screens/Home_Page.dart';

class Drawer_ extends StatefulWidget {
  const Drawer_({Key? key}) : super(key: key);
  @override
  State<Drawer_> createState() => _Drawer_State();
}
class _Drawer_State extends State<Drawer_> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF4c41a3), Color(0xFF1f186f)])
      ),

      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage("Assets/images/noback.png"),width: MediaQuery.of(context).size.width/4),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(

                          children: [
                            Text(
                              "CUI",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              " AIDER",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.blue[200],
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                InkWell(
                  onTap: () {
                    setState(() {

                    });
                  },
                  child: Text(
                    "Home Screen",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Divider(
                  color: Color(0xFF5950a0),
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Text(
                  "Setting",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Divider(
                  color: Color(0xFF5950a0),
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Divider(
                  color: Color(0xFF5950a0),
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                Text(
                  "About",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
