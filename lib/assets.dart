import 'package:flutter/widgets.dart';

class MiruIcons {
  /// Copyright (C) 2019 by original authors @ fluttericon.com, fontello.com
  /// This font was generated by FlutterIcon.com, which is derived from Fontello.
  /// its a nice tool, credit to them.
  /// icons are from evaicons
  static const IconData search = const IconData(0xe800, fontFamily: 'MiruIcons');
  static const IconData heart = const IconData(0xe801, fontFamily: 'MiruIcons');
  static const IconData folder_add = const IconData(0xe802, fontFamily: 'MiruIcons');
  static const IconData folder = const IconData(0xe803, fontFamily: 'MiruIcons');
  static const IconData settings = const IconData(0xe804, fontFamily: 'MiruIcons');
  static const IconData heart_filled = const IconData(0xe805, fontFamily: 'MiruIcons');
  static const IconData dropdown = const IconData(0xe806, fontFamily: 'MiruIcons');
  static const IconData back = const IconData(0xe807, fontFamily: 'MiruIcons');
  static const IconData home = const IconData(0xe808, fontFamily: 'MiruIcons');
}

class MiruColors {
  static const Color dark = Color(0xFF1D1D27);
  static const Color placeholder = Color(0xFF252534);
  static const Color component = Color(0xFF30303F);

  static const Color textmuted = Color(0xFF4C4C66);
  static const Color textnofocus = Color(0xFFADADC9);
  static const Color text = Color(0xFFC4C4D9);
  static const Color textemphasis = Color(0xFFFFFFFF);

  static const Color action = Color(0xFF9E9EFF);
  static const Color red = Color(0xFFFF5C5C);

  static const Color gradienttop = Color(0xFFA25AFF);
  static const Color gradientbottom = Color(0xFF9E9EFF);

  static const Color overlay = Color.fromRGBO(0, 0, 0, .5);
}

class MiruText {
  static const TextStyle title = TextStyle(
    color: MiruColors.textemphasis,
    fontWeight: FontWeight.normal,
    fontSize: 25,
    fontFamily: 'OpenSans'
  );
  static const TextStyle subtitle = TextStyle(
    color: MiruColors.textnofocus,
    fontWeight: FontWeight.normal,
    fontSize: 15,
    fontFamily: 'OpenSans'
  );
  static const TextStyle heading = TextStyle(
    color: MiruColors.textemphasis,
    fontWeight: FontWeight.normal,
    fontSize: 20,
    fontFamily: 'OpenSans'
  );
  static const TextStyle action = TextStyle(
    color: MiruColors.action,
    fontWeight: FontWeight.normal,
    fontSize: 15,
    fontFamily: 'OpenSans'
  );
  static const TextStyle emphasis = TextStyle(
    color: MiruColors.textemphasis,
    fontWeight: FontWeight.normal,
    fontSize: 15,
    fontFamily: 'OpenSans'
  );
  static const TextStyle text = TextStyle(
    color: MiruColors.text,
    fontWeight: FontWeight.normal,
    fontSize: 15,
    fontFamily: 'OpenSans'
  );
}