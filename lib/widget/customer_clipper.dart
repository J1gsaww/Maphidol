import 'package:flutter/material.dart';

class SemiCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height * 2, size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
