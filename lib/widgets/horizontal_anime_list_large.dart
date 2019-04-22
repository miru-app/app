import 'dart:async';
import 'package:app/widgets/anime_card_large.dart'; // Anime widget
import 'package:app/anime.dart';
import 'package:flutter/widgets.dart';

class HorizontalAnimeListLarge extends StatelessWidget  {
  final String title;
  final Future<dynamic> future;

  HorizontalAnimeListLarge({this.title, this.future});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<dynamic>(
        future: future, // sets the getTranding method as the expected Future
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) { //checks if the response returns valid data
            final List<AnimeCardLarge> animeList = [];

            // Add the widgets to the list
            snapshot.data.forEach((Anime anime) {
              animeList.add(AnimeCardLarge(anime: anime));
            });

            // Building the basic UI
            return ListView(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              scrollDirection: Axis.horizontal,
              children: animeList
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