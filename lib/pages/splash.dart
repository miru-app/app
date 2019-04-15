import 'package:flutter/widgets.dart';
import 'package:app/widgets/notification_card.dart';
import 'package:app/widgets/button.dart';
import 'package:app/assets.dart';
import 'package:app/widgets/horizontal_anime_list.dart';
import 'package:app/apis/kitsu.dart' as kitsu;

class SplashPage extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MiruColors.bg,
      child: Column(
        children: <Widget>[
          HorizontalAnimeList(
            title: 'Trending',
            future: kitsu.getTrending()
          ),
        ]
      )
    );
  }
}