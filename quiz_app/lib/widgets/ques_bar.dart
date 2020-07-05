import 'package:flutter/material.dart';

class QuestionBar extends StatefulWidget {
  final String _question;
  final int _questionNum;

  QuestionBar(this._question, this._questionNum);

  @override
  _QuestionBarState createState() => _QuestionBarState();
}

class _QuestionBarState extends State<QuestionBar>
    with SingleTickerProviderStateMixin {
  Animation<double> _fontSizeAnimation; //0,0.1,0.2,...,1
  AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _fontSizeAnimation = CurvedAnimation(
        parent: _fontSizeAnimationController, curve: Curves.bounceOut);

    //this is used as the fontsize is changing so we have to add listener !
    //so each time the animation changes we need to re-render the widget..
    _fontSizeAnimation.addListener(()=> this.setState((){}));

    //to start our animation we need to @forward@ the animationController
    _fontSizeAnimationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _fontSizeAnimationController.dispose();
  }

  @override
  void didUpdateWidget(QuestionBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question != widget._question)
    {
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            'Question ' +
                widget._questionNum.toString() +
                ': ' +
                widget._question,
            style: TextStyle(
              fontSize: _fontSizeAnimation.value* 16,
            ),
          ),
        ),
      ),
    );
  }
}
