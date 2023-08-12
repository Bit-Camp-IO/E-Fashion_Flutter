import 'package:flutter/material.dart';

class AuthCustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0027778, size.height * 0.9981481);
    path_0.lineTo(size.width * 1.0027778, size.height * 1.0037037);
    path_0.lineTo(size.width * 1.0027778, size.height * 0.1851852);
    path_0.lineTo(size.width * 0.9662778, size.height * 0.1425926);
    path_0.lineTo(size.width * 0.9109167, size.height * 0.1148148);
    path_0.lineTo(size.width * 0.8500000, size.height * 0.0962963);
    path_0.lineTo(size.width * 0.2583333, size.height * -0.0016667);
    path_0.lineTo(size.width * 0.1738889, size.height * 0.0060000);
    path_0.lineTo(size.width * 0.0903056, size.height * 0.0325556);
    path_0.lineTo(size.width * 0.0260556, size.height * 0.0667778);
    path_0.lineTo(size.width * -0.0090833, size.height * 0.1092593);

    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
