import 'package:flutter/material.dart';

import '../Widgets/text.dart';

class Hammad extends StatefulWidget {
  const Hammad({Key? key}) : super(key: key);

  @override
  State<Hammad> createState() => _HammadState();
}

class _HammadState extends State<Hammad> {
  var images = [
    AssetImage('assets/images/doctor5.png'),
    AssetImage('assets/images/doctor2.png'),
    AssetImage('assets/images/doctor3.png'),
    AssetImage('assets/images/doctor4.png'),
    AssetImage('assets/images/doctor5.png'),
    AssetImage('assets/images/doctor6.png'),
    AssetImage('assets/images/doctor7.png'),
  ];
  var spacilality = [
    "Anesthesiologists",
    "Rectal Surgeons",
    "Allergists/Immunologists",
    "Critical Care Specialists",
    "Endocrinologists",
    "Family Physicians",
    "Gastroenterologists",
  ];
  var names = [
    "Dr. John Carter",
    "Dr. Michaela Quinn",
    "Dr. Frasier Crane",
    "Dr. Leonard H.",
    "Dr. Doogie Howser",
    "Dr. Gregory",
    "Dr. John Dorian",
  ];
  var animate = false;
  var opacity = 0.0;
  late Size size;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      animator();
    });
  }

  animator() {
    if (opacity == 0.0) {
      opacity = 1;
      animate = true;
    } else {
      opacity = 0.0;
      animate = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 60),
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            AnimatedPositioned(
                top: 1,
                right: animate ? 1: -200,
                duration: const Duration(milliseconds: 600),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 600),
                  opacity: opacity,
                  child: Container(
                    height: size.height / 2,
                    width: size.width/2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("Assets/images/hammad.png"), fit: BoxFit.cover)),
                  ),
                )),
            AnimatedPositioned(
                left: animate ? 1 : -100,
                duration: const Duration(milliseconds: 600),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 600),
                  opacity: opacity,
                  child: Container(
                    padding: EdgeInsets.only(top: 60, left: 20),
                    height: size.height / 2,
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(
                          "H4๛『Hammad』",
                          25,
                          Colors.black,
                          FontWeight.bold,
                          letterspacel: 0,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        text(
                          "Soft. Engineer",
                          15,
                          Colors.black.withOpacity(.6),
                          FontWeight.bold,
                          letterspacel: 0,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                height: 60,
                                width: 60,
                                child: Center(
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(
                                      "Developer",
                                      17,
                                      Colors.black.withOpacity(.5),
                                      FontWeight.bold,
                                      letterspacel: 0,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    text(
                                      "Full Stack",
                                      20,
                                      Colors.black,
                                      FontWeight.bold,
                                      letterspacel: 0,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                height: 60,
                                width: 60,
                                child: Center(
                                  child: Icon(
                                    Icons.people_rounded,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    text(
                                      "Projects",
                                      17,
                                      Colors.black.withOpacity(.5),
                                      FontWeight.bold,
                                      letterspacel: 0,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    text(
                                      "100 +",
                                      20,
                                      Colors.black,
                                      FontWeight.bold,
                                      letterspacel: 0,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            AnimatedPositioned(
                top: 300,
                right: animate ? 1 : -50,
                duration: Duration(milliseconds: 600),
                child: Container(
                  height: 150,
                  width: size.width / 2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(.0),
                            Colors.white,
                            Colors.white
                          ])),
                )),
            AnimatedPositioned(
                top: animate ? 380 : 480,
                left: 1,
                right: 1,
                duration: Duration(milliseconds: 600),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 600),
                  opacity: opacity,
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 40),
                    height: size.height / 5,
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text("Biography", 25, Colors.black, FontWeight.bold),
                        SizedBox(
                          height: 20,
                        ),
                        text(
                          "Famous doctor, hygienist, folklore researcher and sanitary mentor, Charles Laugier, whose contribution to the development",
                          15,
                          Colors.black.withOpacity(.5),
                          FontWeight.normal,
                          letterspacel: 0,
                        ),
                      ],
                    ),
                  ),
                )),
            AnimatedPositioned(
                left: 20,
                right: 20,
                bottom: animate?80:-20, duration: Duration(milliseconds: 600),
                child: AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(milliseconds: 600),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20),
                    height: 130,
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Schedule", 25, Colors.black, FontWeight.bold),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    text("19", 15, Colors.black, FontWeight.bold,letterspacel: 0,),
                                    text("Thu", 15, Colors.black, FontWeight.bold,letterspacel: 0,),
                                  ],
                                ),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    text("20", 15, Colors.black, FontWeight.bold,letterspacel: 0,),
                                  ],
                                ),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    text("21", 15, Colors.black, FontWeight.bold,letterspacel: 0,),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    text("22", 15, Colors.black, FontWeight.bold,letterspacel: 0,),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            AnimatedPositioned(
                bottom: animate?15:-80,
                left: 30,
                right: 30, duration: Duration(milliseconds: 600),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 600),
                  opacity: opacity,
                  child: InkWell(
                    onTap: () async
                    {
                      animator();
                      await Future.delayed(Duration(milliseconds: 600));
                      animator();
                    },
                    child: Container(
                      height: 65,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blue.shade900,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text("Contact", 18, Colors.white, FontWeight.w500,letterspacel: 1,),
                          const SizedBox(width: 4,),
                          const Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 18,),
                          Icon(Icons.arrow_forward_ios_outlined,color: Colors.white.withOpacity(.5),size: 18,),
                          Icon(Icons.arrow_forward_ios_outlined,color: Colors.white.withOpacity(.2),size: 18,),
                        ],
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
