import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../Utils/Toast.dart';
import '../Widgets/Result_Card.dart';
import '../Widgets/text.dart';
import 'Home_Page.dart';

class Office extends StatefulWidget {
  const Office({Key? key}) : super(key: key);

  @override
  State<Office> createState() => _OfficeState();
}

class _OfficeState extends State<Office> {
  String name = "";
  String block = "";
  String floor = "";
  String department = "";
  double opacity=0.0;
  var button=false;
  bool visibility = false;
  var textcontroller = TextEditingController();
  var focusnode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration.zero,(){
      setState(() {
        visibility=false;
      });
    });
  }

  var suggest = [
    // A Block Ground Floor

    "Director Office",
    "Registration office",
    "Assistant Registrar",
    "M. Ibrar Janjua",
    "M. Nadeem Tariq",
    "Manager HR",
    "Dr. Iqra Hafeez",
    "Admin Office",
    "Library",
    "Mam Ramisha Sajad",
    "First Aid Facility",
    "Discpenciry",
    "Conference Room A",
    "IT Office",
    "Server Room",
    "DCO Mechanics Engineering",
    "DR. M. Rafi Raza",
    "M01",
    "HOD Mechanics Engineering",
    "M02",
    "Ali Khalid ( Assistant Manager )",
    "M03",
    "RFP Office",
    "Syed Nafees Haider",
    "CU Online Assistant",
    "Hafeez Ahmad ( Assistant Professor )",
    "Dr. Tuoqeer Anwar ( Assistant Professor )",
    "Dr. Sayed Aftab Naqvi",
    "Dr. Salman Mustafa ( Assistant Professor )",
    "Mazher Hussain ( Office Assistant )"

        // A block 2nd floor

        "Miss Sabeen Ameen",
    "Miss Maham Fatima",
    "Dr. Abuzar Baqir ( Assistan Professor )",
    "Dr. Talha Younis ( Assistant Professor )",
    "Maulana M. Yasin ( Assistant Professor )",
    "Hafiz M. Zeeshan ( Assistant Professor )",
    "Engr.Khalid Majeed (Assistant Professor )",
    "Dr. Shohaib Tahir ( Assistant Professor )",
    "Dr. Musab Hameed ( Assistant Professor )",
    "Dr. Muhammad Usman ( Lecturer )",
    "Mr. Asim Imran ( Lecturer )",
    "Mr. Usman Nasin ( Lecturer )",
    "Shahid Ali ( Office Assistant )",
    "Dr. Saeeda Usman ( Incharge )",
    "Rizwan Mustafa ( Lab Supervisor )",
    "Engr. Munawar ul Zaman",
    "Syed Tafheem Abbas ( Labortary Enginner )",
    "Hafiz M. Sohaib Yaseen",
    "Dr. Saqib Saleem ( Assistant Professor )",
    "Dr. Waqas Ahmad Watto ( Assistant Professor )",
    "Dr. Ghulam Farid ( Assistant Professor )",
    "Dr. Sadam Hussain ( Civil Engineering )",
    "Engr. Shad Muhammad ( Lecturer )",
    "Engr. Waqar Ahsan ( Lab Engineer )",
    "DCO/LDC Office",
    "Engineering Drawing Hall",
    "Engr. Ahsan Maqsood",
    "Engr. Rida Maamoor",
    "Engr. Asim Noon",

    // A block 1st floor

    "Nadeem-Ul-Hassan ( APO )",
    "Payment Section",
    "Treasure Office",
    "M. Nadeem Rana ( SPO )",
    "Awais Nadeem ( Assistant Treasure )",
    "M. Umar Rasheed ( Incharge Purchase )",
    "Purchase and Store Department",
    "Dr. Sayeed Anees ( Deputy Treasure )",
    "Head of Accounts",
    "Mr. Amir Shehzad ( Heat Lab Engineer )",
    "Auditoriam Hall",
    "Dr. Awais Ahsan ( Assistant Professor )",
    "Dr. Muhammad Nadeem ( Assistant Professor )",
    "Dr. Muhammad Azhar ( Assistant Professor )",
    "Dr. Muhammad Abid ( Assistant Professor )",
    "Dr. Munib Qasim ( Assistant Professor )",
    "Muhammad Ahsan Iqbal ( Lecturer )",
    "Mr. Khawar Husssain ( Lecturer )",
    "Mr. Muhammad Hanzla ( Lecturer )",
    "Gulam Mustafa ( Lab Engineer )",
    "Muzamil Hussain ( Lecturer )",
    "M. Salman Nawaz ( Lecturer )",
    "Muhammad Hassan",
    "Hafiz Muhammad Nawaz",
    "Ali Zahid",

    // W ground floor

    "Jawad Abid ( Lab Enginner )",
    "Dr. Usama Khalid ( Lab Engineer )",
    "Engr. Hafiz M. Sohaib Yasin",
    "Fitting Shop",

    // W 2nd floor
    "Engr. Muhammad Yousaf Mushtaq ( Lab Engineer )",
    "Hiba Arshad",

  ];
  late double height;
  late double width;
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
                onTap: () async{
                  if (textcontroller.text.toString().isNotEmpty) {
                    setState(() {
                      button=true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    setState(() {
                      button=false;
                    });
                    String temp = textcontroller.text.toString();
                    if (
                    temp == "Director Office" ||
                        temp == "Registration office" ||
                        temp == "Assistant Registrar" ||
                        temp == "M. Ibrar Janjua" ||
                        temp == "M. Nadeem Tariq" ||
                        temp == "Manager HR" ||
                        temp == "Dr. Iqra Hafeez" ||
                        temp == "Admin Office" ||
                        temp == "Library" ||
                        temp == "Mam Ramisha Sajad" ||
                        temp == "First Aid Facility" ||
                        temp == "Discpenciry" ||
                        temp == "Conference Room A" ||
                        temp == "IT Office" ||
                        temp == "Server Room" ||
                        temp == "DCO Mechanics Engineering" ||
                        temp == "DR. M. Rafi Raza" ||
                        temp == "M01" ||
                        temp == "HOD Mechanics Engineering" ||
                        temp == "M02" ||
                        temp == "Ali Khalid ( Assistant Manager )" ||
                        temp == "M03" ||
                        temp == "RFP Office" ||
                        temp == "Syed Nafees Haider" ||
                        temp == "CU Online Assistant" ||
                        temp == "Hafeez Ahmad ( Assistant Professor )" ||
                        temp == "Dr. Tuoqeer Anwar ( Assistant Professor )" ||
                        temp == "Dr. Sayed Aftab Naqvi" ||
                        temp == "Dr. Salman Mustafa ( Assistant Professor )" ||
                        temp == "Mazher Hussain ( Office Assistant )"
                    ) {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "A Block";
                        floor = "Ground Floor";
                        department = "pta ni";
                      });
                    } else if (
                    temp == "Miss Sabeen Ameen" ||
                        temp == "Miss Maham Fatima" ||
                        temp == "Dr. Abuzar Baqir ( Assistan Professor )" ||
                        temp == "Dr. Talha Younis ( Assistant Professor )" ||
                        temp == "Maulana M. Yasin ( Assistant Professor )" ||
                        temp == "Hafiz M. Zeeshan ( Assistant Professor )" ||
                        temp == "Engr.Khalid Majeed (Assistant Professor )" ||
                        temp == "Dr. Shohaib Tahir ( Assistant Professor )" ||
                        temp == "Dr. Musab Hameed ( Assistant Professor )" ||
                        temp == "Dr. Muhammad Usman ( Lecturer )" ||
                        temp == "Mr. Asim Imran ( Lecturer )" ||
                        temp == "Mr. Usman Nasin ( Lecturer )" ||
                        temp == "Shahid Ali ( Office Assistant )" ||
                        temp == "Dr. Saeeda Usman ( Incharge )" ||
                        temp == "Rizwan Mustafa ( Lab Supervisor )" ||
                        temp == "Engr. Munawar ul Zaman" ||
                        temp == "Syed Tafheem Abbas ( Labortary Enginner )" ||
                        temp == "Hafiz M. Sohaib Yaseen" ||
                        temp == "Dr. Saqib Saleem ( Assistant Professor )" ||
                        temp == "Dr. Waqas Ahmad Watto ( Assistant Professor )" ||
                        temp == "Dr. Ghulam Farid ( Assistant Professor )" ||
                        temp == "Dr. Sadam Hussain ( Civil Engineering )" ||
                        temp == "Engr. Shad Muhammad ( Lecturer )" ||
                        temp == "Engr. Waqar Ahsan ( Lab Engineer )" ||
                        temp == "DCO/LDC Office" ||
                        temp == "Engineering Drawing Hall" ||
                        temp == "Engr. Ahsan Maqsood" ||
                        temp == "Engr. Rida Maamoor" ||
                        temp == "Engr. Asim Noon"
                    ) {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "A Block";
                        floor = "2nd Floor";
                        department = "Electrical/Civil";
                      });
                    } else if (temp == "Nadeem-Ul-Hassan ( APO )" ||
                        temp == "Payment Section" ||
                        temp == "Treasure Office" ||
                        temp == "M. Nadeem Rana ( SPO )" ||
                        temp == "Awais Nadeem ( Assistant Treasure )" ||
                        temp == "M. Umar Rasheed ( Incharge Purchase )" ||
                        temp == "Purchase and Store Department" ||
                        temp == "Dr. Sayeed Anees ( Deputy Treasure )" ||
                        temp == "Head of Accounts" ||
                        temp == "Mr. Amir Shehzad ( Heat Lab Engineer )" ||
                        temp == "Auditoriam Hall" ||
                        temp == "Dr. Awais Ahsan ( Assistant Professor )" ||
                        temp == "Dr. Muhammad Nadeem ( Assistant Professor )" ||
                        temp == "Dr. Muhammad Azhar ( Assistant Professor )" ||
                        temp == "Dr. Muhammad Abid ( Assistant Professor )" ||
                        temp == "Dr. Munib Qasim ( Assistant Professor )" ||
                        temp == "Muhammad Ahsan Iqbal ( Lecturer )" ||
                        temp == "Mr. Khawar Husssain ( Lecturer )" ||
                        temp == "Mr. Muhammad Hanzla ( Lecturer )" ||
                        temp == "Gulam Mustafa ( Lab Engineer )" ||
                        temp == "Muzamil Hussain ( Lecturer )" ||
                        temp == "M. Salman Nawaz ( Lecturer )" ||
                        temp == "Muhammad Hassan" ||
                        temp == "Hafiz Muhammad Nawaz" ||
                        temp == "Ali Zahid") {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "A Block";
                        floor = "1st Floor";
                        department = "pta ni";
                      });

                    } else if (temp == "Jawad Abid ( Lab Enginner )" ||
                        temp == "Dr. Usama Khalid ( Lab Engineer )" ||
                        temp == "Engr. Hafiz M. Sohaib Yasin"||
                        temp == "Fitting Shop"  ) {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "W Block";
                        floor = "Ground Floor";
                        department = "pta ni";
                      });


                    } else if (temp == "Engr. Muhammad Yousaf Mushtaq ( Lab Engineer )" || temp == "Hiba Arshad" ) {
                      setState(() {
                        opacity=1.0;
                        visibility = true;
                        name = textcontroller.text.toString();
                        block = "W Block";
                        floor = "2nd Floor";
                        department = "filhal yaad ni";
                      });
                    } else {
                      setState(() {
                        visibility = false;
                        name="";
                        opacity=0.0;
                        block="";
                        department="";
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
