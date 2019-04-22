import 'package:flutter/widgets.dart'; // Material design package
import 'package:cached_network_image/cached_network_image.dart'; // Used for image caching and dynamic loading
import 'package:app/anime.dart'; // Custom anime classes
import 'package:app/assets.dart';

/// AnimeCardLarge represents an anime display
class AnimeCardLarge extends GestureDetector {
  final Anime anime;
  final VoidCallback onTap;
  final Widget child;

  AnimeCardLarge({this.anime, this.onTap, this.child}) : super(onTap: onTap, child: child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector( // card section - CARD -------------------
        onTap: () {
          Navigator.pushNamed(context, '/anime', arguments: this.anime);
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 22, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: CachedNetworkImage(
                    width: 181,
                    height: 257,
                    fit: BoxFit.cover,
                    imageUrl: this.anime.posterUrl,
                    placeholder: (BuildContext context, String url) => Container(
                      decoration: BoxDecoration(
                        color: MiruColors.purplePrimary,
                        borderRadius: const BorderRadius.all(Radius.circular(7))
                      )
                    ),
                  )
              ),
              Container(
                width: 181,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  this.anime.title,
                  style: MiruText.textEmphasis,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2
                )
              )
            ]
          )
        )
      )
    );
  }
}