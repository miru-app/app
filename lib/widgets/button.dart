import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

class Button extends AnimatedWidget {
  final bool dropdown;
  final String text;
  final onTap;
  final Key key;
  final Animation<double> animation;

  final Animatable<double> tween = Tween<double>(
    begin: 0,
    end: -math.pi
  );

  static double width = 130;

  Button({ this.text, this.onTap, this.dropdown = false, this.key, this.animation }): super(key: key, listenable: animation);

  void changeValue(String newValue) {
    print('change value: ' + newValue);
  }

  void toggle() {
    print('toggle dropdown icon');
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap != null ? () { onTap(this); } : null,
      child: Container(
        width: Button.width,
        padding: EdgeInsets.symmetric(
          vertical: 8
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              MiruColors.gradienttop,
              MiruColors.gradientbottom
            ]
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        constraints: BoxConstraints.tightForFinite(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(text, style: MiruText.emphasis),
            Visibility(
              visible: this.dropdown,
              
              child: Transform.rotate(
                angle: tween.evaluate(animation),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
                  child: Icon(MiruIcons.dropdown, size: 15, color: MiruColors.textemphasis)
                )
              )
            )
          ],
        )
      )
    );

  }
}

class IconButton extends StatelessWidget{
  final IconData iconData;
  final String text;
  final onTap;

  IconButton({ this.iconData, this.text, this.onTap });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 13
        ),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        decoration: BoxDecoration(
          color: MiruColors.component,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(iconData, color: MiruColors.textemphasis)
            ),
            Text(text, style: MiruText.text)
          ],
        )
      )
    );

  }
}