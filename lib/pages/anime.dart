import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';
import 'package:app/anime.dart';
import 'package:app/widgets/video_player.dart';
import 'package:app/apis/miru.dart' as MiruAPI;

class AnimePage extends StatelessWidget  {
  final Anime anime;
  MiruVideoPlayerWidget videoPlayer;
  Visibility playerContainer;

  AnimePage({Key key, this.anime}) : super(key: key);

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
        color: MiruColors.bg2,
        image: DecorationImage(
          image: CachedNetworkImageProvider(this.anime.coverUrl),
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
                child: GestureDetector(
                  onTap: () async {
                    final streams = await MiruAPI.getAnimeStreams(41024, 1);

                    playerContainer = Visibility(
                      child: MiruVideoPlayerWidget(
                        url: streams[0].file,
                        title: 'Tensei Shitara Slime Datta Ken - 01'
                      ),
                    );
                  },
                  child: Text('Play') // TODO add play button
                )
              )
            )
          ),
          Text(this.anime.title, style: MiruText.textHeading),
          Row(
            children: <Widget>[
              Text('${this.anime.episodeLength} minutes', style: MiruText.textEmphasis),
              Text(' - ', style: MiruText.textEmphasis), // TODO make these opaque dots
              Text(this.anime.showType, style: MiruText.textEmphasis),
              Text(' - ', style: MiruText.textEmphasis), // TODO make these opaque dots
              Text(this.anime.startDate, style: MiruText.textEmphasis) // TODO make this change based on show type (movies should only be "endDate" but tv shows should be "startDate - endDate")
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
            Text('${this.anime.averageRating}%', style: MiruText.textHeading)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Rating rank', style: MiruText.textMuted),
            Text('#${this.anime.ratingRank}', style: MiruText.textHeading)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Popularity', style: MiruText.textMuted),
            Text('#${this.anime.popularityRank}', style: MiruText.textHeading)
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
        Text(
          this.anime.synopsis,
          style: MiruText.textDefault,
          maxLines: 5
        ),
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