import 'package:flutter/material.dart';

class Promotions extends StatefulWidget {
  @override
  _PromotionsState createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Promotions")
      ),
      body: Container(child: Text("Promotions"),),
    );
  }
}