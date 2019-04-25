import 'package:app/widgets/anime_details_card.dart';
import 'package:app/widgets/anime_info.dart';
import 'package:flutter/material.dart';
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
   return Container( // page itself
      color: MiruColors.bg,
      child: SafeArea( 
        child: ListView( // list so the page can scroll
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Icon(MiruIcons.folder, color: MiruColors.textEmphasis)
                    )
                  ),
                  Icon(MiruIcons.folder_add, color: MiruColors.textEmphasis),
                  Icon(MiruIcons.heart, color: MiruColors.textEmphasis)
                ],
              )
            ),
            AnimeDetailsCard(
              title: this.anime.title,
              part1: '${this.anime.episodeLength} minutes',
              part2: this.anime.showType,
              part3: this.anime.startDate,
              imageUrl: this.anime.coverUrl,
              onPlay: () async {
                final streams = await MiruAPI.getAnimeStreams(41024, 1);

                playerContainer = Visibility(
                  child: MiruVideoPlayerWidget(
                    url: streams[0].file,
                    title: 'Tensei Shitara Slime Datta Ken - 01'
                  ),
                );
              }
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AnimeInfo(title: 'Rating', data: '${this.anime.averageRating}%'),
                  AnimeInfo(title: 'Rating rank', data: '#${this.anime.ratingRank}'),
                  AnimeInfo(title: 'Popularity', data: '#${this.anime.popularityRank}')
                ]
              )
            ),
            AnimeSummary(text: this.anime.synopsis)
          ]
        )
      )
    );

  }
}