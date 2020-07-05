import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_app/components/score_text.dart';

import 'components/enemy.dart';
import 'components/health_bar.dart';
import 'components/player.dart';
import 'enemy_generator.dart';

//this is the brain of our Game!
//it contains all instance variables and logic of our game
class GameController extends Game {
  //this class will need a constructor and 3 more methods!!
  //3 methods are ={render + update + resize}
  GameController(this.storage) {
    initialize();
  }
  final SharedPreferences storage;
  Random rand;
  Size screenSize;
  double tileSize;
  Player player;
  EnemyGenerator enemyGenerator;
  List<Enemy> enemies;
  HealthBar healthBar;
  ScoreText scoreText;
  int score;

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    rand = Random();
    player = Player(this); //here @this@ represents the curr gamecontroller
    enemies = List<Enemy>();
    enemyGenerator = EnemyGenerator(this);
    healthBar = HealthBar(this);
    score = 0;
    scoreText = ScoreText(this);
  }

  void render(Canvas c) {
    //NOTE : the arrangment of rendering differs ;
    // here we render the backGr then our player-> so player is on the top
    //draw the background
    Rect backGround = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backGroundColor = Paint()..color = Color(0xFFFAFAFA);
    c.drawRect(backGround, backGroundColor);

    player.render(c);
    enemies.forEach((enemy) => enemy.render(c));
    healthBar.render(c);
    scoreText.render(c);
  }

  void update(double t) {
    enemyGenerator.update(t);
    enemies.forEach((enemy) => enemy.update(t));
    enemies.removeWhere((enemy) => enemy.isDead);
    player.update(t);
    scoreText.update(t);
    healthBar.update(t);
  }

  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 10;
  }

  void onTapDown(TapDownDetails d) {
    print(d.globalPosition);
    enemies.forEach((enemy) {
      if (enemy.enemyRect.contains(d.globalPosition)) {
        enemy.onTapDown();
      }
    });
  }

  void generateEnemies() {
    //there is 4 cases for enimes to come from: top-bottom-left-right..
    double x, y; //offsets for which enemy will start
    switch (rand.nextInt(4)) {
      case 0: //top
        x = rand.nextDouble() * screenSize.width;
        y = tileSize * -2.5;
        break;
      case 1: //bottom
        x = rand.nextDouble() * screenSize.width;
        y = screenSize.height + tileSize * 2.5;
        break;
      case 2: //left
        x = tileSize * -2.5;
        y = rand.nextDouble() * screenSize.height;
        break;
      case 3: //right
        x = screenSize.width + tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        break;
      default:
    }
    enemies.add(Enemy(this, x, y));
  }
}
