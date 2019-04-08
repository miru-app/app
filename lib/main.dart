import 'package:flutter/widgets.dart'; // Material design package
//import 'package:flutter/rendering.dart';
import 'package:app/assets.dart';
import 'package:app/pages/splash.dart';
import 'package:app/pages/home.dart'; // Homepage widget
import 'package:app/pages/anime.dart';

// Start the app
void main() {
  // Run the app
  //SdebugPaintSizeEnabled=true;
  runApp(MiruApp());
}

// This is where the app lives
class MiruApp extends StatelessWidget {
Route generate(RouteSettings settings) {
    Route page;
    switch(settings.name) {
      case "/": // Splash screen
        page = new  PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return new SplashPage();
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

      case "/home": // Main home page
        page = new PageRouteBuilder(
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
import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:app/widgets/video_player_controls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(
    ChewieDemo(),
  );
}

class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'Video Player Test'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
        'https://twist.moe/anime/tenseishitaraslimedattaken/[HorribleSubs] Tensei Shitara Slime Datta Ken - 01 [1080p].mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      customControls: MiruVideoPlayerControls(title: 'Tensei Shitara Slime Datta Ken - 01')
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Chewie(
                  controller: _chewieController,
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