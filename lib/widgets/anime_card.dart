import 'package:flutter/widgets.dart'; // Material design package
import 'package:cached_network_image/cached_network_image.dart'; // Used for image caching and dynamic loading
import 'package:app/anime.dart'; // Custom anime classes
import 'package:app/assets.dart';

class AnimeCard extends StatelessWidget {
  final Anime anime;
  static double height = 216;
  final onTap;

  AnimeCard({this.anime, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: this.onTap,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 22, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: CachedNetworkImage(
                    width: 110,
                    height: 156,
                    fit: BoxFit.cover,
                    imageUrl: this.anime.posterUrl,
                    placeholder: (BuildContext context, String url) => AnimeCardPlaceholder(),
                  )
              ),
              Container(
                width: 110,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  this.anime.title,
                  style: MiruText.text,
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

class AnimeCardLarge extends AnimeCard {
  final Anime anime;
  static double height = 317;
  final onTap;

  AnimeCardLarge({this.anime, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: this.onTap,
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
                    placeholder: (BuildContext context, String url) => AnimeCardPlaceholderLarge(),
                  )
              ),
              Container(
                width: 181,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  this.anime.title,
                  style: MiruText.text,
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

class AnimeCardWatched extends AnimeCard {
  final Anime anime;
  final double percentageWatched;
  static double height = 230;
  final onTap;

  AnimeCardWatched({this.anime, this.percentageWatched, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 22, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: CachedNetworkImage(
                    width: 110,
                    height: 156,
                    fit: BoxFit.cover,
                    imageUrl: this.anime.posterUrl,
                    placeholder: (BuildContext context, String url) => AnimeCardPlaceholder(),
                  )
              ),
              Container(
                width: 110,
                height: 4,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: MiruColors.placeholder
                ),
                child: FractionallySizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: MiruColors.action // make gradient ??
                    ),
                  ),
                  heightFactor: 1.0,
                  widthFactor: this.percentageWatched,
                  alignment: Alignment.centerLeft,
                )
              ),
              Container(
                width: 110,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  this.anime.title,
                  style: MiruText.text,
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

class AnimeCardList extends StatelessWidget  {
  final String title;
  final String type;
  final String imageURL;

  static const double aspectRatio = .522;

  AnimeCardList({ this.title, this.imageURL, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/anime', arguments: {});
        },
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: CachedNetworkImage(
                    width: 161,
                    height: 227,
                    fit: BoxFit.cover,
                    imageUrl: this.imageURL,
                    placeholder: (BuildContext context, String url) => AnimeCardPlaceholderList(),
                  )
              ),
              Container(
                width: 161,
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  this.type,
                  style: MiruText.text,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1
                )
              ),
              Container(
                width: 161,
                child: Text(
                  this.title,
                  style: MiruText.emphasis,
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

class AnimeCardPlaceholder extends StatelessWidget {

  AnimeCardPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MiruColors.placeholder,
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      height: 156,
      width: 110,
    );
  }
}

class AnimeCardPlaceholderList extends StatelessWidget {

  AnimeCardPlaceholderList();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MiruColors.placeholder,
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      height: 227,
      width: 161,
    );
  }
}

class AnimeCardPlaceholderLarge extends StatelessWidget {

  AnimeCardPlaceholderLarge();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MiruColors.placeholder,
        borderRadius: const BorderRadius.all(Radius.circular(5))
      ),
      height: 257,
      width: 181,
    );
  }
}