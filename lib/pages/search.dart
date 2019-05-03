import 'package:app/widgets/searchbar.dart';
import 'package:app/widgets/tag.dart';
import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';

class SearchPage extends StatelessWidget  {
  final String title;

  SearchPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MiruColors.dark,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SearchBar()
          ),
          Text("Recent searches", style: MiruText.heading),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Tag(text: 'A silent voice', onTap: () {}),
                  Tag(text: 'Kimi no na wa', onTap: () {}),
                  Tag(text: 'Is this search thingy even working?', onTap: () {})
                ],
              )
            )
          )
        ]
      )
    );

  }
}