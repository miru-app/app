import 'package:flutter/widgets.dart'; // Material design package
import 'package:cached_network_image/cached_network_image.dart'; // Used for image caching and dynamic loading
import 'package:app/anime.dart'; // Custom anime classes
import 'package:app/widgets/dialog.dart'; // Custom anime classes

class AnimeWidgetSmall extends GestureDetector {
  final Anime anime;
  final VoidCallback onTap;
  final Widget child;

  AnimeWidgetSmall({this.anime, this.onTap, this.child}) : super(onTap: onTap, child: child);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return MiruDialog(
          content: Text(this.anime.title)
        );
      },
      child: CachedNetworkImage(
          width: 113,
          height: 167,
          fit: BoxFit.fill,
          imageUrl: this.anime.posterUrl,
          placeholder: (context, url) => new Text("Loading"),
      )
    );
  }
}