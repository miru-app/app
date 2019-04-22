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

  final dynamic info = Container(
    margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Rating', style: MiruText.textMuted),
            Text('84%', style: MiruText.textHeading)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Rating rank', style: MiruText.textMuted),
            Text('#28', style: MiruText.textHeading)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Popularity', style: MiruText.textMuted),
            Text('#21', style: MiruText.textHeading)
          ],
        )
      ]
    )
  );

  final dynamic summary = Container(
    margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          child: Text('Summary', style: MiruText.textHeading)
        ),
        Text('That jumbled piece of architecture, that cacophony of hissing steam and creaking joints, with smoke billowing from it as it moves on its own... That castle is home to the magnificent wizard Howl, infamous for both his magical prowess and for being a womanizer—or so the rumor goes in Sophie Hatter\'s small town. Sophie, as the plain daughter of a hatmaker, does not expect much from her future and is content with working hard in the shop. However, Sophie\'s simple life takes a turn for the exciting when she is ensnared in a disturbing situation, and the mysterious wizard appears to rescue her. Unfortunately, this encounter, brief as it may be, spurs the vain and vengeful Witch of the Waste—in a fit of jealousy caused by a past discord with Howl—to put a curse on the maiden, turning her into an old woman. In an endeavor to return to normal, Sophie must accompany Howl and a myriad of eccentric companions—ranging from a powerful fire demon to a hopping scarecrow—in his living castle, on a dangerous adventure as a raging war tears their kingdom apart. [Written by MAL Rewrite]',
        style: MiruText.textDefault,
        maxLines: 5),
        Text('Read more', style: MiruText.textButton) // TODO not show for smaller than 5 lines
      ],
    )
  );

   return Container( // page itself
      color: MiruColors.bg,
      child: SafeArea( 
        child: ListView( // list so the page can scroll
          children: <Widget>[
            top,
            infoCard,
            info,
            summary
          ]
        )
      )
    );

  }
}