import 'package:flutter/material.dart';
import 'package:quiz_app/utlis/quiz.dart';

class ScorePage extends StatelessWidget {
  final Quiz _quiz;
  ScorePage(this._quiz);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text('Nice QUIZ !',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Text('Your score is ${_quiz.score} / ${_quiz.quizLength}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white,),
              iconSize: 50,
              onPressed: (){Navigator.of(context).pushNamed('/');},
            )
          ],
        ),
    );
  }
}