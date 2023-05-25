import 'dart:async';

import 'package:cui_aider/Screens/Gpa_Calculator.dart';
import 'package:cui_aider/Widgets/Result_Card.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  double assignment=0;
  double mid=0;
  double quiz=0;
  double final_=0;
  double total=0;
  double lab=0;
  Result(this.assignment,this.quiz,this.mid,this.final_,this.lab,this.total);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {



  double height=0;
  double weight=0;
  var anim=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animator();
  }
  animator() async
  {
    Timer(Duration.zero, () {
      setState(() {
        anim=true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    var assignment_v=widget.assignment==999?false:true;
    var quiz_v=widget.quiz==999?false:true;
    var mid_v=widget.mid==999?false:true;
    var terminal_v=widget.final_==999?false:true;
    var lab_v=widget.lab==999?false:true;
    var total_v=widget.total==999?false:true;




    height=MediaQuery.of(context).size.height;
    weight=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Result",style: TextStyle(color: Colors.black),),
          leading: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: ()
                  {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Gpa_Calculator(),));
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
        height: height,
        width: weight,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Visibility(
                visible: assignment_v,
                maintainState: true,
                maintainAnimation: true,
                child: Container(
                  height: 150,
                  width: weight,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          left: anim?1:-100,
                          right: anim?1:100,
                          child: Result_Card("Assignments",widget.assignment.toString())),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: quiz_v,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  height: 150,
                  width: weight,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 400),
                        right: anim?1:-100,
                        left: anim?1:100,
                        child:  Result_Card("Quiz",widget.quiz.toString()),),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: mid_v,
                maintainState: true,
                maintainAnimation: true,
                child: Container(
                  height: 150,
                  width: weight,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 400),
                        left: anim?1:-100,
                        right: anim?1:100,
                        child:  Result_Card("Mid",widget.mid.toString()),),
                    ],
                  ),
                ),
              ),

              Visibility(
                visible: terminal_v,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  height: 150,
                  width: weight,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 400),
                        right: anim?1:-100,
                        left: anim?1:100,
                        child: Result_Card("Terminal",widget.final_.toString()),),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: lab_v,
                maintainState: true,
                maintainAnimation: true,
                child: Container(
                  height: 150,
                  width: weight,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 400),
                        left: anim?1:-100,
                        right: anim?1:100,
                        child: Result_Card("Lab",widget.lab.toString()),),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: total_v,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  height: 150,
                  width: weight,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          right: anim?1:-100,
                          left: anim?1:100,
                          child:  Result_Card("Total",widget.total.toString()),),
                    ],
                  ),
                ),
              ),



              Visibility(
                visible: false,
                child: Container(
                  height: 150,
                  width: weight,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          right: anim?1:-100,
                          left: anim?1:100,
                          child:  Result_Card("GPA","4.0"),),
                    ],
                  ),
                ),
              ),











            ],
          ),
        ),
      ),
    );
  }
}
