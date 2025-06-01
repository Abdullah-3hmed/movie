import 'package:flutter/material.dart';

class TvDetailsClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, size.height * 0.0023810);
    path0.lineTo(0, size.height);
    path0.quadraticBezierTo(
      size.width * 0.1281389,
      size.height * 0.9059524,
      size.width * 0.2073056,
      size.height * 0.9023810,
    );
    path0.cubicTo(
      size.width * 0.2513889,
      size.height * 0.8815476,
      size.width * 0.7232778,
      size.height * 0.8845238,
      size.width * 0.7656389,
      size.height * 0.9038810,
    );
    path0.quadraticBezierTo(
      size.width * 0.8489722,
      size.height * 0.9038810,
      size.width,
      size.height * 0.9976190,
    );
    path0.lineTo(size.width, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant TvDetailsClipper oldClipper) {
    return true;
  }
}
