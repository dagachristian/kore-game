import 'dart:math';
import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flutter/gestures.dart';

import './components/backyard.dart';
import './components/fly.dart';
import './components/agile-fly.dart';
import './components/house-fly.dart';
import './components/drooler-fly.dart';
import './components/hungry-fly.dart';
import './components/macho-fly.dart';

import '../../config/flame.dart';

class PogGame extends Game {
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Backyard background;

  Random rnd;

  PogGame() {
    initialize();
  }

  void initialize() async {
    flies = <Fly>[];
    rnd = Random();
    resize(await flame.flameUtil.initialDimensions());
    background = Backyard(this);

    spawnFly();
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));
    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);

    flies.forEach((Fly fly) => fly.render(canvas));
  }

  @override
  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }
  
  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
      }
    });
  }
}