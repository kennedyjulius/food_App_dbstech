import 'package:flutter/material.dart';

class AppColors {
  static const Color textColor = Color(0xFFccc7c5);
  static const Color mainColor = Color(0xFF89dad0);
  static const Color iconColor1 = Color(0xFFffd28d);
  static const Color iconColor2 = Color(0xFFfcab88);
  static const Color paraColor = Color(0xFF8f837f);
  static final Color buttonBackgroundColor = const Color(0xFFf7f6f4);
  static const Color signColor = Color(0xFFa9a29f);
  static const Color titleColor = Color(0xFF5c524f);
  static const Color mainBlackColor = Color(0xFF332d2d);
  static const Color yellowColor = Color(0xFFffd379);
}

List<BoxShadow> CustomboxShadow = [
  const BoxShadow(
    blurRadius: 10,
    color: Colors.white10,
    spreadRadius: 4,
    offset: Offset(-1, -1),
    blurStyle: BlurStyle.outer,
  ),
  const BoxShadow(
    blurRadius: 10,
    color: Colors.white10,
    spreadRadius: 4,
    offset: Offset(2, 5),
    blurStyle: BlurStyle.outer,
  ),
];
