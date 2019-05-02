import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class PageTitleDetailed extends StatelessWidget  {
  final String title;
  final String subTitle;

  PageTitleDetailed(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: <Widget>[
          Text(title, style: MiruText.title),
          Text(subTitle, style: MiruText.subtitle)
        ],
      )
    );
  }
}