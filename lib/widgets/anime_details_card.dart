import 'package:app/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class AnimeDetailsCard extends StatelessWidget {
  final String title;
  final String episodeLength;
  final String showType;
  final String startDate;
  final String imageUrl;
  final onPlay;

  AnimeDetailsCard({this.title, this.episodeLength, this.showType, this.startDate, this.imageUrl, this.onPlay});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 259,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: MiruColors.bg2,
        image: DecorationImage(
          image: CachedNetworkImageProvider(this.imageUrl),
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
                  onTap: onPlay,
                  child: Text('Play') // TODO add play button
                )
              )
            )
          ),
          Text(this.title, style: MiruText.textHeading),
          Row(
            children: <Widget>[
              Text(this.episodeLength, style: MiruText.textEmphasis),
              Text(' - ', style: MiruText.textEmphasis), // TODO make these opaque dots
              Text(this.showType, style: MiruText.textEmphasis),
              Text(' - ', style: MiruText.textEmphasis), // TODO make these opaque dots
              Text(this.startDate, style: MiruText.textEmphasis) // TODO make this change based on show type (movies should only be "endDate" but tv shows should be "startDate - endDate")
            ]
          )
        ],
      ),
    );
  }
}