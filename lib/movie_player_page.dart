import 'package:flutter/material.dart';

//import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
/*
* Author : Yancy
* E-mail : 986244073@qq.com
* Create : 2019/5/14
* */

class MoviePlayer extends StatefulWidget {
  final String url;

  const MoviePlayer({Key key, this.url}) : super(key: key);

  @override
  _MoviePlayerState createState() => _MoviePlayerState(url);
}

class _MoviePlayerState extends State<MoviePlayer> {
  final String url;
  _MoviePlayerState(this.url);
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    print("++++++++++++++++++++++++++"+this.url);
    _controller = VideoPlayerController.network(this.url)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: 'video',
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
            )),
      ),
    );
  }

}
