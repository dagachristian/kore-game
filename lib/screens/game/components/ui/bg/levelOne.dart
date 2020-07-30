import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import '../../items/index.dart';
import '../../ui/index.dart';

import '../../../dankGame.dart';
import '../../../destructable.dart';

class LevelOne extends SpriteComponent with Destructable implements Level {
  DankGame game;
  List<SpriteComponent> children;

  LevelOne(this.game) : super.fromSprite(5500.0, 5500.0, Sprite('bg/level_01.jpg'));

  @override
  void reset() {
    x = 0;
    y = 0;
    children = [];
    game.enemyController.killAll();
    game.enemyController.populateMapWithEnemies(game.lvl, 40);
    // itemController

    BasicHeal basicHeal = BasicHeal(game);
    basicHeal.x = 100;
    basicHeal.y = 100;
    game.spawn([basicHeal]);
    children.add(basicHeal);
    BasicHeal basicHeal2 = BasicHeal(game);
    basicHeal2.x = 150;
    basicHeal2.y = 150;
    game.spawn([basicHeal2]);
    children.add(basicHeal2);
  }

  @override
  void moveX(double x) {
    this.x += x;
    children.forEach((SpriteComponent c) => c.x += x);
  }

  @override
  void moveY(double y) {
    this.y += y;
    children.forEach((SpriteComponent c) => c.y += y);
  }

  @override
  void addChild(SpriteComponent child) {
    children.add(child);
  }

  @override
  void addChildren(List<SpriteComponent> childs) {
    children.addAll(childs);
  }

  @override
  void removeChild(SpriteComponent child) {
    children.remove(child);
  }

  @override
  void removeAll() {
    children = [];
  }
}