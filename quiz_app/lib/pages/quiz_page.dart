import 'package:flutter/material.dart';
import 'package:quiz_app/pages/score_page.dart';
import 'package:quiz_app/utlis/question.dart';
import 'package:quiz_app/utlis/quiz.dart';
import 'package:quiz_app/widgets/answer_button.dart';
import 'package:quiz_app/widgets/correct_wrong_overlay.dart';
import 'package:quiz_app/widgets/ques_bar.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // instance variables
  Quiz currentQuiz = new Quiz([
    Question('Loay is bad engineer?', false),
    Question('Flutter is the future of app developing?', true),
    Question('Moamen is great youtuber?', true),
    Question('Pizza is healthy?', false),
  ]);
  Question currentQuestion;
  String quesText;
  int quesNumber;
  bool isCorrect;
  bool overlayBeDisplayed =false;

  @override
  void initState() {
    super.initState();
    //currentQuestion = currentQuiz.questions[0]; 
    currentQuestion = currentQuiz.nextQues;
    quesText = currentQuestion.question;
    quesNumber = currentQuiz.quesNum; //OR =1 3latool
  }

  void handleAnswer(bool currAnswer){
    isCorrect = (currAnswer == currentQuestion.answer);
    currentQuiz.answer(isCorrect); //this will update the score
    this.setState((){
      overlayBeDisplayed=true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
          Column(
          children: <Widget>[
            AnswerButton(true,()=>handleAnswer(true)),
            QuestionBar(quesText,quesNumber),
            AnswerButton(false,()=>handleAnswer(false))
          ],
        ),  
      overlayBeDisplayed ? CorrectWrongOverlay(isCorrect,
        (){
          currentQuestion = currentQuiz.nextQues;
          if(currentQuestion!=null){
          this.setState((){
              overlayBeDisplayed=false;//disable overlay
              //update the currQues text and num
              quesText = currentQuestion.question;
              quesNumber = currentQuiz.quesNum;
            }
          );
          }
          // here we want to navigate to the score page and remove every
          //other routes so we cant go back again!
          else Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context)=> ScorePage(currentQuiz)),
            (Route route)=> route ==null
          );
        }
      ) : Container(),
      ],
    );
  }
}