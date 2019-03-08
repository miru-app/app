import 'package:flutter/material.dart'; // Material design package
import 'package:cached_network_image/cached_network_image.dart'; // Used for image caching and dynamic loading
import 'package:app/anime.dart'; // Custom anime classes

class AnimeWidget extends GestureDetector {
  final Anime anime;
  final VoidCallback onTap;
  final Widget child;

  AnimeWidget({this.anime, this.onTap, this.child}) : super(onTap: onTap, child: child);

  @override
  Widget build(BuildContext context) {
    return /*GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text(this.anime.title),
              content: new Text('HAHA, tHIS IS LIVE RELOADED !! [TODO] Figure out how screens work in Flutter and move to next screen'),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
        );
      },
      child: */Container(
        width: 284,
        height: 402,
        child: CachedNetworkImage(
          imageUrl: this.anime.posterUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
        ),
      )/*
    );*/;
  }
}