
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';
import 'package:app/assets.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/anime.dart';
import 'package:app/pages/search.dart';

// Start the app
void main() {
  // Run the app
  //debugPaintSizeEnabled=true;
  runApp(MiruApp());
}

// This is where the app lives
class MiruApp extends StatelessWidget {
Route generate(RouteSettings settings) {
    Route page;
    switch(settings.name) {
      case "/": // home
        page = new  PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return new HomePage();
          },
          transitionsBuilder: (_, Animation<double> animation, Animation<double> second, Widget child) {
            return new FadeTransition(
              opacity: animation,
              child: new FadeTransition(
                opacity: new Tween<double>(begin: 1.0, end: 0.0).animate(second),
                child: child,
              ),
            );
          }
        );
        break;

      case "/search": // search bar view
        page = new  PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return new SearchPage();
          },
          transitionsBuilder: (_, Animation<double> animation, Animation<double> second, Widget child) {
            return new FadeTransition(
              opacity: animation,
              child: new FadeTransition(
                opacity: new Tween<double>(begin: 1.0, end: 0.0).animate(second),
                child: child,
              ),
            );
          }
        );
        break;

        case "/anime": // anime info page
        page = new PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return new AnimePage(anime: settings.arguments);
          },
          transitionsBuilder: (_, Animation<double> animation, Animation<double> second, Widget child) {
            return new FadeTransition(
              opacity: animation,
              child: new FadeTransition(
                opacity: new Tween<double>(begin: 1.0, end: 0.0).animate(second),
                child: child,
              ),
            );
          }
        );
        break;
    }
    return page;
  }

  Route unKnownRoute(RouteSettings settings) {
    return new PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
        return new Container(
          child:Text("Something borked!")
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new WidgetsApp(
      onGenerateRoute: generate,
      onUnknownRoute: unKnownRoute,
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