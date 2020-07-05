import 'package:flutter/material.dart';
import 'package:quiz_app/pages/landing_page.dart';
import 'package:quiz_app/pages/quiz_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
       '/' : (context) => LandingPage(),
       '/quiz' : (context) => QuizPage(),
       },
    );
  }
}