import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // Material design package
import 'package:app/assets.dart';

class TAnimePage extends StatelessWidget  {

  TAnimePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final dynamic top = Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text('back') // TODO add back icon
          ),
          Text('Icon'), // TODO add plus icon
          Text('Icon') // TODO add like icon
        ],
      )
    );

    final dynamic infoCard = Container(
      height: 259,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: MiruColors.pinkPrimary,
        image: DecorationImage(
          image: CachedNetworkImageProvider("https://media.kitsu.io/anime/cover_images/395/original.png?1519181074"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(MiruColors.blackOverlay, BlendMode.srcATop)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                child: Text('Play') // TODO add play button
              )
            )
          ),
          Text("Howl's Moving Castle", style: MiruText.textHeading),
          Row(
            children: <Widget>[
              Text('164 minutes', style: MiruText.textEmphasis),
              Text(' - ', style: MiruText.textEmphasis), // TODO make these opaque dots
              Text('movie', style: MiruText.textEmphasis),
              Text(' - ', style: MiruText.textEmphasis), // TODO make these opaque dots
              Text('2004', style: MiruText.textEmphasis)
            ]
          )
        ],
      ),
    );

    return Container( // page itself
      color: MiruColors.bg,
      child: ListView( // list so the page can scroll
        children: <Widget>[
          top,
          infoCard
        ]
      )
    );

  }
}