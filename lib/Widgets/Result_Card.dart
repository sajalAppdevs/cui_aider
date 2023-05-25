import 'package:cui_aider/Widgets/text.dart';
import 'package:flutter/material.dart';

class Result_Card extends StatelessWidget {
  String marks="";
  String title="";
  Result_Card(this.title,this.marks);
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
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
            Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Card(
                  elevation: 10,
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.black.withOpacity(.05),
                child: Center(
                  child: text(marks, 17, Colors.black, FontWeight.bold),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
