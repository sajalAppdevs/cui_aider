import 'package:cui_aider/Screens/Portal.dart';
import 'package:cui_aider/Utils/Toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Portal_Password extends StatefulWidget {
  const Portal_Password({Key? key}) : super(key: key);

  @override
  State<Portal_Password> createState() => _Portal_PasswordState();
}

class _Portal_PasswordState extends State<Portal_Password> {
  var email=TextEditingController();
  var password=TextEditingController();
  int count=0;
  int count1=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  var click=false;
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.blue,
                  Colors.blue,
                  Colors.blue
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Portal", style: TextStyle(color: Colors.white, fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                  color: Colors.blue.withOpacity(.5),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )]
                          ),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]!))
                                  ),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      if(value.length==4){
                                        count++;
                                      if(count==0 || count%2==1)
                                        {
                                            setState(() {
                                              email.text="${email.text}-";
                                              email.selection = TextSelection.collapsed(offset: 5);
                                            });
                                        }}

                                      if(value.length==8)
                                      {
                                        count1++;
                                        if(count1==0 || count1%2==1)
                                          {
                                            setState(() {
                                              email.text="${email.text}-";
                                              email.selection = TextSelection.collapsed(offset: 9);
                                            });
                                          }
                                      }
                                    },
                                    validator: (value){
                                      if(!value!.isEmpty && value.length==12) {
                                        return null;
                                      }
                                      else {
                                        return "Enter Correct Roll No";
                                      }
                                    },
                                    controller: email,
                                    decoration: InputDecoration(
                                        hintText: "Roll No",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]!))
                                  ),
                                  child: TextFormField(
                                    obscureText: true,
                                    validator: (value){
                                      if(!value!.isEmpty) {
                                        return null;
                                      }
                                      else {
                                        return "Enter Correct Password";
                                      }
                                    },
                                    controller: password,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        SizedBox(height: 40,),
                        InkWell(
                          onTap: ()async {
                            if(_formkey.currentState!.validate())
                              {
                                setState(() {
                                  click=true;
                                });
                                SharedPreferences pref=await SharedPreferences.getInstance();
                                FirebaseAuth auth=FirebaseAuth.instance;
                                String e=auth.currentUser!.email.toString();
                                String temp="";
                                for(int i=0;i<e.indexOf("@");i++)
                                {
                                  temp=temp+e.characters.elementAt(i);
                                }

                                var database=FirebaseDatabase.instance.ref('Portal');
                                database.child(temp).set({
                                  "Roll No" : email.text.toString(),
                                  "Portal Pass" : password.text.toString()
                                }).then((value) {
                                  pref.setString("ROLLNO", email.text.toString());
                                  pref.setString("PASS", password.text.toString());
                                  setState(() {
                                    click=false;
                                  });
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Portal(),));
                                }).onError( (error, stackTrace) {
                                  setState(() {
                                    click=false;
                                  });
                                  Toast_("Connection Error");
                                });

                              }
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.orange[900]
                            ),
                            child: Center(
                              child: click?Container(height: 20,width: 20,child: CircularProgressIndicator(),):Text("Save", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Text("Continue with social media", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 30,),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
