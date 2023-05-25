import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rive/rive.dart';

import '../Screens/Home_Page.dart';
import '../Utils/Toast.dart';
import '../Utils/Utils.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late RiveAnimationController controller;
  late RiveAnimationController controller1;
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
  var _formkey=GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    controller=OneShotAnimation("active",
    autoplay: false
    );
    controller1=OneShotAnimation("active",
        autoplay: false
    );
    super.initState();
  }


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
      body:  Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width*1.7,
            left: 100,
            bottom: 100,
            child: Image.asset("Assets/images/Spline.png"),
          ),
          Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 20,sigmaX: 20),
                child: SizedBox(),
              )),
          Positioned.fill(child: RiveAnimation.asset("Assets/riv/shapes.riv",)),
          Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 40,sigmaX: 40),
                child: SizedBox(),
              )),
          AnimatedPositioned(
            top: 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: const [
                          Text(
                            "Learn design & code",
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    InkWell(
                      onTap: () async{
                        setState(() {
                          controller.isActive=true;
                        });
                        await Future.delayed(Duration(milliseconds: 600));
                        showGeneralDialog(
                          context: context,
                          barrierLabel: "Barrier",
                          barrierDismissible: true,
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionDuration: const Duration(milliseconds: 400),
                          pageBuilder: (_, __, ___) {
                            return Center(
                              child: Container(
                                height: 630,
                                margin: const EdgeInsets.symmetric(horizontal: 16),
                                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.95),
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(0, 30),
                                      blurRadius: 60,
                                    ),
                                    const BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(0, 30),
                                      blurRadius: 60,
                                    ),
                                  ],
                                ),
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Scaffold(
                                      backgroundColor: Colors.transparent,
                                      body: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(
                                                    signup?"Sign up":"Sign in",
                                                    style: TextStyle(
                                                      fontSize: 34,
                                                      fontFamily: "Poppins",
                                                      fontWeight: FontWeight.w600,
                                                    ),
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
                                              const Padding(
                                                padding: EdgeInsets.symmetric(vertical: 5),
                                                child: Text(
                                                  "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                              SizedBox(height: 20,),
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


                                              SizedBox(height: 20,),
                                              InkWell(
                                                onTap: ()
                                                {
                                                  controller1.isActive=true;

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
                                                child: SizedBox(
                                                  height: 64,
                                                  width: 236,
                                                  child: Stack(
                                                    children: [
                                                      RiveAnimation.asset(
                                                        "Assets/riv/button.riv",
                                                        controllers: [controller1],
                                                      ),
                                                      Positioned.fill(
                                                        top: 8,
                                                        child: buttonPressed?Container(height: 15,width: 15,child: CircularProgressIndicator(color: Colors.blue,),):Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            const Icon(Icons.arrow_right),
                                                            const SizedBox(width: 8),
                                                            Text(
                                                              signup?"Sign up":"Sign in",
                                                              style: Theme.of(context).textTheme.button,
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20,),
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
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  child: Text(
                                                    "Already have an Account",
                                                    style: TextStyle(color: Colors.black54),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),

                                        ],
                                      ),
                                    );
                                  },
                                )
                              ),
                            );
                          },
                          transitionBuilder: (_, anim, __, child) {
                            Tween<Offset> tween;

                            tween = Tween(begin: const Offset(0, -1), end: Offset.zero);

                            return SlideTransition(
                              position: tween.animate(
                                CurvedAnimation(parent: anim, curve: Curves.easeInOut),
                              ),
                              // child: FadeTransition(
                              //   opacity: anim,
                              //   child: child,
                              // ),
                              child: child,
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 64,
                        width: 236,
                        child: Stack(
                          children: [
                            RiveAnimation.asset(
                              "Assets/riv/button.riv",
                              controllers: [controller],
                            ),
                            Positioned.fill(
                              top: 8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.arrow_right),
                                  const SizedBox(width: 8),
                                  Text(
                                    "Start the course",
                                    style: Theme.of(context).textTheme.button,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
