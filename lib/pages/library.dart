import 'package:app/widgets/button.dart';
import 'package:app/widgets/card_section.dart';
import 'package:app/widgets/foldercard.dart';
import 'package:app/widgets/page.dart';
import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';

class LibraryPage extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {

    return Container( // page itself
      color: MiruColors.dark,
      child: ListView(
        children: <Widget>[
          PageTitleDetailed('Library','Find your anime.'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                IconButton(iconData: MiruIcons.folder, text: 'Recently watched', onTap: () {}),
                IconButton(iconData: MiruIcons.heart, text: 'Liked anime', onTap: () {})
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: CardSection(
              title: 'Folders',
              actionText: 'Add new',
              onTap: () {},
              child: FolderCard(
                color: MiruColors.red,
                imageURL: '',
                count: 5,
                title: 'Studio Ghibli',
                onTap: () {}
              )
            )
          )
        ],
      )
    );

  }
}