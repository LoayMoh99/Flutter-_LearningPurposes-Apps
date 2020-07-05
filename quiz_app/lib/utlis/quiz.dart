import 'package:quiz_app/utlis/question.dart';

class Quiz{
  List<Question> _questions;
  int _currQuesIndex =-1;
  int _score =0;
  Quiz(this._questions){
    _questions.shuffle();
  }

  int get score => _score;
  int get quesNum => (_currQuesIndex==-1)?_currQuesIndex+2: _currQuesIndex+1;
  int get quizLength => _questions.length;
  List<Question> get questions => _questions;
  Question get nextQues{
    _currQuesIndex++;
    if(_currQuesIndex>=quizLength) return null;
    else return _questions[_currQuesIndex];
  }

  void answer(bool isCorrect) {
    if (isCorrect) _score++;
  }
}