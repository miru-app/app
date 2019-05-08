import 'package:app/anime.dart';
import 'package:app/widgets/page.dart';
import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';
import 'package:app/apis/kitsu.dart' as kitsu; // Kitsu API methods
import 'package:app/widgets/horizontal_anime_list.dart';
import 'package:app/widgets/card_section.dart';

class HomePage extends StatelessWidget  {
  final String title;
  final BuildContext appContext;

  HomePage({this.appContext, this.title});

  void openAnimePage(Anime anime) {
  }

  @override
  Widget build(BuildContext context) {
      
    return Container( // page itself
      color: MiruColors.dark,
      child: ListView( // list so the page can scroll
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          PageTitleDetailed('Discover','Find new anime'),
          CardSection(
            title: 'Unfinished',
            actionText: 'see all',
            onTap: () => {},
            child: Container(
              child: HorizontalAnimeListWatched(
                future: kitsu.getTrending(),
                appContext: appContext
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
                child: HorizontalAnimeListLarge(
                  future: kitsu.getTrending(),
                  appContext: appContext
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
                child: HorizontalAnimeList(
                  future: kitsu.getTrending(),
                  appContext: appContext
                )
              )
            )
          )
        ]
      )
    );
  }
}