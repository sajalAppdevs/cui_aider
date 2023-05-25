import 'package:cui_aider/Screens/Result.dart';
import 'package:cui_aider/Utils/Toast.dart';
import 'package:cui_aider/Widgets/text.dart';
import 'package:flutter/material.dart';

import 'Home_Page.dart';

class Gpa_Calculator extends StatefulWidget {
  const Gpa_Calculator({Key? key}) : super(key: key);
  @override
  State<Gpa_Calculator> createState() => _Gpa_CalculatorState();
}
class _Gpa_CalculatorState extends State<Gpa_Calculator> {
  
  var num_of_assignments=TextEditingController();
  int numofassignments=0;
  bool ass_visible=false;

  var num_of_quiz=TextEditingController();
  int numofquiz=0;
  bool qu_visible=false;

  bool button=false;
  var num_of_lab_assignments=TextEditingController();
  int numoflabquiz=0;
  bool qulab_visible=false;
  bool labmidSwitch=false;
  bool labfinalSwitch=false;


  bool midSwitch=false;
  bool finalSwitch=false;
  bool labSwitch=false;


  late Size size;

  var assignments_controllers=
      [
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
      ];
  var assignments_total_controllers=
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];



  var quiz_controllers=
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  var quiz_total_controllers=
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];



  var lab_controllers=
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  var lab_total_controllers=
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];



  var mid_controller=TextEditingController();
  var mid_total_controller=TextEditingController();


  var final_controller=TextEditingController();
  var final_total_controller=TextEditingController();



  var lab_mid_controller=TextEditingController();
  var lab_mid_total_controller=TextEditingController();


  var lab_final_controller=TextEditingController();
  var lab_final_total_controller=TextEditingController();


  bool ass_check=true;
  bool quiz_check=true;
  bool lab_assign_check=true;


  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Gpa",style: TextStyle(color: Colors.black),),
          leading: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle),
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
                      child: Icon(Icons.arrow_back_sharp,size: 15,color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.05),
                        shape: BoxShape.circle),
                  ),
                )
              ],
            ),
          )
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: Container(
                padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.height*0.04,),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              height: 40,
                              width: 100,
                              padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                controller: num_of_assignments,
                                decoration: InputDecoration(
                                  labelText: "Number of Assignments",
                                  labelStyle: TextStyle(color: Colors.blue),
                                  enabled: true,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Colors.blue
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue
                                    ),
                                    borderRadius: BorderRadius.circular(20)
                                  )
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    if(int.parse(num_of_assignments.text.toString())>0)
                                      {
                                        setState(() {
                                          ass_visible=true;
                                          numofassignments=int.parse(num_of_assignments.text.toString());

                                          for(int i=0;i<numofassignments;i++)
                                            {
                                              assignments_total_controllers[i].text="10";
                                            }


                                        });
                                      }
                                    else
                                      {
                                        setState(() {
                                          ass_visible=false;
                                        });
                                      }
                                  }, child: text("Submit", 18, Colors.blue, FontWeight.bold)
                                ),
                              ))
                        ],
                      ),
                      SizedBox(height: size.height*0.03,),
                      Visibility(
                        replacement: SizedBox(height: 0,),
                        visible: ass_visible,
                        maintainAnimation: true,
                        maintainState: true,
                        child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blue)
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: numofassignments,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 50,
                                  width: 100,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: assignments_controllers[index],
                                    decoration: InputDecoration(
                                        labelStyle: TextStyle(color: Colors.blue),
                                        enabled: true,
                                        labelText: "Obtained",
                                        enabledBorder : OutlineInputBorder(
                                            borderRadius: BorderRadius.all( Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.black.withOpacity(.5),
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all( Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.black.withOpacity(.5),
                                            )
                                        )
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  height: 50,
                                  width: 100,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: assignments_total_controllers[index],
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        enabled: true,
                                        labelStyle: TextStyle(color: Colors.blue),
                                        labelText: "Total",
                                        enabledBorder : OutlineInputBorder(
                                            borderRadius: BorderRadius.all( Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.black.withOpacity(.5),
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all( Radius.circular(10)),
                                            borderSide: BorderSide(
                                              color: Colors.black.withOpacity(.5),
                                            )
                                        )
                                    ),
                                  ),
                                )
                              ],
                            );
                          },),
                      ),),



                      SizedBox(height:ass_visible?size.height*0.03:size.height*0.015),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              height: 40,
                              width: 100,
                              padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                controller: num_of_quiz,
                                decoration: InputDecoration(
                                    labelText: "Number of Quiz",
                                    labelStyle: TextStyle(color: Colors.blue),
                                    enabled: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: Colors.blue
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue
                                        ),
                                        borderRadius: BorderRadius.circular(20)
                                    )
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: Center(
                                child: TextButton(
                                    onPressed: () {
                                      if(int.parse(num_of_quiz.text.toString())>0)
                                        {
                                          setState(() {
                                            qu_visible=true;
                                            numofquiz=int.parse(num_of_quiz.text.toString());
                                            for(int i=0;i<numofquiz;i++)
                                              {
                                                  quiz_total_controllers[i].text="10";
                                              }
                                          });
                                        }
                                      else
                                        {
                                          setState(() {
                                            qu_visible=false;
                                          });
                                        }

                                    }, child: text("Submit", 18, Colors.blue, FontWeight.bold)
                                ),
                              ))
                        ],
                      ),
                      SizedBox(height: size.height*0.03,),
                      Visibility(
                        visible: qu_visible,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.blue)
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: numofquiz,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    height: 50,
                                    width: 100,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: quiz_controllers[index],
                                      decoration: InputDecoration(
                                          labelStyle: TextStyle(color: Colors.blue),
                                          enabled: true,
                                          labelText: "Obtained",
                                          enabledBorder : OutlineInputBorder(
                                              borderRadius: BorderRadius.all( Radius.circular(10)),
                                              borderSide: BorderSide(
                                                color: Colors.black.withOpacity(.5),
                                              )
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all( Radius.circular(10)),
                                              borderSide: BorderSide(
                                                color: Colors.black.withOpacity(.5),
                                              )
                                          )
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    height: 50,
                                    width: 100,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      controller: quiz_total_controllers[index],
                                      decoration: InputDecoration(
                                          enabled: true,
                                          labelStyle: TextStyle(color: Colors.blue),
                                          labelText: "Total",
                                          enabledBorder : OutlineInputBorder(
                                              borderRadius: BorderRadius.all( Radius.circular(10)),
                                              borderSide: BorderSide(
                                                color: Colors.black.withOpacity(.5),
                                              )
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all( Radius.circular(10)),
                                              borderSide: BorderSide(
                                                color: Colors.black.withOpacity(.5),
                                              )
                                          )
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },),
                        ),
                      ),



                      Container(
                        padding: EdgeInsets.only(left: size.height*0.05,right: size.height*0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("Mids", 20, Colors.blue, FontWeight.bold),
                            Switch(value: midSwitch, onChanged: (value) {
                              if(midSwitch)
                                {
                                  setState(() {
                                    midSwitch=false;
                                  });
                                }
                              else
                                {
                                  setState(() {
                                    mid_total_controller.text="25";
                                    midSwitch=true;
                                  });
                                }
                            },),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height*0.01,),
                      Visibility(
                        visible: midSwitch,
                        child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 50,
                          width: 100,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: mid_controller,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.blue),
                                enabled: true,
                                labelText: "Obtained",
                                enabledBorder : OutlineInputBorder(
                                    borderRadius: BorderRadius.all( Radius.circular(10)),
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(.5),
                                    )
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all( Radius.circular(10)),
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(.5),
                                    )
                                )
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 50,
                          width: 100,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            controller: mid_total_controller,
                            decoration: InputDecoration(
                                enabled: true,
                                labelStyle: TextStyle(color: Colors.blue),
                                labelText: "Total",
                                enabledBorder : OutlineInputBorder(
                                    borderRadius: BorderRadius.all( Radius.circular(10)),
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(.5),
                                    )
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all( Radius.circular(10)),
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(.5),
                                    )
                                )
                            ),
                          ),
                        )
                    ],
                  ),
                      ),


                      Container(
                        padding: EdgeInsets.only(left: size.height*0.05,right: size.height*0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("Final", 20, Colors.blue, FontWeight.bold),
                            Switch(value: finalSwitch, onChanged: (value) {
                              if(finalSwitch)
                              {
                                setState(() {
                                  finalSwitch=false;
                                });
                              }
                              else
                              {
                                setState(() {
                                  final_total_controller.text="50";
                                  finalSwitch=true;
                                });
                              }
                            },),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height*0.01,),
                      Visibility(
                        visible: finalSwitch,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 50,
                              width: 100,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: final_controller,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.blue),
                                    enabled: true,
                                    labelText: "Obtained",
                                    enabledBorder : OutlineInputBorder(
                                        borderRadius: BorderRadius.all( Radius.circular(10)),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(.5),
                                        )
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all( Radius.circular(10)),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(.5),
                                        )
                                    )
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              height: 50,
                              width: 100,
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: final_total_controller,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    enabled: true,
                                    labelStyle: TextStyle(color: Colors.blue),
                                    labelText: "Total",
                                    enabledBorder : OutlineInputBorder(
                                        borderRadius: BorderRadius.all( Radius.circular(10)),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(.5),
                                        )
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all( Radius.circular(10)),
                                        borderSide: BorderSide(
                                          color: Colors.black.withOpacity(.5),
                                        )
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      ),



                      // lab Data
                      Container(
                        padding: EdgeInsets.only(left: size.height*0.05,right: size.height*0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("Labs", 20, Colors.blue, FontWeight.bold),
                            Switch(value: labSwitch, onChanged: (value) {
                              if(labSwitch)
                              {
                                setState(() {
                                  labSwitch=false;
                                });
                              }
                              else
                              {
                                setState(() {
                                  labSwitch=true;
                                });
                              }
                            },),
                          ],
                        ),
                      ),
                      Visibility(
                          visible: labSwitch,
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(height: size.height*0.04,),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        height: 40,
                                        width: 100,
                                        padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05),
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          controller: num_of_lab_assignments,
                                          decoration: InputDecoration(
                                              labelText: "Number of Lab Assignments",
                                              labelStyle: TextStyle(color: Colors.blue),
                                              enabled: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: BorderSide(
                                                    color: Colors.blue
                                                ),
                                              ),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue
                                                  ),
                                                  borderRadius: BorderRadius.circular(20)
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Center(
                                          child: TextButton(
                                              onPressed: () {
                                                if(int.parse(num_of_lab_assignments.text.toString())>0)
                                                {
                                                  setState(() {
                                                    qulab_visible=true;
                                                    numoflabquiz=int.parse(num_of_lab_assignments.text.toString());
                                                    for(int i=0;i<numoflabquiz;i++)
                                                      {
                                                        lab_total_controllers[i].text="10";
                                                      }
                                                  });
                                                }
                                                else
                                                {
                                                  setState(() {
                                                    qulab_visible=false;
                                                  });
                                                }
                                              }, child: text("Submit", 18, Colors.blue, FontWeight.bold)
                                          ),
                                        ))
                                  ],
                                ),
                                SizedBox(height: size.height*0.03,),
                                Visibility(
                                  replacement: SizedBox(height: 0,),
                                  visible: qulab_visible,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.blue)
                                    ),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: numoflabquiz,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(bottom: 10),
                                              height: 50,
                                              width: 100,
                                              child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                controller: lab_controllers[index],
                                                decoration: InputDecoration(
                                                    labelStyle: TextStyle(color: Colors.blue),
                                                    enabled: true,
                                                    labelText: "Obtained",
                                                    enabledBorder : OutlineInputBorder(
                                                        borderRadius: BorderRadius.all( Radius.circular(10)),
                                                        borderSide: BorderSide(
                                                          color: Colors.black.withOpacity(.5),
                                                        )
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all( Radius.circular(10)),
                                                        borderSide: BorderSide(
                                                          color: Colors.black.withOpacity(.5),
                                                        )
                                                    )
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(bottom: 10),
                                              height: 50,
                                              width: 100,
                                              child: TextFormField(
                                                keyboardType: TextInputType.number,
                                                textAlign: TextAlign.center,
                                                controller: lab_total_controllers[index],
                                                decoration: InputDecoration(
                                                    enabled: true,
                                                    labelStyle: TextStyle(color: Colors.blue),
                                                    labelText: "Total",
                                                    enabledBorder : OutlineInputBorder(
                                                        borderRadius: BorderRadius.all( Radius.circular(10)),
                                                        borderSide: BorderSide(
                                                          color: Colors.black.withOpacity(.5),
                                                        )
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.all( Radius.circular(10)),
                                                        borderSide: BorderSide(
                                                          color: Colors.black.withOpacity(.5),
                                                        )
                                                    )
                                                ),
                                              ),
                                            )
                                          ],
                                        );
                                      },),
                                  ),),
                                SizedBox(height:ass_visible?size.height*0.03:size.height*0.015),



                                Container(
                                  padding: EdgeInsets.only(left: size.height*0.05,right: size.height*0.05),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      text("Mids", 20, Colors.blue, FontWeight.bold),
                                      Switch(value: labmidSwitch, onChanged: (value) {
                                        if(labmidSwitch)
                                        {
                                          setState(() {
                                            labmidSwitch=false;
                                          });
                                        }
                                        else
                                        {
                                          setState(() {
                                            lab_mid_total_controller.text="25";
                                            labmidSwitch=true;
                                          });
                                        }
                                      },),
                                    ],
                                  ),
                                ),
                                SizedBox(height: size.height*0.01,),
                                Visibility(
                                  visible: labmidSwitch,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        height: 50,
                                        width: 100,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: lab_mid_controller,
                                          decoration: InputDecoration(
                                              labelStyle: TextStyle(color: Colors.blue),
                                              enabled: true,
                                              labelText: "Obtained",
                                              enabledBorder : OutlineInputBorder(
                                                  borderRadius: BorderRadius.all( Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black.withOpacity(.5),
                                                  )
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all( Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black.withOpacity(.5),
                                                  )
                                              )
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        height: 50,
                                        width: 100,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          controller: lab_mid_total_controller,
                                          decoration: InputDecoration(
                                              enabled: true,
                                              labelStyle: TextStyle(color: Colors.blue),
                                              labelText: "Total",
                                              enabledBorder : OutlineInputBorder(
                                                  borderRadius: BorderRadius.all( Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black.withOpacity(.5),
                                                  )
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all( Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black.withOpacity(.5),
                                                  )
                                              )
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),


                                Container(
                                  padding: EdgeInsets.only(left: size.height*0.05,right: size.height*0.05),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      text("Final", 20, Colors.blue, FontWeight.bold),
                                      Switch(value: labfinalSwitch, onChanged: (value) {
                                        if(labfinalSwitch)
                                        {
                                          setState(() {
                                            labfinalSwitch=false;
                                          });
                                        }
                                        else
                                        {
                                          setState(() {
                                            lab_final_total_controller.text="50";
                                            labfinalSwitch=true;
                                          });
                                        }
                                      },),
                                    ],
                                  ),
                                ),
                                SizedBox(height: size.height*0.01,),
                                Visibility(
                                  visible: labfinalSwitch,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        height: 50,
                                        width: 100,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller: lab_final_controller,
                                          decoration: InputDecoration(
                                              labelStyle: TextStyle(color: Colors.blue),
                                              enabled: true,
                                              labelText: "Obtained",
                                              enabledBorder : OutlineInputBorder(
                                                  borderRadius: BorderRadius.all( Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black.withOpacity(.5),
                                                  )
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all( Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black.withOpacity(.5),
                                                  )
                                              )
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        height: 50,
                                        width: 100,
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          controller:  lab_final_total_controller,
                                          decoration: InputDecoration(
                                              enabled: true,
                                              labelStyle: TextStyle(color: Colors.blue),
                                              labelText: "Total",
                                              enabledBorder : OutlineInputBorder(
                                                  borderRadius: BorderRadius.all( Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black.withOpacity(.5),
                                                  )
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all( Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black.withOpacity(.5),
                                                  )
                                              )
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                      )

                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () async
                  {

                    if(num_of_assignments.text.toString().isEmpty && num_of_quiz.text.toString().isEmpty && !midSwitch && !finalSwitch && !labfinalSwitch)
                      {
                        Toast_("Nothing to Show");
                      }
                    else
                      {
                        var check=true;

                        if(num_of_assignments.text.toString().isNotEmpty && int.parse(num_of_assignments.text.toString())>0)
                        {
                          numofassignments=int.parse(num_of_assignments.text.toString());
                          for(int i=0;i<numofassignments;i++)
                          {
                            if(assignments_controllers[i].text.toString().isEmpty || assignments_total_controllers[i].text.toString().isEmpty)
                            {
                              check=false;
                            }
                          }
                        }

                        if(num_of_quiz.text.toString().isNotEmpty &&  int.parse(num_of_quiz.text.toString())>0)
                        {
                          numofquiz=int.parse(num_of_quiz.text.toString());
                          for(int i=0;i<numofquiz;i++)
                          {
                            if(quiz_controllers[i].text.toString().isEmpty || quiz_total_controllers[i].text.toString().isEmpty)
                            {
                              check=false;
                            }
                          }
                        }

                        if(labSwitch)
                        {
                          if(num_of_lab_assignments.text.toString().isNotEmpty && int.parse(num_of_lab_assignments.text.toString())>0)
                          {
                            numoflabquiz=int.parse(num_of_lab_assignments.text.toString());
                            for(int i=0;i<numoflabquiz;i++)
                            {
                              if(lab_controllers[i].text.toString().isEmpty || lab_total_controllers[i].text.toString().isEmpty)
                              {
                                check=false;
                              }
                            }
                          }

                          if(labmidSwitch)
                          {
                            if(lab_mid_controller.text.toString().isEmpty || lab_mid_total_controller.text.toString().isEmpty)
                            {
                              check=false;
                            }
                          }
                          if(labfinalSwitch)
                          {
                            if(lab_final_controller.text.toString().isEmpty || lab_final_total_controller.text.toString().isEmpty)
                            {
                              check=false;
                            }
                          }
                        }

                        if(midSwitch)
                        {
                          if(mid_controller.text.toString().isEmpty || mid_total_controller.text.toString().isEmpty)
                          {
                            check=false;
                          }
                        }
                        if(finalSwitch)
                        {
                          if(final_controller.text.toString().isEmpty || final_total_controller.text.toString().isEmpty)
                          {
                            check=false;
                          }
                        }


                        var valuecheck=true;

                        if(check)
                          {
                            if(num_of_assignments.text.toString().isNotEmpty && int.parse(num_of_assignments.text.toString())>0)
                            {
                              numofassignments=int.parse(num_of_assignments.text.toString());
                              for(int i=0;i<numofassignments;i++)
                              {
                                if(double.parse(assignments_controllers[i].text.toString())>double.parse(assignments_total_controllers[i].text.toString()))
                                {
                                  valuecheck=false;
                                }
                              }
                            }
                            if(num_of_quiz.text.toString().isNotEmpty &&  int.parse(num_of_quiz.text.toString())>0)
                            {
                              numofquiz=int.parse(num_of_quiz.text.toString());
                              for(int i=0;i<numofquiz;i++)
                              {
                                if(double.parse(quiz_controllers[i].text.toString())>double.parse(quiz_total_controllers[i].text.toString()))
                                {
                                  valuecheck=false;
                                }
                              }
                            }

                            if(labSwitch)
                            {
                              if(num_of_lab_assignments.text.toString().isNotEmpty && int.parse(num_of_lab_assignments.text.toString())>0 )
                              {
                                numoflabquiz=int.parse(num_of_lab_assignments.text.toString());
                                for(int i=0;i<numoflabquiz;i++)
                                {
                                  if(double.parse(lab_controllers[i].text.toString())>double.parse(lab_total_controllers[i].text.toString()))
                                  {
                                    valuecheck=false;
                                  }
                                }
                              }
                              if(labmidSwitch)
                              {
                                if(double.parse(lab_mid_controller.text.toString())>double.parse(lab_mid_total_controller.text.toString()))
                                {
                                  valuecheck=false;
                                }
                              }
                              if(labfinalSwitch)
                              {
                                if(double.parse(lab_final_controller.text.toString())>double.parse(final_total_controller.text.toString()))
                                {
                                  valuecheck=false;
                                }
                              }
                            }
                            if(midSwitch)
                            {
                              if(double.parse(mid_controller.text.toString())>double.parse(mid_total_controller.text.toString()))
                              {
                                valuecheck=false;
                              }
                            }
                            if(finalSwitch)
                            {
                              if(double.parse(final_controller.text.toString())>double.parse(final_total_controller.text.toString()))
                              {
                                valuecheck=false;
                              }
                            }
                            if(!valuecheck)
                            {
                              Toast_("Obtain marks are greater than Total");
                            }
                          }


                        if(!check)
                          {
                            Toast_("Please fill values correctly");
                          }
                        if(!valuecheck)
                        {
                          Toast_("Obtain marks are Greater than total");
                        }


                        if(check && valuecheck)
                          {
                            setState(() {
                              button=true;
                            });

                            await Future.delayed(Duration(seconds: 1));

                            // Calculate assignments
                            double assignemnt=0;
                            double quiz=0;
                            double mid=0;
                            double final_=0;
                            double lab=0;
                            double theory_total=0;
                            // Calculate Quiz
                            if(numofassignments>0)
                            {
                              for(int i=0;i<numofassignments;i++)
                              {
                                if(assignments_controllers[i].text.toString().isEmpty || assignments_total_controllers[i].text.toString().isEmpty)
                                {
                                  ass_check=false;
                                }
                              }
                              if(ass_check)
                              {
                                double total_obtained=0;
                                double total=0;

                                for(int i=0;i<numofassignments;i++)
                                {
                                  total_obtained=total_obtained+double.parse(assignments_controllers[i].text.toString());
                                }
                                for(int i=0;i<numofassignments;i++)
                                {
                                  total=total+double.parse(assignments_total_controllers[i].text.toString());
                                }

                                assignemnt = (total_obtained/total)*10;

                              }else
                              {
                                Toast_("Please Enter Correct Values");
                              }


                            }


                            if(numofquiz>0)
                            {
                              for(int i=0;i<numofquiz;i++)
                              {
                                if(quiz_controllers[i].text.toString().isEmpty || quiz_total_controllers[i].text.toString().isEmpty)
                                {
                                  quiz_check=false;
                                }
                              }
                              if(quiz_check)
                              {
                                double total_obtained=0;
                                double total=0;
                                for(int i=0;i<numofquiz;i++)
                                {
                                  total_obtained=total_obtained+double.parse(quiz_controllers[i].text.toString());
                                  total=total+double.parse(quiz_total_controllers[i].text.toString());
                                }
                                quiz=(total_obtained/total)*15;
                              }
                              else
                              {
                                Toast_("Please Enter Correct Values");
                              }
                            }



                            if(midSwitch)
                            {
                              if(mid_controller.text.toString().isEmpty || mid_total_controller.text.toString().isEmpty)
                              {
                                Toast_("Please fill Value Correct");
                              }else
                              {
                                mid=(double.parse(mid_controller.text.toString())/double.parse(mid_total_controller.text.toString()))*25;
                              }
                            }



                            if(finalSwitch)
                            {
                              if(final_controller.text.toString().isEmpty || final_total_controller.text.toString().isEmpty)
                              {
                                Toast_("Please fill Value Correct");
                              }else
                              {
                                final_=(double.parse(final_controller.text.toString())/double.parse(final_total_controller.text.toString()))*50;

                              }
                            }

                            if(numofassignments>0 && numofquiz>0 && midSwitch && finalSwitch)
                            {
                              theory_total=assignemnt+quiz+mid+final_;
                            }



                            if(labSwitch)
                            {
                              double lab_obtain=0;
                              double lab_total=0;
                              double lab_quiz=0;
                              double lab_final=0;
                              double lab_mid=0;
                              if(int.parse(num_of_lab_assignments.text.toString())>0)
                              {

                                for(int i=0;i<numoflabquiz;i++)
                                {
                                  if(lab_controllers[i].text.isEmpty || lab_total_controllers[i].text.isEmpty)
                                  {
                                    lab_assign_check=false;
                                  }
                                }
                                if(lab_assign_check)
                                {
                                  for(int i=0;i<numoflabquiz;i++)
                                  {
                                    lab_obtain=lab_obtain+double.parse(lab_controllers[i].text.toString());
                                    lab_total=lab_total+double.parse(lab_total_controllers[i].text.toString());
                                  }
                                  lab_quiz=(lab_obtain/lab_total)*25;
                                }
                                else
                                {
                                  Toast_("Please Enter Correct Value");
                                }
                              }
                              if(labmidSwitch)
                              {
                                if(lab_mid_controller.text.isNotEmpty && lab_mid_total_controller.text.isNotEmpty)
                                {
                                  lab_mid=(double.parse(lab_mid_controller.text.toString())/double.parse(lab_mid_controller.text.toString()))*25;
                                }
                              }
                              else
                              {
                                Toast_("Please Enter Correct Values");
                              }

                              if(labfinalSwitch)
                              {
                                if(lab_final_controller.text.isNotEmpty && lab_final_total_controller.text.isNotEmpty)
                                {
                                  lab_final=(double.parse(lab_final_controller.text.toString())/double.parse(lab_final_controller.text.toString()))*50;
                                }
                              }
                              else
                              {
                                Toast_("Please Enter Correct Values");
                              }

                              lab=((lab_quiz+lab_mid+lab_final)/100)*25;
                              theory_total=((theory_total/100)*75)+lab;
                            }

                            Navigator.push(context, MaterialPageRoute(builder: (context) => Result(num_of_assignments.text.toString().isEmpty?999:assignemnt,
                                num_of_quiz.text.toString().isEmpty?999:quiz,
                                midSwitch?mid:999,
                                finalSwitch?final_:999,
                                labSwitch?lab:999,
                                (num_of_assignments.text.toString().isNotEmpty &&
                                num_of_quiz.text.toString().isNotEmpty &&
                                    midSwitch && finalSwitch
                                )?theory_total:999),));

                            setState(() {
                              button=false;
                            });
                          }

                      }

                  },
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
                    ),
                    child: Center(child: button?Container(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white,)):text("Calculate", 20, Colors.white, FontWeight.bold)),
            ),
                ))
          ],
        ),
      ),
    );
  }
}
