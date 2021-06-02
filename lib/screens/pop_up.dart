// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:try_anything/screens/wave_form.dart';

// class AudPlay extends StatefulWidget {
//   @override
//   _AudPlayState createState() => _AudPlayState();
// }

// class _AudPlayState extends State<AudPlay> {
//   final audioPlayer = AudioPlayer();

//   var _progressValue = 0.0;

//   var _songDuration = 0.0;

//   bool _isAudioPlayerPlaying = false;

//   @override
//   void initState() {
//     super.initState();
//   }

//   something() {
//     // ignore: cancel_subscriptions
//     final streamm = audioPlayer.onAudioPositionChanged.listen((event) {
//       _progressValue = event.inSeconds.toDouble();
//       print(
//           '#########################################> pop_up :: ${_progressValue}');
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//             child: Center(
//                 child: Column(
//       children: [
//         SizedBox(height: 600),
//         Text('$_progressValue $_songDuration $_isAudioPlayerPlaying'),
//         // Slider(
//         //   value: _progressValue * 1000,
//         //   max: _songDuration,
//         //   onChanged: (double value) {
//         //     audioPlayer.seek(Duration(seconds: value ~/ 1000));
//         //   },
//         // ),
//         // _getRequiredWidget()
//         Visibility(
//             visible: _isAudioPlayerPlaying,
//             child: WaveForm(
//                 stream: audioPlayer.onAudioPositionChanged,
//                 duration: _songDuration.toInt(),audioPlayer:audioPlayer)),
//         Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//                 iconSize: 60, icon: Icon(Icons.play_arrow), onPressed: play),
//             SizedBox(width: 20),
//             IconButton(iconSize: 60, icon: Icon(Icons.pause), onPressed: pause),
//             SizedBox(width: 20),
//             IconButton(iconSize: 60, icon: Icon(Icons.stop), onPressed: stop),
//           ],
//         ),
//       ],
//     ))));
//   }

//   Future<void> play() async {
//     final dir = await getExternalStorageDirectory();
//     final dd = dir.listSync().first.path;
//     var localUrl = '${dir.path}/StereoHearts.mp3';
//     print('#########################################> pop_up :: ${localUrl}');
//     var remoteUrl =
//         'https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3';
//     int result = await audioPlayer.play(
//         '/storage/emulated/0/Android/data/com.example.try_anything/files/StereoHearts.mp3');
//     final _songDurationint = await audioPlayer.getDuration();
//     _songDuration = _songDurationint.toDouble();
//     // something();
//     _isAudioPlayerPlaying = true;
//     setState(() {});
//   }

//   void pause() {
//     audioPlayer.pause();
//     _isAudioPlayerPlaying = false;

//     print(
//         '#########################################> pop_up :: last ${audioPlayer.state}');
//     setState(() {});
//   }

//   void stop() {
//     audioPlayer.stop();
//     _isAudioPlayerPlaying = false;

//     print(
//         '#########################################> pop_up :: last ${audioPlayer.state}');
//     setState(() {});
//   }

//   _getRequiredWidget() {
//     print(
//         '#########################################> pop_up :: ${audioPlayer.state}');
//     switch (audioPlayer.state) {
//       case AudioPlayerState.COMPLETED:
//       case AudioPlayerState.STOPPED:
//       case AudioPlayerState.PAUSED:
//         return IconButton(
//             iconSize: 80, icon: Icon(Icons.play_arrow), onPressed: play);
//         break;

//       case AudioPlayerState.PLAYING:
//         return IconButton(
//             iconSize: 80, icon: Icon(Icons.pause), onPressed: stop);
//         break;
//       default:
//         return IconButton(
//             iconSize: 80, icon: Icon(Icons.play_arrow), onPressed: play);
//     }
//   }
// }
