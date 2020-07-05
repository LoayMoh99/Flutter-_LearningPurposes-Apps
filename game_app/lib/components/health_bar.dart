import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game_app/game_controller.dart';

class HealthBar {
  final GameController gameController;
  Rect healthBarRect, remainingHealthBar;

  HealthBar(this.gameController) {
    double barWidth = gameController.screenSize.width / 1.75;
    healthBarRect = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height * 0.8,
      barWidth,
      gameController.tileSize * 0.5,
    );
    remainingHealthBar = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height * 0.8,
      barWidth,
      gameController.tileSize * 0.5,
    );
  }

  void render(Canvas c) {
    Paint healthBarColor = Paint()..color = Colors.red;
    Paint remainingHealthBarColor = Paint()..color = Colors.green;
    c.drawRect(healthBarRect, healthBarColor);
    c.drawRect(remainingHealthBar, remainingHealthBarColor);
  }

  void update(double t) {
    double barWidth = gameController.screenSize.width / 1.75;
    double percentRemaining =
        gameController.player.currHealth / gameController.player.maxHealth;
    remainingHealthBar = Rect.fromLTWH(
      gameController.screenSize.width / 2 - barWidth / 2,
      gameController.screenSize.height * 0.8,
      barWidth * percentRemaining,
      gameController.tileSize * 0.5,
    );
  }
}
