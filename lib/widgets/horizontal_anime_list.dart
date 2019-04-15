import 'dart:async';
import 'package:app/widgets/anime_widget_small.dart'; // Anime widget
import 'package:app/anime.dart';
import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';

class HorizontalAnimeList extends StatelessWidget  {
  final String title;
  final Future<dynamic> future;

  HorizontalAnimeList({this.title, this.future});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<dynamic>(
        future: future, // sets the getTranding method as the expected Future
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) { //checks if the response returns valid data
            final List<AnimeWidgetSmall> animeList = [];

            // Add the widgets to the list
            snapshot.data.forEach((Anime anime) {
              animeList.add(AnimeWidgetSmall(anime: anime));
            });

            // Building the basic UI
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 30, 0, 5),
                      child: const Text('Trending', style: MiruText.textHeading),
                    ),
                    Row(
                      children: <Widget>[
                        ListView(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          scrollDirection: Axis.horizontal,
                          children: animeList,
                        )
                      ]
                    )
                  ]
                )
            );
          } else if (snapshot.hasError) { //checks if the response throws an error
            return Text(snapshot.error);
          }

          return const Text('Loading...'); // If no errors and no data, assume still loading
        }
      )
    );
  }
}