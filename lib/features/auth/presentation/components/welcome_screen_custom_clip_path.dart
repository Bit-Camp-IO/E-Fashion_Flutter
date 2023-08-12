import 'package:flutter/material.dart';

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path_0 = Path();
    path_0.moveTo(width * 0.0050000, height * 0.9975000);
    path_0.lineTo(width * 1.0050000, height * 1.0025000);
    path_0.lineTo(width * 1.0050000, height * 0.0700000);
    path_0.lineTo(width * 0.8750000, height * 0.0375000);
    path_0.lineTo(width * 0.7390000, height * 0.0410000);
    path_0.lineTo(width * 0.6300000, height * 0.0650000);
    path_0.lineTo(width * 0.5050000, height * 0.0930000);
    path_0.lineTo(width * 0.3655000, height * 0.1415000);
    path_0.lineTo(width * 0.2575000, height * 0.1925000);
    path_0.lineTo(width * 0.1660000, height * 0.2415000);
    path_0.lineTo(width * 0.0810000, height * 0.2825000);
    path_0.lineTo(width * -0.0050000, height * 0.3350000);

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
