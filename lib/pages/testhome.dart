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
                borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                child: Text("Howl's Moving Castle",
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

    final Container cardWatched = Container(
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
                borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                height: 4,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: MiruColors.bg2
                ),
                child: FractionallySizedBox(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: MiruColors.primaryColor
                    ),
                  ),
                  heightFactor: 1.0,
                  widthFactor: .42, // TODO progress bar
                  alignment: Alignment.centerLeft,
                )
              ),
              Container(
                width: 110,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text("Howl's Moving Castle",
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
                borderRadius: const BorderRadius.all(Radius.circular(5)),
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
                child: Text("Howl's Moving Castle on two lines so I can debug testy testy",
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
    final dynamic topBar = Container(
      margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text("Miru", style: MiruText.textSmallTitle)
          ),
          Text("ICON"),
          Text("ICON")
        ]
      )
    );

    final dynamic search = GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/search');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: MiruColors.bg2
        ),
        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
        padding: EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Text('ICON'),
            Expanded(
              child: Text('Search...', style: MiruText.textInactive)
            )
          ],
        )
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
                  Text('see all', style: MiruText.textButton)
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

    final dynamic unfinished = 
        Column( // card section
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
              child: Row( // card section - top bar
                children: <Widget>[
                  Expanded(
                    child: Text('Unfinished', style: MiruText.textHeading),
                  ),
                  Text('see all', style: MiruText.textButton)
                ]
              )
            ),
            Container(
              height: 226, //fixed height, card height + 2 lines of text
              child: 
              ListView(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  cardWatched, cardWatched, cardWatched //content
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
          topBar,
          Hero(
            tag: 'search',
            child: search
          ),
          unfinished,
          Container(
            margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
            child: cardListBig
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
            child: cardlist
          )
        ]
      )
    );

  }
}