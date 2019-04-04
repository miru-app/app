import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // Material design package
import 'package:app/apis/kitsu.dart' as KitsuAPI; // Kitsu API methods
import 'package:app/widgets/anime_widget_small.dart';
import 'package:open_iconic_flutter/open_iconic_flutter.dart'; // Anime widget
import 'package:app/assets.dart';

class HomePage extends StatelessWidget  {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        border: new Border.all(color: Colors.blueAccent)
      ),
      //color: MiruColors.purplePrimary,
      child: Column(
        children: <Widget>[
          new Text("hello"),
          new Align(
            alignment: Alignment.bottomCenter,
            child: new Text("Hair cut"),
          ),
        ]
      )
    );
    /*
    return Container(
      child: FutureBuilder(
        future: KitsuAPI.getTrending(), // sets the getTranding method as the expected Future
        builder: (context, snapshot) {
          if (snapshot.hasData) { //checks if the response returns valid data
            final List<AnimeWidgetSmall> animeList = [];

            // Add the widgets to the list
            snapshot.data.forEach((anime) {
              animeList.add(AnimeWidgetSmall(anime: anime));
            });

            // Building the basic UI
            return Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: animeList,
              ),
            );
          } else if (snapshot.hasError) { //checks if the response throws an error
            return Text(snapshot.error);
          }

          return Text("Loading..."); // If no errors and no data, assume still loading
        }
      )
    );*/
  }
}

Container _buildNavigationBar() {
  return Container(
    alignment: Alignment.bottomCenter,
    decoration: new BoxDecoration(
      border: new Border.all(color: Colors.redAccent)
    ),
    //color: Color(0xFF1E1B34),
    height: 10.0,
    margin: EdgeInsets.only(
      top: 5.0,
      right: 5.0,
      left: 5.0,
    ),
    child: Row(
      children: <Widget>[
        _buildHomeButton(),
        //_buildSearchButton(),
        //_buildButton3(),
        //_buildButton4()
      ],
    ),
  );
}

Widget _buildHomeButton() {
  return Container(
    decoration: new BoxDecoration(
      border: new Border.all(color: Colors.greenAccent)
    ),
    height: 48.0,
    width: 150.0,
    //color: Colors.transparent,
    padding: EdgeInsets.only(
      left: 6.0,
      right: 6.0,
    ),
    child: Icon(
      OpenIconicIcons.home,
      color: MiruColors.iconColor,
      size: 32.0,
    ),
  );
}