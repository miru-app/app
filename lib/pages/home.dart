import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';
import 'package:app/apis/kitsu.dart' as kitsu; // Kitsu API methods
import 'package:app/widgets/horizontal_anime_list.dart';
import 'package:app/widgets/card_section.dart';

class HomePage extends StatelessWidget  {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final dynamic topBar = Container(
      margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text("Miru", style: MiruText.textSmallTitle)
          ),
          Text("ICON"),
          Text("ICON")
        ]
      )
    );

    final dynamic search = GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/search');
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
      
    return Container( // page itself
      color: MiruColors.bg,
      child: SafeArea(
        child: ListView( // list so the page can scroll
          children: <Widget>[
            topBar,
            Hero(
              tag: 'search',
              child: search
            ),
            CardSection(
              title: 'Unfinished',
              actionText: 'see all',
              onTap: () => {},
              child: Container(
                height: HorizontalAnimeListWatched.height,
                child: HorizontalAnimeListWatched(
                  future: kitsu.getTrending()
                )
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: CardSection(
                title: 'Popular',
                actionText: 'see all',
                onTap: () => {},
                child: Container(
                  height: HorizontalAnimeListLarge.height,
                  child: HorizontalAnimeListLarge(
                    future: kitsu.getTrending()
                  )
                )
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
              child: CardSection(
                title: 'Recent',
                actionText: 'see all',
                onTap: () => {},
                child: Container(
                  height: HorizontalAnimeList.height,
                  child: HorizontalAnimeList(
                    future: kitsu.getTrending()
                  )
                )
              )
            )
          ]
        )
      )
    );
  }
}