/*
import 'package:flutter/widgets.dart'; // Material design package
//import 'package:flutter/rendering.dart';
import 'package:app/assets.dart';
import 'package:app/pages/testpage.dart';
import 'package:app/pages/homepage.dart'; // Homepage widget

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
      case "/":
        page = new  PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return new TestPage();
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

      case "/home":
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
      color: MiruColors.purplePrimary
    );
  }
}
*/

/*
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

void main() => runApp(VideoApp());

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
*/

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
  ChewieDemo({this.title = 'Chewie Demo'});

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
      customControls: MiruVideoPlayerControls()
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