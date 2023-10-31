import 'package:flutter/material.dart';

class PaymentClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.04000000);
    path.cubicTo(0, size.height * 0.01790860, size.width * 0.02295974, 0,
        size.width * 0.05128205, 0);
    path.lineTo(size.width * 0.9487179, 0);
    path.cubicTo(
        size.width * 0.9770417, 0, size.width, size.height * 0.01790860,
        size.width, size.height * 0.04000000);
    path.lineTo(size.width, size.height * 0.1500000);
    path.cubicTo(size.width, size.height * 0.1555227, size.width * 0.9942276,
        size.height * 0.1600668, size.width * 0.9873205,
        size.height * 0.1612787);
    path.cubicTo(
        size.width * 0.9721346, size.height * 0.1639435, size.width * 0.9487179,
        size.height * 0.1721605, size.width * 0.9487179,
        size.height * 0.1975000);
    path.cubicTo(
        size.width * 0.9487179, size.height * 0.2211420, size.width * 0.9721154,
        size.height * 0.2288142, size.width * 0.9873045, size.height * 0.2313038);
    path.cubicTo(size.width * 0.9942340, size.height * 0.2324398, size.width, size.height * 0.2369772, size.width, size.height * 0.2425000);
    path.lineTo(size.width, size.height * 0.9600000);
    path.cubicTo(size.width, size.height * 0.9820925, size.width * 0.9770417, size.height, size.width * 0.9487179, size.height);
    path.lineTo(size.width * 0.05128205, size.height);
    path.cubicTo(size.width * 0.02295974, size.height, 0, size.height * 0.9820925, 0, size.height * 0.9600000);
    path.lineTo(0, size.height * 0.2431445);
    path.cubicTo(0, size.height * 0.2373763, size.width * 0.006293333, size.height * 0.2327222, size.width * 0.01357625, size.height * 0.2317210);
    path.cubicTo(size.width * 0.02876923, size.height * 0.2296327, size.width * 0.05128205, size.height * 0.2223465, size.width * 0.05128205, size.height * 0.1975000);
    path.cubicTo(size.width * 0.05128205, size.height * 0.1721605, size.width * 0.02786686, size.height * 0.1639435, size.width * 0.01268067, size.height * 0.1612787);
    path.cubicTo(size.width * 0.005772724, size.height * 0.1600668, 0, size.height * 0.1555227, 0, size.height * 0.1500000);
    path.lineTo(0, size.height * 0.04000000);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}