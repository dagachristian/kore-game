import 'dart:math';
import 'dart:ui';

import 'package:flame/components/joystick/joystick_action.dart';
import 'package:flame/components/joystick/joystick_component.dart';
import 'package:flame/components/joystick/joystick_directional.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/gestures.dart';
import 'package:kore_game/screens/game/components/sprites/enemies/basicEnemy.dart';


import './view.dart';

import './components/sprites/player.dart';
import './components/sprites/enemy.dart';

import './controllers/enemyController.dart';

class DankGame extends BaseGame with TapDetector, MultiTouchDragDetector {
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

  View activeView = View.home;
  Player player;
  List<Enemy> enemies;

  EnemyController enemyController;

  void initSprites() {
    add(player);
    add(joystick);

    enemyController.start();
  }

  void spawnEnemy() {
    Enemy enemy = BasicEnemy(this);
    enemy.x = r.nextInt(size.width.toInt()).toDouble();
    enemy.y = r.nextInt(size.height.toInt()).toDouble();
    enemies.add(enemy);
    add(enemy);
  }

  @override
  void onAttach() async {
    super.onAttach();

    r = Random();
    super.resize(await Flame.util.initialDimensions());

    player = Player();
    enemies = <Enemy>[];
    
    enemyController = EnemyController(this);

    joystick.addObserver(player);
    
    initSprites();
  }

  @override
  void onReceiveDrag(DragEvent drag) {
    joystick.onReceiveDrag(drag);
    super.onReceiveDrag(drag);
  }

  @override
  void render(Canvas c) {
    super.render(c);
  }

  @override
  void update(double t) {
    enemyController.update(t);
    player.update(t);
    enemies.forEach((e) => e.update(t));
  }

  @override
  void onTapDown(TapDownDetails details) {}
}