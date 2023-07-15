// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// class Test extends StatefulWidget {
//   Test({Key? key}) : super(key: key);
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   String t="";
//   var test = FirebaseDatabase.instance.ref('User').child("1675597062950");
//   @override
//   void initState() {
//     super.initState();
//     test.onValue.listen((event) {
//       setState(() {
//         t=event.snapshot.child("name").value.toString();
//       });
//     });
//   }
//   String show()
//   {
//
//     return t;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(show()
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:io';
import 'package:cui_aider/Utils/Toast.dart';
import 'package:cui_aider/Widgets/text.dart';
import 'package:dio/dio.dart';
import 'package:cui_aider/Screens/VR.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'Home_Page.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool click=false;
  int count=0;

 var bool_=[
   false,
 false,
 false,
 false,
 false,
 false,
 ];
  var list=[
    "1 : Downloading",
    "2 : Downloading",
    "3 : Downloading",
    "4 : Downloading",
    "5 : Downloading",
    "6 : Downloading",
  ];
  final  storageReference = FirebaseStorage.instance.ref().child('images/image.jpg');

  final String admin = "https://firebasestorage.googleapis.com/v0/b/cui-aider.appspot.com/o/admin.jpeg?alt=media&token=1a347604-87f3-4eea-b1d9-4f5339b5e4ce";
  final String strieht = "https://firebasestorage.googleapis.com/v0/b/cui-aider.appspot.com/o/streight.jpeg?alt=media&token=f57a0707-fc86-407f-a961-e30f97ce8d53";
  final String innergate = "https://firebasestorage.googleapis.com/v0/b/cui-aider.appspot.com/o/innergate.jpeg?alt=media&token=f8077294-2c6c-4f98-8480-8408ef401879";
  final String ground = "https://firebasestorage.googleapis.com/v0/b/cui-aider.appspot.com/o/ground.jpeg?alt=media&token=9f8b08ef-0bc1-4320-bd6a-209f0a4f917b";
  final String nextofbackofcanteen = "https://firebasestorage.googleapis.com/v0/b/cui-aider.appspot.com/o/nextofbackofcanteen.jpg?alt=media&token=9db2f82e-b149-43aa-ac59-45e8c2ab70d6";
  final String entraceofa = "https://firebasestorage.googleapis.com/v0/b/cui-aider.appspot.com/o/entranceofa.jpg?alt=media&token=1a621d55-b79c-4a9d-962a-fc5dc0bc5db7";




  Future<void> downloadFile(String name,String url,int ind) async {
    try {
      final Directory? directory = await getExternalStorageDirectory();
      final String path = '${directory?.path}/$name';
      final Dio dio = Dio();

      // await Future.delayed(Duration(seconds: ind==0?3:5));
      final Response response = await dio.download(url, path);
      print('${directory?.path}');
      setState(() {
        list[ind]="${count+1} : Downloaded";
        bool_[ind]=true;
      });
      if(ind==list.length-1)
        {
          Toast_("Successfully downloaded");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VR(),));
        }
      // print("Successfully downloaded ${response.data} bytes.");

    } catch (e) {
      Toast_("Error while Downloading");
    }
  }


  late bool filecheck;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Virtual",
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
      backgroundColor: Colors.white,
      body: Center(
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white,
            )
          ),
          elevation: 10,
          margin: EdgeInsets.only(left: 50,right: 50),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              height: MediaQuery.of(context).size.height/2,
              width:  MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(child:
                    Card(
                      color: Colors.white,
                      elevation: 10,
                      margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        child: Container(
                            padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                            child: click?
                                ListView(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        text(list[0], 18, Colors.black, FontWeight.normal),
                                        bool_[0]?Icon(Icons.done_outline,color: Colors.blue,size: 15,):Container(
                                            height: 15,
                                            width: 15,
                                            child: Container(
                                                height: 15,
                                                width: 15,
                                                child: CircularProgressIndicator(color: Colors.blue,)))
                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        text(list[1], 18, Colors.black, FontWeight.normal),
                                        bool_[1]?Icon(Icons.done_outline,color: Colors.blue,size: 15,):Container(
                                            height: 15,
                                            width: 15,
                                            child: CircularProgressIndicator(color: Colors.blue,))
                                      ],
                                    )
                                  ],
                                )
                                :text("You have to download image package first", 17, Colors.black, FontWeight.normal))),),
                  )),
                  InkWell(
                    onTap: () {
                      setState(() {
                        click=true;
                      });
                      downloadFile("admin.jpeg",admin,0);
                      downloadFile("innergate.jpeg",innergate,1);
                      downloadFile("strieht.jpeg",strieht,2);
                      downloadFile("ground.jpeg",ground,3);
                      downloadFile("nextofbackofcanteen.jpeg",nextofbackofcanteen,4);
                      downloadFile("entraceofa.jpeg",entraceofa,5);
                    },
                    child: Container(height: 55,
                    width: double.infinity,
                      color: Colors.blue,
                      child:
                      Center(child: click?Container(height: 20,width: 20,child: CircularProgressIndicator(color: Colors.white,),):Text("Download",style: TextStyle(color: Colors.white),)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
