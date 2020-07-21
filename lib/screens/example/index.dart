import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import './pogGame.dart';

import '../../config/index.dart' show config;
import '../../config/flame.dart' show flame;

class GameScreen extends StatelessWidget {
  final PogGame game = PogGame(config.sharedPrefs);
  final TapGestureRecognizer tapper = TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    tapper.onTapDown = game.onTapDown;
    flame.flameUtil.addGestureRecognizer(tapper);
    return game.widget;
  }
}