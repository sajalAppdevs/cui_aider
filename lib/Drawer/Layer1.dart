import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
_Layer1State state=_Layer1State();
class Layer1 extends StatefulWidget {
  const Layer1({Key? key}) : super(key: key);

  @override
  State<Layer1> createState() => _Layer1State();
}

class _Layer1State extends State<Layer1> {
  double xOffset=0;
  double yOffset=0;
  double angle=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient:
            LinearGradient(colors: [Color(0xFF4c41a3), Color(0xFF1f186f)])),
        transform: Matrix4Transform().translate(x: xOffset,y: yOffset).rotate(angle).matrix4,
      ),
    );
  }
}
