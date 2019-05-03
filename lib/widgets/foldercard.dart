import 'package:app/assets.dart';
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
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.title, style: MiruText.emphasis),
            Text(this.count.toString() + ' anime', style: MiruText.text),
          ],
        )
      )
    );

  }
}