import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';

class CardSection extends StatelessWidget  {
  final String title;
  final String actionText;
  final onTap;
  final Widget child;

  CardSection({this.title, this.actionText, this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(this.title, style: MiruText.heading),
              ),
              Text(this.actionText, style: MiruText.action)
            ]
          )
        ),
        this.child
      ]
    );
  }
}

class CardSectionTitle extends StatelessWidget  {
  final String title;
  final String actionText;
  final onTap;

  CardSectionTitle({this.title, this.actionText, this.onTap,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(this.title, style: MiruText.heading),
          ),
          Text(this.actionText, style: MiruText.action)
        ]
      )
    );
  }
}