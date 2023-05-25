import 'package:cui_aider/Screens/Home_Page.dart';
import 'package:cui_aider/Utils/Toast.dart';
import 'package:cui_aider/Widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../Widgets/Result_Card.dart';

class CLass extends StatefulWidget {
  const CLass({Key? key}) : super(key: key);

  @override
  State<CLass> createState() => _CLassState();
}

class _CLassState extends State<CLass> {
  String name = "";
  String block = "";
  String floor = "";
  bool button=false;
  String department = "";
  double opacity=0.0;
  bool visibility = false;
  late double height;
  late double width;
  var textcontroller = TextEditingController();
  var focusnode = FocusNode();
  var suggest = [
    "C1",
    "C2",
    "C3",
    "C4",
    "C5",
    "C1.1",
    "C1.2",
    "C1.3",
    "C1.4",
    "C1.5",
    "C2.1",
    "C2.2",
    "C2.3",
    "C2.4",
    "C2.5",
    "A1",
    "A2",
    "A3",
    "A1.1",
    "A1.2",
    "A1.3",
    "A2.1",
    "A2.2",
    "A2.3",
    "B1",
    "B2",
    "B3",
    "B4",
    "B5",
    "B6",
    "B7",
    "B8",
    "B9",
    "B10",
    "B11",
    "B12",
    "B13",
    "B14",
    "W1",
    "W2",
    "W3",
    "W4",
  ];

