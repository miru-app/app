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
      
    return Container( // page itself
      color: MiruColors.dark,
      child: ListView( // list so the page can scroll
        children: <Widget>[
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
    );
  }
}