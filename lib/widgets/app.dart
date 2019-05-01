import 'package:app/tabs/home.dart';
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

  int index = 0;
  @override
  Widget build(BuildContext ctx) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Stack(
            children: <Widget>[
              Offstage(
                offstage: index != 0,
                child: TickerMode(
                  enabled: index == 0,
                  child: HomeTab(),
                ),
              ),
              Offstage(
                offstage: index != 1,
                child: TickerMode(
                  enabled: index == 1,
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
          }
        )
      ],
    );
  }
}