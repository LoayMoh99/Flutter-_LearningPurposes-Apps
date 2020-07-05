import 'package:flame/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_app/game_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util(); //this util ignores the fullscreen
  await flameUtil.fullScreen(); //so we call it
  await flameUtil.setOrientation(DeviceOrientation.portraitUp); //we set our device orientation

  GameController gameController = GameController();
  runApp(gameController.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = gameController.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
}