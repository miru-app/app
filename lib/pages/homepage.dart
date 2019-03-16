import 'package:flutter/widgets.dart'; // Material design package
import 'package:app/apis/kitsu.dart' as kitsu; // Kitsu API methods
import 'package:app/widgets/horizontalanimelist.dart'; // Anime widget

class HomePage extends StatelessWidget  {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: HorizontalAnimeList(
            future: kitsu.getTranding()
          )
    );
  }
}