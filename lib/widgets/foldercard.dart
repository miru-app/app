import 'package:app/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';

class FolderCard extends StatelessWidget  {
  final Color color;
  final String title;
  final String imageURL;
  final int count;
  final onTap;

  FolderCard({ this.color, this.title, this.imageURL, this.count, this.onTap });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(),
              child: Opacity(
                opacity: 0.05,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: this.imageURL
                  )
                )
              )
            ),
            Padding(
              padding: EdgeInsets.all(13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(this.title, style: MiruText.emphasis),
                  Text(this.count.toString() + ' anime', style: MiruText.text),
                ],
              )
            )
          ]
        )
      )
    );

  }
}