import 'package:app/widgets/button.dart';
import 'package:app/widgets/card_section.dart';
import 'package:app/widgets/foldercard.dart';
import 'package:app/widgets/page.dart';
import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';

class LibraryPage extends StatelessWidget  {

  @override
  Widget build(BuildContext context) {

    return Container(
      color: MiruColors.dark,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        primary: false,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              PageTitleDetailed('Library','Find your anime.'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    IconButton(iconData: MiruIcons.folder, text: 'Recently watched', onTap: () {
                      Navigator.pushNamed(context, '/list');
                    }),
                    IconButton(iconData: MiruIcons.heart, text: 'Liked anime', onTap: () {})
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: CardSectionTitle(
                  title: 'Folders',
                  actionText: 'Add new',
                  onTap: () {},
                )
              )
            ])
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20,0,20,20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 15,
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              childAspectRatio: 1.7,
              children: List.generate(5, (index) {
                return FolderCard(
                  color: MiruColors.red,
                  imageURL: '',
                  count: 5,
                  title: 'Studio Ghibli',
                  onTap: () {}
                );
              }),
            ),
          ),
        ],
      )
    );

  }
}