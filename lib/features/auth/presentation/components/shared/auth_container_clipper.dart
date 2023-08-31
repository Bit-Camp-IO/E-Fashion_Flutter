import 'package:flutter/material.dart';

class AuthContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0,size.height*0.09622701);
    path.cubicTo(0,size.height*0.03092548,size.width*0.09266972,size.height*-0.01523195,size.width*0.1825553,size.height*0.005298659);
    path.lineTo(size.width*0.9019889,size.height*0.1696234);
    path.cubicTo(size.width*0.9587083,size.height*0.1825782,size.width*0.9970556,size.height*0.2190977,size.width*0.9972111,size.height*0.2603027);
    path.lineTo(size.width,size.height);
    path.lineTo(0,size.height);
    path.lineTo(0,size.height*0.09622701);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}