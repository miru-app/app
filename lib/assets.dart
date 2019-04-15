import 'package:flutter/widgets.dart';

class MiruColors {
  static const Color purplePrimary = Color.fromARGB(255, 34, 30, 58);
  static const Color heading = Color.fromARGB(255, 255, 255, 255);
  static const Color pinkPrimary = Color.fromARGB(255, 246, 16, 103);
  static const Color iconColor = Color(0xFF4A485C);

  static const Color bg = Color.fromARGB(255, 29, 29, 39);
  static const Color blackOverlay = Color.fromARGB(64, 0, 0, 0);

  static const Color textEmphasis = Color.fromARGB(255, 255, 255, 255);
  static const Color textParagraph = Color.fromARGB(255, 162, 162, 180);
  static const Color primaryColor = Color.fromARGB(255, 158, 158, 255);
}

class MiruText {
  static const TextStyle textDefault = TextStyle(
    color: MiruColors.textParagraph,
    fontWeight: FontWeight.normal,
    fontSize: 15
  );
  static const TextStyle textEmphasis = TextStyle(
    color: MiruColors.textEmphasis,
    fontWeight: FontWeight.normal,
    fontSize: 15
  );
  static const TextStyle textButton = TextStyle(
    color: MiruColors.primaryColor,
    fontWeight: FontWeight.normal,
    fontSize: 15
  );
  static const TextStyle textHeading = TextStyle(
    fontWeight: FontWeight.w500,
    color: MiruColors.textEmphasis,
    fontSize: 25
  );
}