import 'package:flutter/material.dart';

import './dankGame.dart';

class DankGameScreen extends StatelessWidget {
  final dankGame = DankGame();

  @override
  Widget build(BuildContext context) {
    return dankGame.widget;
  }
}