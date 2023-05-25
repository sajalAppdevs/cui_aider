import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Image_Slider extends StatefulWidget {
  const Image_Slider({Key? key}) : super(key: key);

  @override
  State<Image_Slider> createState() => _Image_SliderState();
}

class _Image_SliderState extends State<Image_Slider> {
  var Images=[
    AssetImage("Assets/images/sl4.png"),
    AssetImage("Assets/images/sl2.png"),
    AssetImage("Assets/images/sl3.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return
      CarouselSlider(
          items: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child:  Image(image: Images[0],fit: BoxFit.fill,),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child:  Image(image: Images[1],fit: BoxFit.fill,),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child:  Image(image: Images[2],fit: BoxFit.fill,),
            ),
          ],
          options: CarouselOptions(
            height: 170,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.25,
            scrollDirection: Axis.horizontal,
          )
      );
  }
}

