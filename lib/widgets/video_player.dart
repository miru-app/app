import 'package:chewie/chewie.dart';
import 'package:app/widgets/video_player_controls.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MiruVideoPlayerWidget extends StatefulWidget {

  final String title;
  final String url;

  const MiruVideoPlayerWidget({Key key, this.title, this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MiruVideoPlayer(title, url);
  }
}

class MiruVideoPlayer extends State<MiruVideoPlayerWidget> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  final String title;
  final String url;

  MiruVideoPlayer(this.title, this.url);

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      customControls: MiruVideoPlayerControls(title: title)
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
    return Chewie(
      controller: _chewieController,
    );
  }
}