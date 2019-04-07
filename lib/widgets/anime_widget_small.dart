import 'package:flutter/widgets.dart'; // Material design package
import 'package:cached_network_image/cached_network_image.dart'; // Used for image caching and dynamic loading
import 'package:app/anime.dart'; // Custom anime classes
import 'package:app/widgets/dialog.dart'; // Custom anime classes
import 'package:app/assets.dart';

/// AnimeWidgetSmall represents an anime display
class AnimeWidgetSmall extends GestureDetector {
  final Anime anime;
  final VoidCallback onTap;
  final Widget child;

  AnimeWidgetSmall({this.anime, this.onTap, this.child}) : super(onTap: onTap, child: child);

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/anime');
    },
    child: Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        child: Hero(
          tag: this.anime.id,
          child: CachedNetworkImage(
            width: 113,
            height: 167,
            fit: BoxFit.cover,
            imageUrl: this.anime.posterUrl,
            placeholder: (BuildContext context, String url) => Container(
              decoration: BoxDecoration(
                color: MiruColors.purplePrimary,
                borderRadius: const BorderRadius.all(Radius.circular(7))
              )
            ),
          )
        )
      )
    )
  );
}