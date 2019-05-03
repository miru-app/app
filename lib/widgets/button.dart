import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class IconButton extends StatelessWidget  {
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