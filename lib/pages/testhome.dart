import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // Material design package
import 'package:app/assets.dart';

class THomePage extends StatelessWidget  {
  final String title;

  THomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Container card = Container(
      child: GestureDetector( // card section - CARD -------------------
        onTap: () {
          Navigator.pushNamed(context, '/anime', arguments: {});
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 22, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                child: CachedNetworkImage(
                    width: 110,
                    height: 156,
                    fit: BoxFit.cover,
                    imageUrl: 'https://media.kitsu.io/anime/poster_images/395/large.jpg?1431655416',
                    placeholder: (BuildContext context, String url) => Container(
                      decoration: BoxDecoration(
                        color: MiruColors.purplePrimary,
                        borderRadius: const BorderRadius.all(Radius.circular(7))
                      )
                    ),
                  )
              ),
              Container(
                width: 110,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text("Howl's Moving Castle", style: MiruText.textEmphasis) // TODO add triple dot if it overflows
              )
            ]
          )
        )
      )
    );
  	
    final Container cardBig = Container(
      child: GestureDetector( // card section - CARD -------------------
        onTap: () {
          Navigator.pushNamed(context, '/anime', arguments: {});
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 22, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(7)),
                child: CachedNetworkImage(
                    width: 181,
                    height: 257,
                    fit: BoxFit.cover,
                    imageUrl: 'https://media.kitsu.io/anime/poster_images/395/large.jpg?1431655416',
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
                child: Text("Howl's Moving Castle on two lines so I can debug", style: MiruText.textEmphasis)// TODO add triple dot if it overflows
              )
            ]
          )
        )
      )
    );

    final dynamic infocard = Container(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(7)),
            child: CachedNetworkImage(
              width: 110,
              height: 156,
              fit: BoxFit.cover,
              imageUrl: 'https://media.kitsu.io/anime/poster_images/395/large.jpg?1431655416',
              placeholder: (BuildContext context, String url) => Container(
                decoration: BoxDecoration(
                  color: MiruColors.purplePrimary,
                  borderRadius: const BorderRadius.all(Radius.circular(7))
                )
              ),
            )
          ),
          Column(
            children: <Widget>[
              Text("Howl's Moving Castle"),
              Text('Movie')
            ]
          )
        ],
      )
    );
    final dynamic cardlist = 
        Column( // card section
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
              child: Row( // card section - top bar
                children: <Widget>[
                  Expanded(
                    child: Text('Recent', style: MiruText.textHeading),
                  ),
                  Text('see all', style: MiruText.textDefault)
                ]
              )
            ),
            Container(
              height: 212, //fixed height, card height + 2 lines of text
              child: 
              ListView(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  card, card, card //content
                ]
              )
            )
          ]
        );

    final dynamic cardListBig = 
        Column( // card section
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
              child: Row( // card section - top bar
                children: <Widget>[
                  Expanded(
                    child: Text('Popular', style: MiruText.textHeading),
                  ),
                  Text('see all', style: MiruText.textButton)
                ]
              )
            ),
            Container(
              height: 313, //fixed height, card height + 2 lines of text
              child: 
              ListView(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  cardBig, cardBig, cardBig //content
                ]
              )
            )
          ]
        );
      
    return Container( // page itself
      color: MiruColors.bg,
      child: ListView( // list so the page can scroll
        children: <Widget>[
          cardlist,
          Container(
            margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
            child: cardListBig
          ),
          infocard
        ]
      )
    );

  }
}