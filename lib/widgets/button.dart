import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class IconButton extends StatelessWidget {
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

class Button extends StatelessWidget {
  final bool dropdown;
  final String text;
  final onTap;
  final Key key;

  Button({ this.text, this.onTap, this.dropdown, this.key }): super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 13
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
          children: <Widget>[
            Text(text, style: MiruText.emphasis),
            /*Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(MiruIcons, color: MiruColors.textemphasis)
            )*/
          ],
        )
      )
    );

  }
}