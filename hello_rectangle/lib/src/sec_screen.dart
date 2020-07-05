import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final mypair;
  SecondScreen(this.mypair) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
      child: Center(
        child: Text(
        mypair.toString().toUpperCase(),
        style: TextStyle(
          fontSize: 40,
          color: Colors.redAccent
        )
       ),
      ),
    ),
    );
  }
}