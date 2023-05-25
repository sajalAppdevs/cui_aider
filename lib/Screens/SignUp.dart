import 'dart:async';
import 'dart:io';

import 'package:cui_aider/Screens/Home.dart';
import 'package:cui_aider/Screens/SignIn.dart';
import 'package:cui_aider/Utils/Toast.dart';
import 'package:cui_aider/Utils/Utils.dart';
import 'package:cui_aider/Widgets/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home_Page.dart';
import 'Test.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  
  File? image;
  String path="";
  var signup=true;
  var visibility=true;
  String temp="";
  var buttonPressed=false;
  var url="";
  var database=FirebaseDatabase.instance.ref("User");
  var auth=FirebaseAuth.instance;
  var name=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController();
  final _formkey=GlobalKey<FormState>();


  upLoad() async
  {
    if(image!=null)
    {
      FirebaseStorage storage=FirebaseStorage.instance;
      var sref=storage.ref('$temp.jpeg');
      var uploadtask=sref.putFile(image!.absolute);
     await Future.value(uploadtask);
       url=await sref.getDownloadURL();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(signup?"Sign Up":"Sign In", style: TextStyle(color: Colors.white, fontSize: 40),),
                      SizedBox(height: 10,),
                      Text(signup?"Lets get Started":"Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),),
                    ],
                  ),
                  Visibility(
                    visible: signup,
                    maintainSize: true,
                    maintainState: true,
                    maintainAnimation: true,
                    child: InkWell(

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          color: Colors.white,
                          height: 100,
                          width: 100,
                          child: image==null?Stack(
                            children: [
                              Center(child: FlutterLogo(size: 60,)),
                              Positioned(
                                  bottom: 1,
                                  child: InkWell(
                                    onTap: () async{
                                      final filePicked=await ImagePicker().pickImage(source: ImageSource.gallery);
                                      if(filePicked!=null)
                                      {
                                        setState(() {
                                          image=File(filePicked.path);
                                          path=filePicked.path;
                                          print(path);
                                        });
                                      }
                                      else
                                      {
                                        setState(() {
                                          path="";
                                        });
                                      }
                                    },
                                    child: Container(
                                height: 20,
                                      width: 100,
                                      padding: EdgeInsets.only(bottom: 10),
                                      color: Colors.black.withOpacity(.1),
                                      child: Center(child: Icon(Icons.camera_alt_outlined),),
                              ),
                                  ))
                            ],
                          ):Image.file(image!.absolute,fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                  ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AnimatedContainer(
                          duration: Duration(milliseconds: 600),
                          height: signup?MediaQuery.of(context).size.height/3.6:MediaQuery.of(context).size.height/5.5,
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
                            child: Stack(
                              children: <Widget>[
                                Visibility(
                                  visible: visibility,
                                  maintainState: false,
                                  maintainSize: false,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey[200]!))
                                    ),
                                    child: TextFormField(
                                      controller: name,
                                      validator: (value){
                                        if(!value!.isEmpty) {
                                          return null;
                                        }
                                        else {
                                          return "Please Enter Correct Name";
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Name",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: visibility?Alignment.center:Alignment.topCenter,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey[200]!))
                                    ),
                                    child: TextFormField(
                                      validator: (value){
                                        if(!value!.isEmpty) {
                                          return null;
                                        }
                                        else {
                                          return "Please Enter Correct Email";
                                        }
                                      },
                                      controller: email,
                                      decoration: InputDecoration(
                                          hintText: "Email",
                                          hintStyle: TextStyle(color: Colors.grey),
                                          border: InputBorder.none
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(color: Colors.grey[200]!))
                                    ),
                                    child: TextFormField(
                                      validator: (value){
                                        if(!value!.isEmpty) {
                                          return null;
                                        }
                                        else {
                                          return "Please Enter Correct Password";
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40,),
                        InkWell(
                            onTap: () async
                            {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(),));
                              if(signup)
                                {
                                  setState(() {
                                    // visibility=false;
                                    signup=false;
                                    Timer(Duration(milliseconds: 200), () {
                                      setState(() {
                                        visibility=false;
                                      });
                                    });
                                  });
                                }
                              else
                                {
                                  setState(()  {
                                    signup=true;
                                    Timer(Duration(milliseconds: 200), () {
                                      setState(() {
                                        visibility=true;
                                      });
                                    });
                                  });
                                }


                            },
                            child: Text(signup?"Already have an account?":"Don't have an account?", style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 40,),
                        InkWell(
                          onTap: ()
                          {
                            if(signup)
                              {
                                if(_formkey.currentState!.validate())
                                {
                                  setState(() {
                                    buttonPressed=true;
                                  });


                                  var n=name.text.toString();
                                  var p=password.text.toString();
                                  var e=email.text.toString();



                                  for(int i=0;i<e.indexOf("@");i++)
                                  {
                                    temp=temp+e.characters.elementAt(i);
                                  }
                                  auth.createUserWithEmailAndPassword(email: e, password: p).then((value) async {
                                    if(image!=null)
                                      {
                                        Utils().toast("Successfull");
                                        // upLoad();

                                        FirebaseStorage storage=FirebaseStorage.instance;
                                        var sref=storage.ref('$temp.jpeg');
                                        var uploadtask=sref.putFile(image!.absolute);
                                        await Future.value(uploadtask).then((v) {
                                          sref.getDownloadURL().then((val) {

                                            print("Check");
                                            database.child(temp).set({
                                              'name' : n,
                                              'password' : p,
                                              'email' : e,
                                              'profile' : val,
                                            }
                                            ).onError((error, stackTrace) => Utils().toast(error.toString()));
                                            setState(() {
                                              buttonPressed=false;
                                            });

                                            Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => Home(),));
                                          });
                                        });
                                      }else
                                        {
                                          database.child(temp).set({
                                            'name' : n,
                                            'password' : p,
                                            'email' : e,
                                            'profile' : null,
                                          }
                                          ).onError((error, stackTrace) => Utils().toast(error.toString()));
                                          setState(() {
                                            buttonPressed=false;
                                          });
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => Home(),));
                                        }



                                  }
                                  ).onError((error, stackTrace) {Utils().toast(error.toString());
                                  setState(() {
                                    buttonPressed=false;
                                  });
                                  });
                                }
                              }
                            else
                              {
                                setState(() {
                                  buttonPressed=true;
                                });
                                if(_formkey.currentState!.validate())
                                {
                                  var p=password.text.toString();
                                  var e=email.text.toString();
                                  auth.signInWithEmailAndPassword(email: e, password: p).then((value) {
                                    setState(() {
                                      buttonPressed=false;
                                    });
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
                                  }).onError((error, stackTrace) {
                                    setState(() {
                                      buttonPressed=false;
                                    });
                                    Toast_("Wrong Email or Password");
                                  },);
                                }
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
                              child: buttonPressed?Container(height: 20,width: 20,child: CircularProgressIndicator(),):Text(signup?"Sign Up":"Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Text("Continue with social media", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 30,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child:  InkWell(
                                onTap: () async{

                                  final GoogleSignIn _googleSignIn = GoogleSignIn();
                                  final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
                                  final GoogleSignInAuthentication googleSignInAuthentication =
                                      await googleSignInAccount!.authentication;

                                  final AuthCredential credential = GoogleAuthProvider.credential(
                                    accessToken: googleSignInAuthentication.accessToken,
                                    idToken: googleSignInAuthentication.idToken,
                                  );
                                  //
                                  // print("Working");
                                  // auth.signInWithCredential(credential).then((value) {
                                  //   String? e=value.user!.email;
                                  //   for(int i=0;i<e!.indexOf("@");i++)
                                  //   {
                                  //     temp=temp+e.characters.elementAt(i);
                                  //   }
                                  //
                                  //
                                  //   database.child(temp).set({
                                  //     'name' : value.user!.displayName,
                                  //     'password' : value.user!.uid,
                                  //     'email' : value.user!.email,
                                  //     'profile' : value.user!.photoURL,
                                  //   });
                                  //   Toast_("SuccessFull");
                                  //   Navigator.push(context,  MaterialPageRoute(builder: (context) => Home(),));
                                  // }).onError((error, stackTrace) {
                                  //   print("HHHHHH");
                                  //   print(error.toString());
                                  // });
                                  UserCredential crefit=await FirebaseAuth.instance.signInWithCredential(credential);
                                  Toast_(crefit.user!.displayName!);
                                  Toast_("Success");




                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.blue
                                  ),
                                  child: Center(
                                    child: Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                              child:  Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue
                                ),
                                child: Center(
                                  child: Text("Facebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              ),
                            )
                          ],
                        )
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
