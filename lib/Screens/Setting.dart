import 'dart:io';

import 'package:cui_aider/Screens/Home_Page.dart';
import 'package:cui_aider/Utils/Toast.dart';
import 'package:cui_aider/Widgets/text.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  var imageUrl="";
  File? file;
  String url="";
  var loading=false;
  var name_controller = TextEditingController();
  var password_controller = TextEditingController();
  var rollno_controller = TextEditingController();
  var portalpass_controller = TextEditingController();
  var sizer=true;
  var _formkey = GlobalKey<FormState>();
  String temp1 = "";
  String name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var e = FirebaseAuth.instance.currentUser!.email.toString();
    for (int i = 0; i < e.indexOf("@"); i++) {
      temp1 = temp1 + e.characters.elementAt(i);
    }
    var pref = await SharedPreferences.getInstance();
    setState(() {
      name_controller.text = pref.getString("NAME")!;
    });
    var database=FirebaseDatabase.instance.ref('User');
    database.onValue.listen((event) {
      setState(() {
        password_controller.text=event.snapshot.child(temp1).child("password").value.toString();
        imageUrl=event.snapshot.child(temp1).child("profile").value.toString();
      });
    });
    database=FirebaseDatabase.instance.ref('Portal');
    database.onValue.listen((event) {
      setState(() {
        rollno_controller.text=event.snapshot.child(temp1).child("Roll No").value.toString();
        portalpass_controller.text=event.snapshot.child(temp1).child("Portal Pass").value.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [Colors.blue, Colors.blue, Colors.blue])),
            child: Form(
              key: _formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 80,
                    ),
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async{
                                final filePicked=await ImagePicker().pickImage(source: ImageSource.gallery);
                                if(filePicked!=null)
                                {
                                  setState(() {
                                    file=File(filePicked.path);
                                  });
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Container(
                                  color: Colors.white,
                                  height: 100,
                                  width: 100,
                                  child: Image.file(
                                    file==null?
                                    File(
                                        "/storage/emulated/0/Android/data/com.comsats.aider/files/$temp1.jpeg"):File(file!.path),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            text(
                                FirebaseAuth.instance.currentUser!.email
                                    .toString(),
                                15,
                                Colors.white,
                                FontWeight.normal)
                          ],
                        )),
                    Expanded(
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                    topRight: Radius.circular(60))),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.all(30),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: sizer?140:190,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color:
                                                    Colors.blue.withOpacity(.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Colors
                                                            .grey[200]!))),
                                            child: TextFormField(
                                              controller: name_controller,
                                              validator: (value) {
                                                if (!value!.isEmpty) {
                                                  return null;
                                                } else {
                                                  return "Please Enter Correct Name";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                  hintText: "Name",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: Colors
                                                            .grey[200]!))),
                                            child: TextFormField(
                                              obscureText: true,
                                              controller: password_controller,
                                              validator: (value) {
                                                if (!value!.isEmpty && value.length>6) {
                                                  return null;
                                                } else {
                                                  return "Please Enter Correct Password";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                  hintText: "Password",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      height:sizer?140:190,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                                color:
                                                    Colors.blue.withOpacity(.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color:
                                                            Colors.grey[200]!))),
                                            child: TextFormField(
                                              controller: rollno_controller,
                                              validator: (value) {
                                                if (!value!.isEmpty && value.length==12) {
                                                  return null;
                                                } else {
                                                  return "Please Enter Correct RollNo";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                  hintText: "Roll No",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color:
                                                            Colors.grey[200]!))),
                                            child: TextFormField(
                                              obscureText: true,
                                              controller: portalpass_controller,
                                              validator: (value) {
                                                if (!value!.isEmpty) {
                                                  return null;
                                                } else {
                                                  return "Please Enter Correct Password";
                                                }
                                              },
                                              decoration: InputDecoration(
                                                  hintText: "Password",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey),
                                                  border: InputBorder.none),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 50,),
                                    InkWell(
                                      onTap: ()
                                      async {
                                        if(_formkey.currentState!.validate())
                                          {
                                            setState(() {
                                              loading=true;
                                              sizer=true;
                                            });

                                            if(file!=null)
                                            {
                                              FirebaseStorage storage=FirebaseStorage.instance;
                                              var sref=storage.ref('$temp1.jpeg');
                                              var uploadtask=sref.putFile(file!.absolute);
                                              await Future.value(uploadtask);
                                              url=await sref.getDownloadURL();
                                            }
                                            else
                                              {
                                                url=imageUrl;
                                              }
                                            downloadFile("$temp1.jpeg", url, 0);















                                          }else
                                            {
                                              setState(() {
                                                sizer=false;
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
                                          child:loading?Container(height: 15,width: 15,child: CircularProgressIndicator(color: Colors.white,),): Text("Update", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )))
                  ]),
            )));
  }
  Future<void> downloadFile(String name,String url,int ind) async {
    try {
      final Directory? directory = await getExternalStorageDirectory();
      final String path = '${directory?.path}/$name';
      final Dio dio = Dio();

      // await Future.delayed(Duration(seconds: ind==0?3:5));
      await dio.download(url, path).then((value){
      }).then((value) {
        var database=FirebaseDatabase.instance.ref("User");
        database.child(temp1).update({
          "name" : name_controller.text.toString(),
          "profile" : url
        }).then((value) {
          database=FirebaseDatabase.instance.ref("Portal");
          database.child(temp1).update({
            "Portal Pass" : portalpass_controller.text.toString(),
            "Roll No" : rollno_controller.text.toString()
          }).then((value)async {
            Toast_("Successfully Updated");
            SharedPreferences pref= await SharedPreferences.getInstance();
            pref.setString("NAME", name_controller.text.toString());
            pref.setString("ROLLNO", rollno_controller.text.toString());
            pref.setString("PASS", portalpass_controller.text.toString());
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
          }).onError((error, stackTrace) {
            setState(() {
              loading=false;
            });
            Toast_("Error try Again");
          });
        }).onError((error, stackTrace) {
          setState(() {
            loading=false;
          });
          Toast_("Error try Again");
        });


      });
      // print('${directory?.path}');

      // print("Successfully downloaded ${response.data} bytes.");

    } catch (e) {
      Toast_("Error while Updating Picture");
    }
  }
}
