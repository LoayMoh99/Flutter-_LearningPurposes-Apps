import 'package:game_app/game_controller.dart';

class EnemyGenerator {
  final GameController gameController;
  final int maxGenerateInterval = 3000;
  final int minGenerateInterval = 700;
  final int intervalChange = 3;
  final int maxEnemies = 7;
  int currentInterval;
  int nextEnemy;

  EnemyGenerator(this.gameController) {
    killAllEnemies();
    currentInterval = maxGenerateInterval;
    nextEnemy = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAllEnemies() {
    gameController.enemies.forEach((enemy) => enemy.isDead = true);
  }

  void update(double t) {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now >= nextEnemy && gameController.enemies.length < maxEnemies) {
      gameController.generateEnemies();
      if (currentInterval > minGenerateInterval) {
        currentInterval -= ((currentInterval * 0.1).toInt() + intervalChange);
      }
      nextEnemy = now + currentInterval;
    }
  }
}
