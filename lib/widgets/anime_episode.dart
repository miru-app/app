import 'dart:async';

import 'package:app/assets.dart';
import 'package:app/anime.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class AnimeEpisodeSection extends StatelessWidget {
  final Future<dynamic> future;
  final onTap;

  const AnimeEpisodeSection({this.future, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: FutureBuilder<dynamic>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) { //checks if the response returns valid data
            final List<Episode> episodeList = [];

            // Add the widgets to the list
            snapshot.data.forEach((AnimeEpisode episode) {
              episodeList.add(
                Episode(
                  imageUrl: episode.thumbnailUrl,
                  number: episode.number,
                  title: episode.title,
                  onTap: () {
                    onTap(episode);
                  }
                )
              );
            });

            // Building the basic UI
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text('Episodes', style: MiruText.textHeading),
                    ),
                    Text('quick play', style: MiruText.textButton)
                  ]
                ),
                Column(
                  children: episodeList
                )
              ],
            );

          } else if (snapshot.hasError) { //checks if the response throws an error
            return Text(snapshot.error);
          }

          return const Text('Loading Episodes...'); // If no errors and no data, assume still loading
          // TODO placeholders
        }
      )
    );
  }
}

class Episode extends StatelessWidget {
  final String imageUrl;
  final int number;
  final String title;
  final onTap;

  Episode({this.imageUrl, this.title, this.number, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Row(
        children: <Widget>[
          Container(
            height: 99,
            width: 99,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: MiruColors.bg2,
              image: DecorationImage(
                image: CachedNetworkImageProvider(this.imageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(MiruColors.blackOverlay, BlendMode.srcATop)
              ),
            ),
            child: GestureDetector(
              onTap: this.onTap, // TODO make it work for the entire image
              child: Container(
                height: 99,
                width: 99,
                child: Center(
                  child: Text('Play') // TODO add play button
                )
              )
            )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('episode ${this.number}', style: MiruText.textSmallTitle),
                  Text(
                    this.title,
                    style: MiruText.textDefault,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis
                  )
                ],
              )
            )
          )
        ],
      )
    );
  }
}