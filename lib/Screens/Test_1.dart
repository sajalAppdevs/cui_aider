import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Test_1 extends StatefulWidget {
  const Test_1({Key? key}) : super(key: key);

  @override
  State<Test_1> createState() => _Test_1State();
}

class _Test_1State extends State<Test_1> {
  File file=File("");
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: InkWell(
          onTap: () {
            var test=ImagePicker();
            test.pickImage(source: ImageSource.gallery).then((value) {
              final t=value!.path;
              setState(() {
                file=File(t);
              });
            });
          },
          child: Center(
            child: Image.file(file),
          ),
        ),
      ),
    );
  }
}
