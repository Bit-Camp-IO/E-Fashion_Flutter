import 'package:flutter/material.dart';

class ButtonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.1304348);
    path_0.cubicTo(0, size.height * 0.05839762, size.width * 0.02452700, 0, size.width * 0.05478260, 0);
    path_0.lineTo(size.width * 0.6347830, 0);
    path_0.cubicTo(size.width * 0.8364870, 0, size.width, size.height * 0.3893167, size.width, size.height * 0.8695643);
    path_0.lineTo(size.width, size.height * 0.8695643);
    path_0.cubicTo(size.width, size.height * 0.9416024, size.width * 0.9754730, size.height, size.width * 0.9452170, size.height);
    path_0.lineTo(size.width * 0.3652170, size.height);
    path_0.cubicTo(size.width * 0.1635130, size.height, 0, size.height * 0.6106833, 0, size.height * 0.1304348);
    path_0.lineTo(0, size.height * 0.1304348);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
