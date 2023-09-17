import 'package:flutter/material.dart';

class RoundedCutoutClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.5000000, size.height);
    path.cubicTo(size.width * 0.7761425, size.height, size.width,
        size.height * 0.7761425, size.width, size.height * 0.5000000);
    path.cubicTo(
        size.width,
        size.height * 0.4143917,
        size.width * 0.9784833,
        size.height * 0.3338075,
        size.width * 0.9405667,
        size.height * 0.2633617);
    path.cubicTo(
        size.width * 0.9258750,
        size.height * 0.2708050,
        size.width * 0.9092583,
        size.height * 0.2750000,
        size.width * 0.8916667,
        size.height * 0.2750000);
    path.cubicTo(
        size.width * 0.8318358,
        size.height * 0.2750000,
        size.width * 0.7833333,
        size.height * 0.2264975,
        size.width * 0.7833333,
        size.height * 0.1666667);
    path.cubicTo(
        size.width * 0.7833333,
        size.height * 0.1428750,
        size.width * 0.7910025,
        size.height * 0.1208742,
        size.width * 0.8040042,
        size.height * 0.1030025);
    path.cubicTo(size.width * 0.7197633, size.height * 0.03839692,
        size.width * 0.6143658, 0, size.width * 0.5000000, 0);
    path.cubicTo(size.width * 0.2238575, 0, 0, size.height * 0.2238575, 0,
        size.height * 0.5000000);
    path.cubicTo(0, size.height * 0.7761425, size.width * 0.2238575,
        size.height, size.width * 0.5000000, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
