import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';

class NotificationCard extends StatelessWidget  {
  final String title;
  final String text;

  NotificationCard({this.title, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MiruColors.pinkPrimary,
      padding: EdgeInsets.fromLTRB(40, 45, 40, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(this.title, style: MiruText.textHeading, textAlign: TextAlign.left),
          Text(this.text, style: MiruText.textDefault, textAlign: TextAlign.left)
        ]
      )
    );
  }
}