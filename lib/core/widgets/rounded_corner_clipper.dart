import 'package:flutter/material.dart';

class RoundedCornerClipper extends CustomClipper<Path> {
  final double radius;

  RoundedCornerClipper({this.radius = 10.0});

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, radius)
      ..arcToPoint(Offset(radius, 0), radius: Radius.circular(radius), clockwise: true)
      ..lineTo(size.width - radius, 0)
      ..arcToPoint(Offset(size.width, radius), radius: Radius.circular(radius), clockwise: true)
      ..lineTo(size.width, size.height - radius)
      ..arcToPoint(Offset(size.width - radius, size.height), radius: Radius.circular(radius), clockwise: true)
      ..lineTo(radius, size.height)
      ..arcToPoint(Offset(0, size.height - radius), radius: Radius.circular(radius), clockwise: true)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

