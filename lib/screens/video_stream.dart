import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoStream extends StatefulWidget {
  @override
  _VideoStreamState createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;
  final videoUrl =
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Error.mp4';
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videoUrl);

    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      autoInitialize: true,
      aspectRatio: 16 / 9,
      additionalOptions: (context) => <OptionItem>[
        OptionItem(onTap: null, iconData: Icons.time_to_leave, title: 'title')
      ],
      errorBuilder: (context, errorMessage) {
        return Text('Error Occured');
      },
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Stream'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: _controller.value.isInitialized
              ? Container(
                  height: 300,
                  width: 533,
                  padding: const EdgeInsets.all(8.0),
                  child: Chewie(
                    controller: _chewieController,
                  ),
                )
              : Container(
                  height: 90,
                  width: 160,
                  color: Colors.yellow,
                )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        },
        child: _controller.value.isPlaying
            ? Icon(Icons.pause)
            : Icon(Icons.play_arrow),
      ),
    );
  }
}
