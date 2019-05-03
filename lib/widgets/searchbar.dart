import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(ctx, '/searchresults');
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: MiruColors.component
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 12
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(MiruIcons.search, color: MiruColors.textemphasis)
                  ),
                  Expanded(
                    child: Text('Search...', style: MiruText.subtitle)
                  )
                ],
              )
            )
          )
        )/*,
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child:Padding(
            padding: EdgeInsets.all(15),
            child: Text('Cancel', style: MiruText.action)
          )
        )*/
      ]
    );
  }
}