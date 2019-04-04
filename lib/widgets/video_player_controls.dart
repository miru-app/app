/*
  These controls were made by editting the contents of https://github.com/brianegan/chewie/blob/master/lib/src/cupertino_controls.dart
*/

import 'dart:async';

import 'package:chewie/src/chewie_player.dart';
import 'package:chewie/src/chewie_progress_colors.dart';
import 'package:chewie/src/cupertino_progress_bar.dart';
import 'package:chewie/src/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_iconic_flutter/open_iconic_flutter.dart';
import 'package:video_player/video_player.dart';

class MiruVideoPlayerControls extends StatefulWidget {
  MiruVideoPlayerControls({
    @required this.title,
  });

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MiruVideoPlayerControlsState();
  }
}

class _MiruVideoPlayerControlsState extends State<MiruVideoPlayerControls> {
  VideoPlayerValue _latestValue;
  bool _hideStuff = true;
  Timer _hideTimer;
  final marginSize = 5.0;
  Timer _expandCollapseTimer;
  Timer _initTimer;

  VideoPlayerController controller;
  ChewieController chewieController;

  @override
  Widget build(BuildContext context) {
    chewieController = ChewieController.of(context);
    controller = chewieController.videoPlayerController;
    final orientation = MediaQuery.of(context).orientation;
    final barHeight = orientation == Orientation.portrait ? 30.0 : 47.0;

    return GestureDetector(
      onTap: () {
        _cancelAndRestartTimer();
      },
      child: AbsorbPointer(
        absorbing: _hideStuff,
        child: Column(
          children: <Widget>[
            _buildTopBar(barHeight, widget.title),
            _buildHitArea(),
            _buildBottomBar(barHeight),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  void _dispose() {
    controller.removeListener(_updateState);
    _hideTimer?.cancel();
    _expandCollapseTimer?.cancel();
    _initTimer?.cancel();
  }

  @override
  void didChangeDependencies() {
    final _oldController = chewieController;
    chewieController = ChewieController.of(context);
    controller = chewieController.videoPlayerController;

    if (_oldController != chewieController) {
      _dispose();
      _initialize();
    }

    super.didChangeDependencies();
  }

  AnimatedOpacity _buildBottomBar(
    double barHeight,
  ) {
    return AnimatedOpacity(
      opacity: _hideStuff ? 0.0 : 1.0,
      duration: Duration(milliseconds: 300),
      child: Container(
        color: Colors.transparent,
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
          color: Colors.black,
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.0),
                Colors.black,
              ],
              stops: [
                0.0,
                1.0
              ]
            )
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: marginSize),
            height: barHeight,
            child: Row(
              children: <Widget>[
                _buildPlayPause(controller, barHeight),
                _buildPosition(),
                _buildProgressBar(),
                _buildRemaining()
              ],
            ),
          ),
        )
      ),
    );
  }

  Expanded _buildHitArea() {
    return Expanded(
      child: GestureDetector(
        onTap: _latestValue != null && _latestValue.isPlaying
            ? _cancelAndRestartTimer
            : () {
                _hideTimer?.cancel();

                setState(() {
                  _hideStuff = false;
                });
              },
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }

  GestureDetector _buildPlayPause(
    VideoPlayerController controller,
    double barHeight,
  ) {
    return GestureDetector(
      onTap: _playPause,
      child: Container(
        height: barHeight,
        color: Colors.transparent,
        padding: EdgeInsets.only(
          left: 6.0,
          right: 6.0,
        ),
        child: Icon(
          controller.value.isPlaying
              ? OpenIconicIcons.mediaPause
              : OpenIconicIcons.mediaPlay,
          color: Colors.white,
          size: 16.0,
        ),
      ),
    );
  }

  Widget _buildPosition() {
    final position =
        _latestValue != null ? _latestValue.position : Duration(seconds: 0);

    return Padding(
      padding: EdgeInsets.only(right: 12.0),
      child: Text(
        formatDuration(position),
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.0
        ),
      ),
    );
  }

  Widget _buildRemaining() {
    final position = _latestValue != null && _latestValue.duration != null
        ? _latestValue.duration - _latestValue.position
        : Duration(seconds: 0);

    return Padding(
      padding: EdgeInsets.only(right: 12.0),
      child: Text(
        '-${formatDuration(position)}',
        style: TextStyle(
          color: Colors.white,
          inherit: true,
          fontSize: 12.0
        ),
      ),
    );
  }

/*
  Widget _buildTopBar(
    Color backgroundColor,
    Color iconColor,
    double barHeight,
    double buttonPadding,
  ) {
    return Container(
      height: barHeight,
      margin: EdgeInsets.only(
        top: marginSize,
        right: marginSize,
        left: marginSize,
      ),
      child: Row(
        children: <Widget>[
          chewieController.allowFullScreen
              ? _buildExpandButton(
                  backgroundColor, iconColor, barHeight, buttonPadding)
              : Container(),
          Expanded(child: Container())
        ],
      ),
    );
  }
*/

  AnimatedOpacity _buildTopBar(
    double barHeight,
    String title
  ) {
    return AnimatedOpacity(
      opacity: _hideStuff ? 0.0 : 1.0,
      duration: Duration(milliseconds: 300),
      child: Container(
        color: Colors.transparent,
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
          color: Colors.black,
            gradient: LinearGradient(
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
              colors: [
                Colors.black.withOpacity(0.0),
                Colors.black,
              ],
              stops: [
                0.0,
                1.0
              ]
            )
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: marginSize),
            height: barHeight,
            child: Row(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }

  void _cancelAndRestartTimer() {
    _hideTimer?.cancel();

    setState(() {
      _hideStuff = false;

      _startHideTimer();
    });
  }

  Future<Null> _initialize() async {
    controller.addListener(_updateState);

    _updateState();

    if ((controller.value != null && controller.value.isPlaying) ||
        chewieController.autoPlay) {
      _startHideTimer();
    }

    _initTimer = Timer(Duration(milliseconds: 200), () {
      setState(() {
        _hideStuff = false;
      });
    });
  }

  Widget _buildProgressBar() {
    ChewieProgressColors colors = chewieController.cupertinoProgressColors ??
      ChewieProgressColors(
        playedColor: Color(0xFFDB3A34),
        handleColor: Color(0xFFC13931),
        bufferedColor: Color(0xFF000000),
        backgroundColor: Color(0x64F2EEEB),
      );

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: CupertinoVideoProgressBar(
          controller,
          onDragStart: () {
            _hideTimer?.cancel();
          },
          onDragEnd: () {
            _startHideTimer();
          },
          colors: colors,
        ),
      ),
    );
  }

  void _playPause() {
    setState(() {
      if (controller.value.isPlaying) {
        _hideStuff = false;
        _hideTimer?.cancel();
        controller.pause();
      } else {
        _cancelAndRestartTimer();

        if (!controller.value.initialized) {
          controller.initialize().then((_) {
            controller.play();
          });
        } else {
          controller.play();
        }
      }
    });
  }

  void _startHideTimer() {
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _hideStuff = true;
      });
    });
  }

  void _updateState() {
    setState(() {
      _latestValue = controller.value;
    });
  }
}