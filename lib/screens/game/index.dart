import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import './dankGame.dart';

import '../../config/flame.dart' show flame;

class DankGameScreen extends StatelessWidget {
  final DankGame game = DankGame();
  final TapGestureRecognizer tapper = TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    tapper.onTapDown = game.onTapDown;
    flame.flameUtil.addGestureRecognizer(tapper);
    return game.widget;
  }
}