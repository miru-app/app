import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart'; // Material design package
import 'package:app/assets.dart';

class AnimePage extends StatelessWidget  {
  final dynamic anime;

  AnimePage({Key key, this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: MiruColors.pinkPrimary,
          child: Text(this.anime.title, style: MiruText.textHeading)
        ),
        Container(
          width: 113,
          height: 167,
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
      ],
    );
  }
}