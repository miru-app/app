import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // Material design package
import 'package:app/assets.dart';

class TSearchPage extends StatelessWidget  {
  final String title;

  TSearchPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dynamic search = Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/searchresults');
              },
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: MiruColors.bg2
                  ),
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
              )
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child:Padding(
                padding: EdgeInsets.all(15),
                child: Text('Cancel', style: MiruText.textButton)
              )
            )
          ]
        )
    );

    final dynamic recent = Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 20),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Recent searches", style: MiruText.textSmallTitle),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("A silent voice", style: MiruText.textDefault),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("Kimi no na wa", style: MiruText.textDefault),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text("Is this search thingy even working?", style: MiruText.textDefault),
          )
        ],
      )
    );

    return Container( // page itself
      color: MiruColors.bg,
      child: SafeArea( 
        child: Column( // not a list, cuz its a single screen
          children: <Widget>[
            Hero(
              tag: 'search',
              child: search
            ),
            Expanded(child: recent),
          ]
        )
      )
    );

  }
}