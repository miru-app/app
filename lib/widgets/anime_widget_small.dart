import 'package:flutter/widgets.dart'; // Material design package
import 'package:cached_network_image/cached_network_image.dart'; // Used for image caching and dynamic loading
import 'package:app/anime.dart'; // Custom anime classes
import 'package:app/widgets/dialog.dart'; // Custom anime classes

/// AnimeWidgetSmall represents an anime display
class AnimeWidgetSmall extends GestureDetector {
  final Anime anime;
  final VoidCallback onTap;
  final Widget child;

  AnimeWidgetSmall({this.anime, this.onTap, this.child}) : super(onTap: onTap, child: child);

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      return MiruDialog(
        content: Text(anime.title)
      );
    },
    child: CachedNetworkImage(
      width: 113,
      height: 167,
      fit: BoxFit.fill,
      imageUrl: anime.posterUrl,
      placeholder: (context, url) => new Text("Loading"),
    )
  );
}