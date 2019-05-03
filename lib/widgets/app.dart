import 'package:app/assets.dart';
import 'package:app/tabs/home.dart';
import 'package:app/tabs/library.dart';
import 'package:app/tabs/search.dart';
import 'package:app/widgets/navigation.dart';
import 'package:flutter/widgets.dart';

class MiruApp extends StatefulWidget {

  MiruApp();

  @override
  MiruAppState createState() {
    return MiruAppState();
  }
}

class MiruAppState extends State<MiruApp> {
  
  @override
  void initState() {
    super.initState();
  }

  int index = 1;
  @override
  Widget build(BuildContext ctx) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: MiruColors.dark
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Offstage(
                    offstage: index != 1,
                    child: TickerMode(
                      enabled: index == 1,
                      child: HomeTab(
                        appContext: ctx
                      ),
                    ),
                  ),
                  Offstage(
                    offstage: index != 2,
                    child: TickerMode(
                      enabled: index == 2,
                      child: SearchTab(
                        appContext: ctx
                      )
                    ),
                  ),
                  Offstage(
                    offstage: index != 3,
                    child: TickerMode(
                      enabled: index == 3,
                      child: LibraryTab(
                        appContext: ctx
                      )
                    ),
                  ),
                  Offstage(
                    offstage: index != 4,
                    child: TickerMode(
                      enabled: index == 4,
                      child: SearchTab(
                        appContext: ctx
                      )
                    ),
                  ),
                  Offstage( // testing tab
                    offstage: index != 5,
                    child: TickerMode(
                      enabled: index == 5,
                      child: SearchTab()
                    ),
                  ),
                ],
              )
            ),
            BottomBar(
              onTap: (int pageIndex) => {
                setState(() {
                  index = pageIndex;
                })
              },
              selected: this.index
            )
          ],
        )
      )
    );
  }
}