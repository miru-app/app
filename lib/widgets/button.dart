import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';
import 'package:app/widgets/dialog.dart';

class Button extends StatelessWidget  {
  final String text;
  final onTap;

  Button({this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500.0),
          color: MiruColors.pinkPrimary
        ),
        child: Text(this.text)
      )
    );
  }
}