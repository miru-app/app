import 'package:app/widgets/anime_details_card.dart';
import 'package:app/widgets/anime_episode.dart';
import 'package:app/widgets/anime_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';
import 'package:app/anime.dart';
import 'package:app/widgets/video_player.dart';
import 'package:app/apis/miru.dart' as MiruAPI;
import 'package:app/apis/kitsu.dart' as kitsu; // Kitsu API methods

class AnimePage extends StatefulWidget {
  AnimePage({Key key, this.anime}) : super(key: key);

  final Anime anime;

  @override
  _AnimePageState createState() => new _AnimePageState(anime: anime);
}

class _AnimePageState extends State<AnimePage>  {
  final Anime anime;
  MiruVideoPlayerWidget videoPlayer;
  Visibility playerContainer;
  bool showVideoPlayer = false;
  String currentlyPlayingStream;
  String title = '';

  _AnimePageState({Key key, this.anime});

  void _resumeLastEpisode() {
    setState(() {
      // Do something
    });
  }

  void _resumeEpisode(AnimeEpisode episode) async {
    final streams = await MiruAPI.getAnimeStreams(anime.id, episode.number);
    final stream = streams.first;

    setState(() {
      title = 'stream.file';
      currentlyPlayingStream = stream.file;
      showVideoPlayer = true;
    });
  }

  void _exitVideoPlayer() {
    setState(() {
      showVideoPlayer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Container( // page itself
      color: MiruColors.dark,
      child: SafeArea( 
        child: ListView( // list so the page can scroll
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Visibility(
              visible: showVideoPlayer,
              child: MiruVideoPlayerWidget(
                url: currentlyPlayingStream,
                title: 'Tensei Shitara Slime Datta Ken - 01',
                onExit: _exitVideoPlayer
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Icon(MiruIcons.folder, color: MiruColors.textemphasis)
                    )
                  ),
                  Icon(MiruIcons.folder_add, color: MiruColors.textemphasis),
                  Icon(MiruIcons.heart, color: MiruColors.textemphasis)
                ],
              )
            ),
            AnimeDetailsCard(
              title: title,
              episodeLength: '${anime.episodeLength} minutes',
              showType: anime.showType,
              startDate: anime.startDate,
              imageUrl: anime.coverUrl,
              onTap: _resumeLastEpisode
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AnimeInfo(title: 'Rating', data: '${anime.averageRating}%'),
                  AnimeInfo(title: 'Rating rank', data: '#${anime.ratingRank}'),
                  AnimeInfo(title: 'Popularity', data: '#${anime.popularityRank}')
                ]
              )
            ),
            AnimeSummary(text: anime.synopsis),
            AnimeEpisodeSection(
              future: kitsu.getAnimeEpisodes(anime.id),
              onTap: _resumeEpisode
            )
          ]
        )
      )
    );

  }
}