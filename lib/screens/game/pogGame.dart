import 'dart:math';
import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flutter/gestures.dart';
import 'package:kore_game/screens/game/components/start-button.dart';

import './view.dart';
import './views/home-view.dart';
import './views/lost-view.dart';
import './components/backyard.dart';
import './components/fly.dart';
import './components/agile-fly.dart';
import './components/house-fly.dart';
import './components/drooler-fly.dart';
import './components/hungry-fly.dart';
import './components/macho-fly.dart';
import './controllers/spawner.dart';

import '../../config/flame.dart';

class PogGame extends Game {
  Random rnd;

  FlySpawner spawner;

  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Backyard background;
  StartButton startButton;

  View activeView = View.home;
  HomeView homeView;
  LostView lostView;

  PogGame() {
    initialize();
  }

  void initialize() async {
    flies = <Fly>[];
    rnd = Random();
    resize(await flame.flameUtil.initialDimensions());

    spawner = FlySpawner(this);

    background = Backyard(this);
    startButton = StartButton(this);
    homeView = HomeView(this);
    lostView = LostView(this);
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

    if (activeView == View.home) homeView.render(canvas);

    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
    }

    if (activeView == View.lost) lostView.render(canvas);
  }

  @override
  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
    spawner.update(t);
  }
  
  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;

    if (!isHandled && startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandled = true;
      }
    }

    if (!isHandled) {
      bool didHitAFly = false;
      flies.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
          isHandled = true;
          didHitAFly = true;
        }
      });
      if (activeView == View.playing && !didHitAFly) {
        activeView = View.lost;
      }
    }
  }
}