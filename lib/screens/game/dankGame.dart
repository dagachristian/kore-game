import 'dart:math';
import 'dart:ui';

import 'package:flame/components/joystick/joystick_action.dart';
import 'package:flame/components/joystick/joystick_component.dart';
import 'package:flame/components/joystick/joystick_directional.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';

import './view.dart';
import './views/index.dart';

import './components/sprites/player.dart';
import './components/sprites/enemy.dart';
import './components/sprites/enemies/index.dart';

import './components/ui/index.dart';

import './controllers/enemyController.dart';

class DankGame extends BaseGame with MultiTouchDragDetector, HasTapableComponents {
  Random r;

  final JoystickComponent joystick = JoystickComponent(
    componentPriority: 0,
    directional: JoystickDirectional(),
    actions: [
      JoystickAction(
        actionId: 1
      )
    ]
  );

  BackGround bg;

  Size screenSize;
  double tileSize;
  
  Player player;
  List<Enemy> enemies;

  EnemyController enemyController;

  View activeView = View.home;
  HomeView homeView;
  GameOverView gameOverView;

  StartButton startButton;

  DankGame() {
    initialize();
  }

  void initialize() async {
    r = Random();
    super.resize(await Flame.util.initialDimensions());

    enemies = <Enemy>[];

    player = Player(this);
    
    homeView = HomeView(this);
    gameOverView = GameOverView(this);

    startButton = StartButton(this);
    
    enemyController = EnemyController(this);
    bg = BackGround(this);

    joystick.addObserver(player);
    
    initSprites();
  }

  void initSprites() {
    add(bg);
    add(homeView);
    add(startButton);
  }

  void spawnEnemy() {
    Enemy enemy = BasicEnemy(this);
    enemy.x = r.nextInt(size.width.toInt()).toDouble();
    enemy.y = r.nextInt(size.height.toInt()).toDouble();
    switch(r.nextInt(4)) {
      case 0:
        enemy.x += size.width;
        break;
      case 1:
        enemy.x -= size.width;
        break;
      case 2:
        enemy.y += size.height;
        break;
      case 3:
        enemy.y -= size.height;
        break;
    }
    enemies.add(enemy);
    add(enemy);
  }

  @override
  void onReceiveDrag(DragEvent drag) {
    joystick.onReceiveDrag(drag);
    super.onReceiveDrag(drag);
  }

  @override
  void render(Canvas c) {
    if (activeView == View.home) {
      add(homeView);
      add(startButton);
    }

    super.render(c);
  }

  @override
  void update(double t) {
    enemyController.update(t);
    player.update(t);
    enemies.forEach((e) => e.update(t));

    super.update(t);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;

    super.resize(size);
  }
}