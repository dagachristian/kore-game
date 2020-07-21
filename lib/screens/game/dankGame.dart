import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flutter/gestures.dart';

import './view.dart';

import '../../config/flame.dart';

class DankGame extends Game {
  Size screenSize;
  double tileSize;

  View activeView = View.home;
  DankGame() {
    initialize();
  }

  void initialize() async {
    resize(await flame.flameUtil.initialDimensions());
  }


  @override
  void render(Canvas canvas) {
    
  }

  @override
  void update(double t) {
    
  }
  
  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    // bool isHandled = false;
  }
}