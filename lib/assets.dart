import 'package:flutter/widgets.dart';

class MiruColors {
  static const Color purplePrimary = Color.fromARGB(255, 34, 30, 58);
  static const Color heading = Color.fromARGB(255, 255, 255, 255);
  static const Color pinkPrimary = Color.fromARGB(255, 246, 16, 103);
  static const Color iconColor = Color(0xFF4A485C);
}

class MiruText {
  static const TextStyle textDefault = TextStyle();
  static const TextStyle textHeading = TextStyle(
    fontWeight: FontWeight.bold,
    color: MiruColors.heading,
    fontSize: 30.0
  );
}