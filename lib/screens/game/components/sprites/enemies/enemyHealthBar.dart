import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import '../mob.dart';

import '../../../destructable.dart';

class EnemyHealthBar extends SpriteComponent with Destructable {
  final Mob mob;

  EnemyHealthBar(this.mob) : super.fromSprite(mob.width, 5, Sprite('ui/healthbar.png'));

  @override
  void update(double t) {
    this.x = mob.x;
    this.y = mob.y - 10;

    this.width = mob.health / mob.maxHealth * mob.width;

    super.update(t);
  }
}