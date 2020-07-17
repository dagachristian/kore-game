import 'package:flutter/material.dart';

import './boxGame.dart';

class GameScreen extends StatelessWidget {
  final BoxGame game = BoxGame();

  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}