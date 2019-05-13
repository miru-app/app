import 'package:app/widgets/anime_card.dart';
import 'package:app/widgets/searchbar.dart';
import 'package:app/widgets/tag.dart';
import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';

class SearchPage extends StatefulWidget {

  @override
  SearchPageState createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage>  {
  
  void search(String text) {
    setState(() {
      input = text;
      showResults = input != ''; //if no text, dont show results
      // TODO get results from api
    });
  }

  bool showResults = false;
  String input = '';
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MiruColors.dark,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: SearchBar(
              onEdit: search,
              focus: focusNode
            )
          ),
          Visibility(
            visible: !showResults,
            child: Expanded(
              child: GestureDetector(
                onTap: () {
                  focusNode.unfocus();
                },
                child: Container(
                  color: MiruColors.dark, // in container with color. otherwise hitbox isnt proper
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Recent searches", style: MiruText.heading),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Tag(text: 'A silent voice', onTap: () {}),
                            Tag(text: 'Kimi no na wa', onTap: () {}),
                            Tag(text: 'Is this search thingy even working?', onTap: () {})
                          ],
                        )
                      )
                    ]
                  ),
                )
              )
            )
          ),
          Visibility(
            visible: showResults,
            child: Expanded(
              child: GestureDetector(
                onTap: () {
                  focusNode.unfocus();
                },
                child: Offstage(
                  offstage: !showResults,
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    primary: false,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,20),
                        sliver: SliverGrid.count(
                          crossAxisSpacing: 15,
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          childAspectRatio: AnimeCardList.aspectRatio,
                          children: List.generate(5, (index) {
                            return AnimeCardList(
                              imageURL: 'https://animevibe.tv/wp-content/uploads/Kimetsu-no-Yaiba.jpg',
                              title: 'Howl\'s Moving Castle ',
                              type: 'Movie'
                            );
                          }),
                        ),
                      ),
                    ],
                  )
                )
              )
            )
          )
        ]
      )
    );

  }
}