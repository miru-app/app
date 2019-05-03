import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class Tag extends StatelessWidget  {
  final String text;
  final onTap;

  Tag({ this.text, this.onTap });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 5
        ),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
        decoration: BoxDecoration(
          color: MiruColors.component,
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Text(this.text, style: MiruText.text)
      )
    );

  }
}