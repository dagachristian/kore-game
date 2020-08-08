import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';

import '../../items/item.dart';
import '../../sprites/enemies/enemy.dart';

import '../../../dankGame.dart';

abstract class Level extends SpriteComponent with Destructable {
  final DankGame game;
  List<SpriteComponent> children;

  Level(this.game, {@required double width, @required double height, @required Sprite sprite}) : super.fromSprite(width, height, sprite) {
    children = [];
  }

  void start() {
    game.player.respawn();
  }

  void reset() {
    x = 0;
    y = 0;
    children = [];
    game.controllers.enemyController.killAll();
    game.controllers.itemController.destroyAll();
    game.barrier.removeBarriers();
    start();
  }

  void levelFail() {
    game.spawn([game.views.gameOverView]);
  }

  void levelPass() {
    game.controllers.enemyController.killAll();
    removeAll();
    game.remove([game.views.playingView]);
    game.spawn([game.views.nextLevelView]);
  }

  Enemy getEnemy();
  Enemy getBoss();

  Item getItem();

  void moveX(double x) {
    this.x += x;
    children.forEach((SpriteComponent c) => c.x += x);
  }

  void moveY(double y) {
    this.y += y;
    children.forEach((SpriteComponent c) => c.y += y);
  }

  void addChild(SpriteComponent child) {
    children.add(child);
  }

  void addChildren(List<SpriteComponent> childs) {
    children.addAll(childs);
  }

  void removeChild(SpriteComponent child) {
    children.remove(child);
  }

  void removeAll() {
    children = [];
  }

  @override
  void onDestroy() {
    removeAll();
  }
}