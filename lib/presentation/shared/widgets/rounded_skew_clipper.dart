
import 'package:flutter/material.dart';

class RoundedSkewClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1110934);
    path_0.cubicTo(
        0,
        size.height * 0.04213882,
        size.width * 0.07966194,
        size.height * -0.009701031,
        size.width * 0.1653986,
        size.height * 0.003460307);
    path_0.lineTo(size.width * 0.8876194, size.height * 0.1143276);
    path_0.cubicTo(size.width * 0.9528833, size.height * 0.1243461, size.width,
        size.height * 0.1694728, size.width, size.height * 0.2219605);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height * 0.9925658);
    path_0.lineTo(0, size.height * 0.1110934);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}