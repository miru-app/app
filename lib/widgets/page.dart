import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class PageTitleDetailed extends StatelessWidget  {
  final String title;
  final String subTitle;

  PageTitleDetailed(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: MiruText.title),
          Text(subTitle, style: MiruText.subtitle)
        ],
      )
    );
  }
}

class PageTitle extends StatelessWidget  {
  final String title;
  final back;

  PageTitle(this.title, {this.back});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
      child: Stack(
        children: <Widget>[
          Center(
            child: Text(title, style: MiruText.emphasis)
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: (this.back != null) ? this.back : () {
                Navigator.pop(context);
              },
              child: Icon(MiruIcons.folder, color: MiruColors.textemphasis)
            )
          )
        ],
      )
    );
  }
}