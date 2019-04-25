import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class AnimeInfo extends StatelessWidget {
  final String title;
  final String data;

  AnimeInfo({this.title, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(this.title, style: MiruText.textMuted),
        Text(this.data, style: MiruText.textHeading)
      ],
    );
  }
}

class AnimeSummary extends StatelessWidget {
  final String text;

  AnimeSummary({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text('Summary', style: MiruText.textHeading)
          ),
          Text(
            this.text,
            style: MiruText.textDefault,
            maxLines: 5
          ),
          Text('Read more', style: MiruText.textButton) // TODO not show for smaller than 5 lines
        ]
      )
    );
  }
}