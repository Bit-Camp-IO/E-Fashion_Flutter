import 'package:flutter/material.dart';

class CardBottomSkewClipper extends CustomClipper<Path> {
  final double skewAmount;
  final bool reverse;

  CardBottomSkewClipper({required this.skewAmount, this.reverse = false});

  @override
  Path getClip(Size size) {
    final path = Path();

    if (reverse) {
      path.lineTo(0, size.height - (size.height * skewAmount));
      path.lineTo(size.width, size.height);
      path.lineTo(size.width, 0);
    } else {
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height - (size.height * skewAmount));
      path.lineTo(size.width, 0);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}