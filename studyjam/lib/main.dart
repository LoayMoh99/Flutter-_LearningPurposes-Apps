import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:studyjam/screens/screen1.dart';
import 'package:studyjam/screens/screen2.dart';
import './utilities/my_theme.dart';

import './screens/h_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      //home: HomeScreen(),
      initialRoute: '/second', //initial route(screen) to start with
      //initialRoute: (condition) ? '/' : '/first' , 
      routes: {
       '/' : (context) => HomeScreen(),
       '/first' : (context) => Screen1(),
       '/second' : (context) => SecondScreen(),
       },
      );
  }
}