import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:cui_aider/About/Hammad.dart';
import 'package:cui_aider/Animated_Screens/Account.dart';
import 'package:cui_aider/Drawer/Drawer_.dart';
import 'package:cui_aider/Screens/Portal_password.dart';
import 'package:cui_aider/Screens/Setting.dart';
import 'package:cui_aider/Screens/SignUp.dart';
import 'package:cui_aider/Screens/Test_1.dart';
import 'package:cui_aider/Utils/Toast.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:cui_aider/Clicks/Gpa_click.dart';
import 'package:cui_aider/Screens/Test.dart';
import 'package:cui_aider/Screens/VR.dart';
import 'package:cui_aider/Widgets/Slider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cui_aider/Widgets/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
_HomeState v=_HomeState();
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late RiveAnimationController _riveAnimationController;
  bool pic=false;
  File? _image;
  String temp1="";
  String temp="";
  var name1="";
  double opacity=0.0;
  var hasName=false;
  var database=FirebaseDatabase.instance.ref("User");
  @override
  void initState() {
    _riveAnimationController=OneShotAnimation("animationName",autoplay: false);
    super.initState();
    profilepic();
    animator();
    check();
  }
  profilepic()async
  {
    var e=FirebaseAuth.instance.currentUser!.email.toString();
    for(int i=0;i<e.indexOf("@");i++)
    {temp1=temp1+e.characters.elementAt(i);}
    bool pic1=await File('/storage/emulated/0/Android/data/com.comsats.aider/files/$temp1.jpeg').exists();
    setState(() {
      pic=pic1;
    });
    if(pic)
      {_image=File("/storage/emulated/0/Android/data/com.comsats.aider/files/$temp1.jpeg");} else
      {String url="";
        var dataref=FirebaseDatabase.instance.ref('User').child(temp1);
        dataref.onValue.listen((event)  {
          url=event.snapshot.child("profile").value.toString();
          downloadFile("$temp1.jpeg", url, 0);
        });
      }
  }
  var anim=false;
  animator() async
  {
    Timer(Duration.zero, () {
      setState(() {
        if(anim)
          {
            anim=false;
            opacity=0.0;
          }else
            {
              anim=true;
              opacity=1.0;
            }

      });
    });
  }



  check() async
  {
    SharedPreferences perf=await SharedPreferences.getInstance();
    if(!(perf.getString("NAME")==null))
      {
        setState(() {
          hasName=true;
          name1=perf.getString("NAME")!;
        });
      }else
        {
          String? temp1=FirebaseAuth.instance.currentUser?.email.toString();
          temp=temp1.toString();
          for(int i=0;i<temp.indexOf("@");i++)
          {
            name=name+temp.characters.elementAt(i);
          }
          database.onValue.listen((event) {
            if(perf.getString("NAME")==null)
            {
              perf.setString("NAME", event.snapshot.child(name).child("name").value.toString());
              setState(() {
                name1=perf.getString("NAME")!;
              });
            }
            print(name1);
          });
          setState(() {
            hasName=false;
          });
          Timer(Duration(seconds: 2),(){
            setState(() {
              hasName=true;
            });
          });
        }


  }
  var isDrawer=false;
  double xOffset=0;
  double L1xOffset=0;
  double L1yOffset=0;
  double yOffset=0;
  double angle=0;
  double L1angle=0;
  var name="";
  late Size size;


  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    double hight=size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              width: size.width*1.7,
              bottom: 100,
              left: 100,
              child: Image.asset("Assets/images/Spline.png")),
          Positioned.fill(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 50,sigmaY: 50),child: SizedBox(),)),
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Drawer__(),
                  Layer1(),
                  AnimatedContainer(
                      duration: Duration(milliseconds: 600),
                      transform: Matrix4Transform().translate(x: xOffset,y: yOffset).rotate(angle).matrix4,
                      height: size.height,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(isDrawer?10:0),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height*0.11,
                              width: MediaQuery.of(context).size.width,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      margin: EdgeInsets.only(left: 20),
                                      child: InkWell(
                                        onTap: () async {
                                          if(isDrawer)
                                          {
                                            setState(() {
                                              xOffset=0;
                                              yOffset=0;
                                              angle=0;

                                              L1xOffset=0;
                                              L1yOffset=0;
                                              L1angle=0;

                                              isDrawer=false;
                                            });
                                          }
                                          else
                                          {
                                            setState(() {
                                              _riveAnimationController.isActive=true;
                                            });
                                            setState(() {
                                              xOffset=150;
                                              yOffset=80;
                                              angle=-0.2;

                                              L1xOffset=122;
                                              L1yOffset=110;
                                              L1angle=-0.23;

                                              isDrawer=true;

                                            });
                                          }
                                        },

                                        child:RiveAnimation.asset("Assets/riv/menu_button.riv",controllers: [_riveAnimationController],),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 60,
                                    width: 200,
                                    child: Stack(
                                      children: [
                                        AnimatedPositioned(
                                          duration: Duration(milliseconds: 400),
                                          left: anim?50:-200,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  text("Hi ", 28, Colors.blue, FontWeight.bold),
                                                  hasName?text("$name1", 28, Colors.blue, FontWeight.bold):Container(
                                                    margin: EdgeInsets.only(left: 30),
                                                    height: 15,width: 15,child: CircularProgressIndicator(color: Colors.blue,),),
                                                ],
                                              ),
                                              text("Let's get started", 15, Colors.blue,
                                                  FontWeight.bold),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 110,
                                    width: 150,
                                    child: Stack(
                                      children: [
                                        AnimatedPositioned(
                                          top: 1,
                                          right: anim?30:-200,
                                          duration: Duration(milliseconds: 400),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Container(
                                              height: 100,
                                              width: 100,
                                              child: pic?Image.file(File("/storage/emulated/0/Android/data/com.comsats.aider/files/$temp1.jpeg"),fit: BoxFit.cover,):
                                              Image(image: AssetImage("Assets/images/launcher.jpeg")),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            AnimatedOpacity(
                                opacity: opacity,
                                duration: Duration(milliseconds: 700),
                                child: Image_Slider()),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Container(
                                height: 30,
                                width: 300,
                                child:
                                Stack(
                                  children: [
                                    AnimatedPositioned(
                                        left: anim?size.width * 0.1:-200,
                                        duration: Duration(milliseconds: 400),
                                        child: text("Select Option", 25, Colors.blue, FontWeight.bold)),
                                  ],
                                )),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Container(
                              width: size.width,
                              height: size.height/8,
                              margin: EdgeInsets.only(left: size.width * 0.1,right: size.width * 0.1 ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Stack(
                                      children: [
                                        AnimatedPositioned(
                                          duration: Duration(milliseconds: 400),
                                          top: anim?1:-100,
                                          child: AnimatedOpacity(
                                            duration: Duration(milliseconds: 400),
                                            opacity: opacity,
                                            child: InkWell(
                                              onTap: () async{
                                                var status = await Permission.storage.status;
                                                if (status.isDenied) {
                                                  Map<Permission, PermissionStatus> statuses = await [
                                                    Permission.location,
                                                    Permission.storage,
                                                  ].request();
                                                  print(statuses[Permission.location]);
                                                }
                                                else if(status.isGranted)
                                                {
                                                  animator();
                                                  await Future.delayed(const Duration(milliseconds: 400));
                                                  bool filecheck=await File("/storage/emulated/0/Android/data/com.comsats.aider/files/admin.jpeg").exists() && await File("/storage/emulated/0/Android/data/com.comsats.aider/files/innergate.jpeg").exists();
                                                  if(!filecheck)
                                                  {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Test(),));
                                                  }
                                                  else
                                                  {
                                                    Timer(Duration.zero,(){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context) => VR(),));
                                                    });
                                                  }
                                                  animator();
                                                }
                                                else if(status.isRestricted)
                                                {
                                                  openAppSettings();
                                                }

                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: size.height / 12,
                                                    width: size.height / 12,
                                                    decoration: const BoxDecoration(

                                                        image: DecorationImage(
                                                            image: AssetImage("Assets/images/vr_ic.png"),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.009,
                                                  ),
                                                  text("VR", 15, Colors.blue, FontWeight.normal),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: AnimatedOpacity(
                                          opacity: opacity,
                                          duration: Duration(milliseconds: 400),
                                          child: Container(
                                            height: size.height/12,
                                            width: 1,
                                            color: Colors.black.withOpacity(.5),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: Stack(
                                      children: [
                                        AnimatedPositioned(
                                          duration: Duration(milliseconds: 400),
                                          top: anim?1:-100,
                                          child: AnimatedOpacity(
                                            opacity: opacity,
                                            duration: Duration(milliseconds: 400),
                                            child: InkWell(

                                              onTap: () async{
                                                animator();
                                                await Future.delayed(const Duration(milliseconds: 400));
                                                Clicks().portal(context);
                                                animator();
                                              },


                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: size.height / 12,
                                                    width: size.height / 12,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage("Assets/images/portal_ic.png"),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.009,
                                                  ),
                                                  text("Portal", 15, Colors.blue, FontWeight.normal),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: AnimatedOpacity(
                                          opacity: opacity,
                                          duration: Duration(milliseconds: 400),
                                          child: Container(
                                            height: size.height/12,
                                            width: 1,
                                            color: Colors.black.withOpacity(.5),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () async{
                                        animator();
                                        await Future.delayed(const Duration(milliseconds: 500));
                                        Clicks().gpa(context);
                                        animator();
                                      },
                                      child: Stack(
                                        children: [
                                          AnimatedPositioned(
                                            duration: Duration(milliseconds: 400),
                                            top: anim?1:-100,
                                            child: AnimatedOpacity(
                                              opacity: opacity,
                                              duration: Duration(milliseconds: 400),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: size.height / 12,
                                                    width: size.height / 12,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage("Assets/images/gpa_ic.png"),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.009,
                                                  ),
                                                  text("GPA", 15, Colors.blue, FontWeight.normal),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Container(
                              width: size.width,
                              height: size.height/8,
                              margin: EdgeInsets.only(left: size.width * 0.1,right: size.width * 0.1 ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Stack(
                                      children: [
                                        AnimatedPositioned(
                                          duration: Duration(milliseconds: 400),
                                          bottom: anim?1:-100,
                                          child: AnimatedOpacity(
                                            duration: Duration(milliseconds: 400),
                                            opacity: opacity,
                                            child: InkWell(
                                              onTap: () async{
                                                animator();
                                                await Future.delayed(const Duration(milliseconds: 500));
                                                Clicks().Class_(context);
                                                animator();
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: size.height / 12,
                                                    width: size.height / 12,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage("Assets/images/class_ic.png"),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.009,
                                                  ),
                                                  text("Class", 15, Colors.blue, FontWeight.normal),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: AnimatedOpacity(
                                          opacity: opacity,
                                          duration: Duration(milliseconds: 400),
                                          child: Container(
                                            height: size.height/12,
                                            width: 1,
                                            color: Colors.black.withOpacity(.5),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: Stack(
                                      children: [
                                        AnimatedPositioned(
                                          duration: Duration(milliseconds: 400),
                                          bottom: anim?1:-100,
                                          child: AnimatedOpacity(
                                            opacity: opacity,
                                            duration: Duration(milliseconds: 400),
                                            child: InkWell(
                                              onTap: () async{
                                                animator();
                                                await Future.delayed(const Duration(milliseconds: 500));
                                                Clicks().lab(context);
                                                animator();
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: size.height / 12,
                                                    width: size.height / 12,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage("Assets/images/lab_ic.png"),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.009,
                                                  ),
                                                  text("Labs", 15, Colors.blue, FontWeight.normal),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Center(
                                        child: AnimatedOpacity(
                                          opacity: opacity,
                                          duration: Duration(milliseconds: 400),
                                          child: Container(
                                            height: size.height/12,
                                            width: 1,
                                            color: Colors.black.withOpacity(.5),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                    flex: 1,
                                    child: Stack(
                                      children: [
                                        AnimatedPositioned(
                                          duration: Duration(milliseconds: 400),
                                          bottom: anim?1:-100,
                                          child: AnimatedOpacity(
                                            opacity: opacity,
                                            duration: Duration(milliseconds: 400),
                                            child: InkWell(
                                              onTap: () async{
                                                animator();
                                                await Future.delayed(const Duration(milliseconds: 500));
                                                Clicks().office(context);
                                                animator();
                                              },
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: size.height / 12,
                                                    width: size.height / 12,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: AssetImage("Assets/images/office_ic.png"),
                                                            fit: BoxFit.fill)),
                                                  ),
                                                  SizedBox(
                                                    height: size.height * 0.009,
                                                  ),
                                                  text("Office", 15, Colors.blue, FontWeight.normal),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              )
          )
        ],
      )
    );
  }
  Widget Layer1()
  {
    return AnimatedContainer(
      transform: Matrix4Transform().translate(x: L1xOffset,y: L1yOffset).rotate(L1angle).matrix4,
      duration: Duration(milliseconds: 600),
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.transparent,
          color: Color(0xFF4c41a3).withOpacity(.5),

    ));
  }
  Widget Drawer__()
  {
    return Visibility(
      visible: true,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFF4c41a3),
        ),

        child: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Container(

                    width: MediaQuery.of(context).size.width/2,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(image: AssetImage("Assets/images/noback.png"),width: MediaQuery.of(context).size.width/4),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Row(

                            children: [
                              Text(
                                "CUI",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " AIDER",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.blue[200],
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  InkWell(
                    onTap: () {
                      setState(() {
                        xOffset=0;
                        yOffset=0;
                        angle=0;

                        L1xOffset=0;
                        L1yOffset=0;
                        L1angle=0;
                        isDrawer=false;
                      });
                    },
                    child: Text(
                      "Home Screen",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  const Divider(
                    color: Color(0xFF5950a0),
                    thickness: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(),));
                    },
                    child: const Text(
                      "Update Setting",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  Divider(
                    color: Color(0xFF5950a0),
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  InkWell(
                    onTap: () async{
                      setState(() {
                        xOffset=0;
                        yOffset=0;
                        angle=0;

                        L1xOffset=0;
                        L1yOffset=0;
                        L1angle=0;
                        isDrawer=false;
                      });
                      animator();
                      await Future.delayed(Duration(milliseconds: 600));
                      SharedPreferences pref=await SharedPreferences.getInstance();
                      pref.clear();
                      FirebaseAuth auth=FirebaseAuth.instance;
                      auth.signOut();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => Account(),));
                    },
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  Divider(
                    color: Color(0xFF5950a0),
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder:  (context) => Hammad(),));
                    },
                    child: Text(
                      "About Us",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> downloadFile(String name,String url,int ind) async {
    try {
      final Directory? directory = await getExternalStorageDirectory();
      final String path = '${directory?.path}/$name';
      final Dio dio = Dio();

      // await Future.delayed(Duration(seconds: ind==0?3:5));
      await dio.download(url, path).then((value){
        setState(() {
          pic=true;
        });
      });
      print('${directory?.path}');

      // print("Successfully downloaded ${response.data} bytes.");

    } catch (e) {
      Toast_("Error while Downloading");
    }
  }
}
