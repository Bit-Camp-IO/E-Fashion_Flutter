import 'package:flutter/material.dart';

class AccountSkewClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.09098004);
    path_0.cubicTo(0, size.height * 0.02470683, size.width * 0.1069514, size.height * -0.01879964, size.width * 0.1991653, size.height * 0.009962284);
    path_0.lineTo(size.width * 0.9213861, size.height * 0.2352266);
    path_0.cubicTo(size.width * 0.9694472, size.height * 0.2502158, size.width, size.height * 0.2817050, size.width, size.height * 0.3162446);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.lineTo(0, size.height * 0.09098004);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
