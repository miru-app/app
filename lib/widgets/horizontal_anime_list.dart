import 'dart:async';
import 'package:app/pages/anime.dart';
import 'package:app/widgets/anime_card.dart'; // Anime widget
import 'package:app/anime.dart';
import 'package:flutter/widgets.dart';

class HorizontalAnimeList extends StatelessWidget  {
  final Future<dynamic> future;
  final BuildContext appContext;

  HorizontalAnimeList({this.future, this.appContext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AnimeCard.height,
      child: FutureBuilder<dynamic>(
        future: future, // sets the getTranding method as the expected Future
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) { //checks if the response returns valid data
            final List<AnimeCard> animeList = [];

            // Add the widgets to the list
            snapshot.data.forEach((Anime anime) {
              animeList.add(AnimeCard(anime: anime, onTap: () {
                openAnimePage(appContext, anime);
              }));
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
          // TODO placeholders
        }
      )
    );
  }
}

class HorizontalAnimeListLarge extends StatelessWidget  {
  final Future<dynamic> future;
  final BuildContext appContext;

  HorizontalAnimeListLarge({this.future, this.appContext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AnimeCardLarge.height,
      child: FutureBuilder<dynamic>(
        future: future, // sets the getTranding method as the expected Future
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) { //checks if the response returns valid data
            final List<AnimeCardLarge> animeList = [];

            // Add the widgets to the list
            snapshot.data.forEach((Anime anime) {
              animeList.add(AnimeCardLarge(anime: anime, onTap: () {
                openAnimePage(appContext, anime);
              }));
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
          // TODO placeholders
        }
      )
    );
  }
}

class HorizontalAnimeListWatched extends StatelessWidget  {
  final Future<dynamic> future;
  final BuildContext appContext;

  HorizontalAnimeListWatched({this.future, this.appContext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AnimeCardWatched.height,
      child: FutureBuilder<dynamic>(
        future: future, // sets the getTranding method as the expected Future
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) { //checks if the response returns valid data
            final List<AnimeCardWatched> animeList = [];

            // Add the widgets to the list
            snapshot.data.forEach((Anime anime) {
              animeList.add(AnimeCardWatched(anime: anime, percentageWatched: .42, onTap: () {
                openAnimePage(appContext, anime);
              }));
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
          // TODO placeholders
        }
      )
    );
  }
}