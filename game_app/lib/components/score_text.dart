import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game_app/game_controller.dart';

class ScoreText {
  final GameController gameController;
  TextPainter painter;
  Offset position;

  ScoreText(this.gameController) {
    position = Offset.zero;
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    //if ((painter.text ??= "") != gameController.score.toString()) {
    if (painter.text == null) {
      painter.text = TextSpan(
        text: '',
        style: TextStyle(fontSize: 70, color: Colors.black),
      );
    }
    painter.text = TextSpan(
      text: gameController.score.toString(),
      style: TextStyle(fontSize: 70, color: Colors.black),
    );
    //}
    painter.layout();
    position = Offset(
      gameController.screenSize.width / 2 - painter.width / 2,
      gameController.screenSize.height * 0.2 - painter.height / 2,
    );
  }
}
