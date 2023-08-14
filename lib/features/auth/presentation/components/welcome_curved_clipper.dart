import 'package:flutter/material.dart';

class WelcomeCurvedClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.2908067);
    path_0.cubicTo(0, size.height * 0.2908067, size.width * 0.6389030, size.height * -0.1441293, size.width * 0.9940609, size.height * 0.04981313);
    path_0.cubicTo(size.width * 1.381388, size.height * 0.2613239, size.width * 0.9940609, size.height * 1.000569, size.width * 0.9940609,
        size.height * 1.000569);
    path_0.lineTo(0, size.height * 1.000569);
    path_0.lineTo(0, size.height * 0.2908067);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant WelcomeCurvedClipper oldClipper) {
    return true;
  }
}
