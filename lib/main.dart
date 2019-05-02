<<<<<<< HEAD

import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
=======
>>>>>>> 6ae65216ebdc8096969c9feaa4d7f8092867ed7a
import 'package:app/assets.dart';
import 'package:app/widgets/app.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter/rendering.dart'; // ui debug

void main() {
  //debugPaintSizeEnabled=true; // enable ui debug
  
  Route generate(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return MiruApp();
      }
    );
  }

  Route unKnownRoute(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
        return Container(
          child: Text("Something borked!")
        );
      }
    );
  }

  runApp(
    WidgetsApp(
      color: MiruColors.dark,
      onGenerateRoute: generate,
      onUnknownRoute: unKnownRoute,
<<<<<<< HEAD
      initialRoute: "/",
      color: MiruColors.purplePrimary,
      navigatorObservers: [new HeroController()],
    );
  }
}


/*
import 'package:flutter/material.dart';
import 'package:app/widgets/video_player.dart';

void main() {
  runApp(
    ChewieDemo(),
  );
}

class ChewieDemo extends StatelessWidget {
  ChewieDemo({this.title = 'Video Player Test'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: MiruVideoPlayerWidget(
                  url: 'https://twist.moe/anime/tenseishitaraslimedattaken/[HorribleSubs] Tensei Shitara Slime Datta Ken - 01 [1080p].mp4',
                  title: 'Tensei Shitara Slime Datta Ken - 01'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:app/widgets/video_player.dart';

void main() {
  runApp(
    PlayerTest(),
  );
}

class PlayerTest extends StatefulWidget {
  Visibility videoPlayer;
  int counter = 0;
  
  PlayerTest({this.title = 'Video Player Test'});

  final String title;

  @override
  Widget build(BuildContext context) {
    videoPlayer = Visibility(
      visible: false,
      child: MiruVideoPlayerWidget(
        url: 'https://twist.moe/anime/tenseishitaraslimedattaken/[HorribleSubs] Tensei Shitara Slime Datta Ken - 01 [1080p].mp4',
        title: 'Tensei Shitara Slime Datta Ken - 01'
      ),
    );

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            videoPlayer,

            RaisedButton(
              child: Text('$counter'),
              color: Theme.of(context).accentColor,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}
*/
=======
      initialRoute: "/"
    )
  );
}
>>>>>>> 6ae65216ebdc8096969c9feaa4d7f8092867ed7a
