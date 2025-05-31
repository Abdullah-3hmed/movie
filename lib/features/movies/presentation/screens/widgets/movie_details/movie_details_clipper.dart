import 'package:flutter/material.dart';

class MovieDetailsClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0025000);
    path0.lineTo(0, size.height * 0.9200000);
    path0.quadraticBezierTo(
      size.width * 0.3781250,
      size.height * 1.0006250,
      size.width * 0.4975000,
      size.height * 0.9950000,
    );
    path0.quadraticBezierTo(
      size.width * 0.6275000,
      size.height * 1.0006250,
      size.width,
      size.height * 0.9200000,
    );
    path0.lineTo(size.width, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant MovieDetailsClipper oldClipper) {
    return true;
  }
}
