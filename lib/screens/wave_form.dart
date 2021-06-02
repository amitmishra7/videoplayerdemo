import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class WaveForm extends StatefulWidget {
  final Stream<Duration> stream;
  final int duration;
  final AudioPlayer audioPlayer;
  const WaveForm({
    required this.stream,
    required this.duration,
    required this.audioPlayer,
  });
  @override
  _WaveFormState createState() => _WaveFormState();
}

class _WaveFormState extends State<WaveForm> {
  // int _progressValue = 0;
  var rand = Random();

  // StreamController<int> _controller = StreamController.broadcast();
  // @override
  // void dispose() {
  //   _controller.close();
  //   super.dispose();
  // }

  // Future<void> _startProgress() async {
  //   for (int i = 1; i <= 100; i++) {
  //     await Future.delayed(Duration(milliseconds: 10));
  //     _controller.add(i);
  //     // sleep(Duration(milliseconds: 500));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(height: 100, child: _getWaveBar());
  }

  Widget _getWaveBar() {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 100,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        double _height = rand.nextInt(50).toDouble();
        return StreamBuilder<Duration>(
            initialData: Duration(seconds: 0),
            stream: widget.stream,
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: () => widget.audioPlayer.seek(
                    Duration(seconds: (index * widget.duration ~/ 100000))),
                child: Align(
                  child: Container(
                    width: 2,
                    height: _height < 5 ? 5 : _height,
                    //100 for 100 parts and 1000 for milli to sec (100*1000)
                    color: index * (widget.duration / 100000) >=
                            snapshot.data!.inSeconds
                        ? Colors.grey
                        : Colors.red,
                  ),
                ),
              );
            });
      },
      separatorBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => widget.audioPlayer
              .seek(Duration(seconds: (index * widget.duration ~/ 100000))),
          child: Align(
            child: Container(
              width: 2,
              height: 50,
              color: Colors.transparent,
            ),
          ),
        );
      },
    );
  }
}
