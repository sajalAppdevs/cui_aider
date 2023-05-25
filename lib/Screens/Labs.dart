import 'package:cui_aider/Screens/Result.dart';
import 'package:cui_aider/Widgets/Result_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../Utils/Toast.dart';
import '../Widgets/text.dart';
import 'Home_Page.dart';

class Labs extends StatefulWidget {
  const Labs({Key? key}) : super(key: key);

  @override
  State<Labs> createState() => _LabsState();
}

class _LabsState extends State<Labs> {
  String name = "";
  String block = "";
  String floor = "";
  String department = "";
  bool button=false;
  double opacity=0.0;
  bool visibility = false;
  late double height;
  late double width;
  var textcontroller=TextEditingController();
  var focusnode=FocusNode();
  var suggest=[


  //Lab A Ground:

  "Engineering Mechanics Lab",
  "Instrumentation and Control Lab",
  "CLab4",
  //Lab A 1st Floor:

  "Mechanics of Materials Lab",
  "Thermodynamics & IC Engine Lab",
  "Project Lab",
  "CAD & CAE Lab",
  "Mechanics of Machines Lab",
  "Fluid Mechanics Lab (A Block)",
  "Computer Lab 3",
  // ?\Lab A 2nd Floor - Civil:

  "FYP Lab",
  "Electric Machines Lab",
  "Electrical Measurement and Instrumentation Lab",
  "Control System Lab",
  // Lab A 2nd Floor - Electrical:

  "Digital Lab",
  "Cisco Lab",
  "DLD lab",
  "Circuit and Electronics Lab",
  // W Block Lab:

  "Geotechnical Engineering Lab",
  "Project Lab (W Block)",
  "CNC Lab",
  "Machine Office",
  // W 2nd Block:

  "Fluid Mechanics Lab (W Block)",
  "Water Supply Engineering Lab",
  "Carpentry Shop",
  "Electric Shop",
  "Engineering Mechanics Lab (W Block)",
  "Mechanics of Solid Lab",


  ] ;
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
              "Labs",
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
                                shape: OutlineInputBorder(
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
                                        indicator: BoxDecoration(
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
                onTap: ()async {
                  if (textcontroller.text.toString().isNotEmpty) {
                    setState(() {
                      button=true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    setState(() {
                      button=false;
                    });
                    String temp = textcontroller.text.toString();
                    if (temp ==  "Engineering Mechanics Lab" ||
                        temp == "Instrumentation and Control Lab" ||
                        temp == "CLab4" ) {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "A Block";
                        floor = "Ground Floor";
                        department = "pta ni";
                      });


                    } else if (temp =="Thermodynamics & IC Engine Lab" ||
                        temp == "Mechanics of Materials Lab" ||
                        temp == "Project Lab" ||
                        temp ==  "CAD & CAE Lab" ||
                        temp == "Mechanics of Machines Lab"||
                        temp =="Fluid Mechanics Lab (A Block)"||
                        temp == "c1.5"||
                        temp == "c1.5"||
                        temp == "Computer Lab 3"
                    ) {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "A Block";
                        floor = "1st Floor";
                        department = "pta ni";
                      });


                    } else if (temp == "FYP Lab" ||
                        temp == "Electric Machines Lab"||
                        temp == "Electrical Measurement and Instrumentation Lab"||
                        temp == "Control System Lab"
                    ) {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "A Block";
                        floor = "2nd Floor";
                        department = "Civil";
                      });

                    } else if (temp == "Digital Lab" ||
                        temp == "Cisco Lab" ||
                        temp == "DLD lab" ||
                        temp == "Circuit and Electronics Lab"
                    ) {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "A Block";
                        floor = "2nd Floor";
                        department = "Electrical";
                      });


                    } else if (temp == "Geotechnical Engineering Lab" || temp == "Project Lab (W Block)" || temp ==  "CNC Lab" || temp == "Machine Office") {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "W Block";
                        floor = "Ground Floor";
                        department = "filhal yaad ni";
                      });

                    } else if (temp =="Fluid Mechanics Lab (W Block)" ||
                        temp == "Water Supply Engineering Lab" ||
                        temp == "Carpentry Shop" ||
                        temp == "Electric Shop" ||
                        temp == "Engineering Mechanics Lab (W Block)"||
                        temp == "Mechanics of Solid Lab"
                        ) {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "W Block";
                        floor = "2nd Floor";
                        department = "filhal yaad ni";
                      });
                    }  else {
                      setState(() {
                        opacity=0.0;
                        name="";
                        block="";
                        department="";
                        visibility = false;
                      });
                      Toast_("Not Found");
                    }
                  } else {
                    setState(() {
                      opacity=0.0;
                      name="";
                      block="";
                      department="";
                      visibility = false;
                    });
                    Toast_("Enter Lab Name");
                  }
                },
                child: Container(
                  height: height / 14,
                  width: double.infinity,
                  decoration: BoxDecoration(
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





