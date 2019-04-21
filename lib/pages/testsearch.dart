import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // Material design package
import 'package:app/assets.dart';

class TSearchPage extends StatelessWidget  {
  final String title;

  TSearchPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dynamic search = GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/searchresults');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: MiruColors.bg2
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
        padding: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Text('ICON'),
            Expanded(
              child: Text('Search...', style: MiruText.textInactive)
            )
          ],
        )
      )
    );

    final dynamic recent = Container(
      margin: EdgeInsets.all(20),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Recent searches", style: MiruText.textSmallTitle),
          Text("A silent voice", style: MiruText.textDefault),
          Text("Kimi no na wa", style: MiruText.textDefault),
          Text("Is this search thingy even working?", style: MiruText.textDefault)
        ],
      )
    );

    return Container( // page itself
      color: MiruColors.bg,
      child: Column( // not a list, cuz its a single screen
        children: <Widget>[
          Hero(
            tag: 'search',
            child: search
          ),
          Expanded(child: recent),
        ]
      )
    );

  }
}