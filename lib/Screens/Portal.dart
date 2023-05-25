import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Home_Page.dart';


class Portal extends StatefulWidget {
  @override
  State<Portal> createState() => _PortalState();
}
class _PortalState extends State<Portal> {
  late WebViewController _controller;
  @override
  void initState() {
    super.initState();
  }
  getPass() async
  {

    SharedPreferences pref=await SharedPreferences.getInstance();
    String roll=pref.getString("ROLLNO")!;
    String pass=pref.getString("PASS")!;

    await Future.delayed(Duration(seconds: 2));
    _controller.evaluateJavascript("document.getElementById('MaskedRegNo').value = '$roll';");
    _controller.evaluateJavascript("document.getElementById('Password').value = '$pass';");
    await Future.delayed(Duration(seconds: 1));



    print("Helo");
    await _controller.evaluateJavascript('''
      var checkbox = document.querySelector('input[type="checkbox"]');
        checkbox.click();
    ''');


    // _controller.evaluateJavascript("document.getElementById('recaptcha-anchor-label').click();");
    // _controller.evaluateJavascript("document.getElementById('LoginSubmit').click();");

    // final String result = await _controller.evaluateJavascript("(function() { "
    //     "var rect = document.getElementById('LoginSubmit').getBoundingClientRect();"
    //     "return '(' + rect.left + ', ' + rect.top + ')'; "
    //     "})()");
    // print(result);

    // final int left = 268;
    // final int top = 700;
    // final String result_ = await _controller.evaluateJavascript("(function() { "
    //     "var element = document.elementFromPoint($left, $top);"
    //     "element.click();"
    //     "return 'Clicked on ' + element.nodeName; "
    //     "})()");
    // print(result_);
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double weight=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Portal",style: TextStyle(color: Colors.black),),
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
        height: height,
        width: weight,
        child: Column(
          children: [
            Expanded(
              child: WebView(
                initialUrl: 'https://swl-cms.comsats.edu.pk:8082/',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  setState(() {
                    _controller=controller;
                    getPass();
                  });
                },

              ),
            ),
          ],
        ),
        ),
    );
  }
}
