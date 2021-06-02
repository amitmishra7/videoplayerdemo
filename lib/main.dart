import 'package:flutter/material.dart';
import 'package:try_anything/screens/MyDrawer.dart';
import 'package:try_anything/screens/reso.dart';
import 'package:try_anything/screens/video_stream.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Title",
      initialRoute: '/video_stream',
      routes: {
        '/': (context)=>MyDrawer(),
        '/video_stream':(context)=>VideoStream(),
        '/video_stream2':(context)=>MyHomePage(),

      },
    );
  }
}
