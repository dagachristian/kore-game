import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/destructable.dart';

import 'enemy.dart';

class EnemyHealthBar extends SpriteComponent with Destructable {
  final Enemy enemy;

  EnemyHealthBar(this.enemy) : super.fromSprite(enemy.width, 5, Sprite('ui/healthbar.png'));

  @override
  void update(double t) {
    this.x = enemy.x;
    this.y = enemy.y - 10;

    this.width = enemy.health / enemy.maxHealth * enemy.width;

    super.update(t);
  }
}