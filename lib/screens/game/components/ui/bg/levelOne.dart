import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/components/ui/index.dart';
import 'package:kore_game/screens/game/dankGame.dart';
import 'package:kore_game/screens/game/destructable.dart';

class LevelOne extends SpriteComponent with Destructable implements Level {
  DankGame game;
  List<SpriteComponent> children;

  LevelOne(this.game) : super.fromSprite(5000.0, 5000.0, Sprite('bg/level_01.jpg'));

  @override
  void reset() {
    x = 0;
    y = 0;
    children = [];
    game.enemyController.killAll();
    game.enemyController.populateMapWithEnemies(game.lvl, 40);
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
}