  @override
  void dispose() {
    textcontroller.dispose();
    focusnode.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Class",
              style: TextStyle(color: Colors.black),
            ),
            leading: Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: ()
                    {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      child: Center(
                        child: Icon(Icons.arrow_back_sharp,
                            size: 15, color: Colors.black),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.05),
                          shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
            )),
        body: Container(
          color: Colors.white,
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                  height: height / 12,
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: TypeAheadField(
                    animationStart: 0,
                    animationDuration: Duration.zero,
                    textFieldConfiguration: TextFieldConfiguration(
                        controller: textcontroller,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            enabled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blue)),
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.blue),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Colors.blue)))),
                    suggestionsBoxDecoration:
                        SuggestionsBoxDecoration(color: Colors.transparent),
                    suggestionsCallback: (pattern) {
                      List<String> matches = <String>[];
                      matches.addAll(suggest);
                      if (pattern == '') {
                        return const Iterable<String>.empty();
                      } else {
                        matches.retainWhere((s) {
                          return s
                              .toLowerCase()
                              .contains(pattern.toLowerCase());
                        });
                        return matches;
                      }
                    },
                    itemBuilder: (context, sone) {
                      return Card(
                          child: Container(
                        padding: EdgeInsets.all(10),
                        child: Center(child: Text(sone.toString())),
                      ));
                    },
                    onSuggestionSelected: (suggestion) {
                      setState(() {
                        textcontroller.text = suggestion.toString();
                      });
                    },
                  )
                  // TextFormField(
                  //   controller: textcontroller,
                  //
                  //   textAlign: TextAlign.center,
                  //   decoration: InputDecoration(
                  //       hintText: "Search",
                  //       enabled: true,
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(20),
                  //           borderSide: BorderSide(
                  //             color: Colors.blue,
                  //           )
                  //       ),
                  //       enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(20),
                  //           borderSide: BorderSide(
                  //             color: Colors.blue,
                  //           )
                  //       )
                  //   ),
                  // ),
                  ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: double.infinity,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Card(
                            shape: const OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30)),
                                borderSide: BorderSide(color: Colors.white)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              child: Container(
                                color: Colors.black.withOpacity(.001),
                                height: 55,
                                child: TabBar(
                                    unselectedLabelColor: Colors.white,
                                    indicator: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            bottomRight: Radius.circular(30))),
                                    tabs: [
                                      Container(
                                          decoration: const BoxDecoration(),
                                          height: double.infinity,
                                          child: Center(
                                              child: text(
                                                  "Location",
                                                  20,
                                                  Colors.black,
                                                  FontWeight.normal))),
                                      Container(
                                          decoration: const BoxDecoration(),
                                          height: double.infinity,
                                          child: Center(
                                              child: text(
                                                  "Pictures",
                                                  20,
                                                  Colors.black,
                                                  FontWeight.normal))),
                                    ]),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TabBarView(children: [
                              Card(
                                margin: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 10, right: 10),
                                elevation: 10,
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Visibility(
                                      visible: true,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            custom("Name", name),
                                            custom("Block", block),
                                            custom("Floor", floor),
                                            custom(
                                                "Department", department),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10),
                                elevation: 10,
                                shape: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                              ),
                            ]),
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              ),
              InkWell(
                onTap: () async{
                  if (textcontroller.text.toString().isNotEmpty) {
                    setState(() {
                      button=true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    setState(() {
                      button=false;
                    });
                    String temp = textcontroller.text.toString().toLowerCase();
                    if (temp == "c1" ||
                        temp == "c2" ||
                        temp == "c3" ||
                        temp == "c4" ||
                        temp == "c5") {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "C Block";
                        floor = "Ground Floor";
                        department = "Computer Science";
                      });
                    } else if (temp == "c1.1" ||
                        temp == "c1.2" ||
                        temp == "c1.3" ||
                        temp == "c1.4" ||
                        temp == "c1.5") {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "C Block";
                        floor = "1st Floor";
                        department = "Computer Science";
                      });
                    } else if (temp == "c2.1" ||
                        temp == "c2.2" ||
                        temp == "c2.3" ||
                        temp == "c2.4" ||
                        temp == "c2.5") {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "C Block";
                        floor = "2nd Floor";
                        department = "Computer Science";
                      });
                    } else if (temp == "b1" ||
                        temp == "b2" ||
                        temp == "b3" ||
                        temp == "b4" ||
                        temp == "b5" ||
                        temp == "b6" ||
                        temp == "b7" ||
                        temp == "b8" ||
                        temp == "b9" ||
                        temp == "b10" ||
                        temp == "b11" ||
                        temp == "b12" ||
                        temp == "b13" ||
                        temp == "b14") {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "B Block";
                        floor = "Ground Floor";
                        department = "Management Science";
                      });
                    } else if (temp == "a1" || temp == "a2" || temp == "a3") {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "A Block";
                        floor = "Ground Floor";
                        department = "filhal yaad ni";
                      });
                    } else if (temp == "a1.1" ||
                        temp == "a1.2" ||
                        temp == "a1.3") {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "A Block";
                        floor = "1st Floor";
                        department = "filhal yaad ni";
                      });
                    } else if (temp == "a2.1" ||
                        temp == "a2.2" ||
                        temp == "a2.3") {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "A Block";
                        floor = "2nd Floor";
                        department = "filhal yaad ni";
                      });
                    } else if (temp == "w1" ||
                        temp == "w2" ||
                        temp == "w3" ||
                        temp == "w4") {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "W Block";
                        floor = "1st Floor";
                        department = "filhal yaad ni";
                      });
                    } else {
                      setState(() {
                        name="";
                        block="";
                        department="";
                        opacity=0.0;
                        visibility = false;
                      });
                      Toast_("Not Found");
                    }
                  } else {
                    setState(() {
                      name="";
                      block="";
                      department="";
                      opacity=0.0;
                      visibility = false;
                    });
                    Toast_("Enter Class Name");
                  }
                },
                child: Container(
                  height: height / 14,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Center(
                      child: button?Container(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white,)):text("Search", 20, Colors.white, FontWeight.normal)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget custom(String title,String marks)
  {
    return Card(
      elevation: 10,
      shape: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white
          ),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
      child: Container(
        height: 115,
        width: width,
        child: Stack(
          children: [
            Positioned(
                top: 10,
                left: 20,
                child:
                text(title, 17, Colors.black.withOpacity(.5), FontWeight.bold)
            ),
            AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                bottom: visibility?10:100,
                left: 10,
                right: 10,
                child: AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(milliseconds: 500),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.black.withOpacity(.05),
                      child: Center(
                        child: text(marks, 17, Colors.black, FontWeight.normal),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
