import 'package:flutter/widgets.dart';
import 'package:game_app/game_controller.dart';

class Player {
  GameController gameController;
  int maxHealth, currHealth;
  Rect playerRect;
  bool isDead = false;

  Player(this.gameController) {
    maxHealth = currHealth = 300;
    final size = gameController.tileSize * 1.5;
    playerRect = Rect.fromLTWH(gameController.screenSize.width / 2 - size / 2,
        gameController.screenSize.height / 2 - size / 2, size, size);
  }

  //these two methods for rendering our player on the screen
  void render(Canvas c) {
    Paint playerColor = Paint()..color = Color(0xFF0000FF); //blue
    c.drawRect(playerRect, playerColor);
  }

  void update(double t) {
    if (!isDead && currHealth <= 0) {
      isDead = true;
      //reset the game
      gameController.initialize();
    }
  }
}
