import 'package:flutter/widgets.dart'; // Material design package
import 'package:app/apis/kitsu.dart' as kitsu; // Kitsu API methods
import 'package:app/widgets/horizontal_anime_list.dart'; // Anime widget

class AnimePage extends StatelessWidget  {
  final String title;

  AnimePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HorizontalAnimeList(
        title: 'Anime here',
            future: kitsu.getTrending()
          )
    );
  }
}