import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import '../../../destructable.dart';
import '../enemy.dart';

import '../../../dankGame.dart';
class BasicEnemy extends SpriteComponent with Destructable implements Enemy {
  @override
  DankGame game;
  @override
  bool isDead = false;
  @override
  double speed = 90.0;
  @override
  double maxHealth = 50.0;
  @override
  double damage = 10.0;
  @override
  double range = 50.0;

  @override
  double health;

  BasicEnemy(this.game) : super.fromSprite(72.0, 64.0, Sprite('sprites/enemies/basic_enemy.png')) {
    health = maxHealth;
  }

  @override
  void update(double t) {
    if (health <= 0) {
      isDead = true;
      health = maxHealth;
      game.score++;
    }
    if (!isDead) {
      x += (game.player.x - x) / (10000/speed);
      y += (game.player.y - y) / (10000/speed);

      if ((game.player.x - x).abs() < range && (game.player.y - y).abs() < range) {
        attack(t);
      }
    }

    super.update(t);
  }

  @override
  void attack(double t) {
    game.player.health -= damage * t;
  }
}