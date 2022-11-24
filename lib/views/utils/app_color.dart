import 'package:flutter/material.dart';

class AppColor {
  static LinearGradient bottomShadow = LinearGradient(colors: [
    const Color(0xFF107873).withOpacity(0.2),
    const Color(0xFF107873).withOpacity(0)
  ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
  static LinearGradient linearBlackBottom = LinearGradient(
      colors: [Colors.black.withOpacity(0.45), Colors.black.withOpacity(0)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
  static LinearGradient linearBlackTop = LinearGradient(
      colors: [Colors.black.withOpacity(0.5), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
}
