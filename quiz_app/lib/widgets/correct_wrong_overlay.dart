import 'package:flutter/material.dart';
import 'dart:math';

//why stateful -> as we need an animation-> so we will need setState()
class CorrectWrongOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap;
  CorrectWrongOverlay(this._isCorrect,this._onTap);

  @override
  _CorrectWrongOverlayState createState() => _CorrectWrongOverlayState();
}

class _CorrectWrongOverlayState extends State<CorrectWrongOverlay>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation; //0,0.1,0.2,...,1
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(()=>this.setState((){}));
    _iconAnimationController.forward();//start animation
  }

  @override
  void dispose() {
    super.dispose();
    _iconAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: InkWell(
        onTap: ()=>widget._onTap(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Transform.rotate(
                angle: _iconAnimation.value * 2 * pi,
                child: Icon(
                widget._isCorrect ? Icons.done : Icons.clear,
                size: _iconAnimation.value * 90,
              ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget._isCorrect ? 'Correct!' : 'Wrong!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
