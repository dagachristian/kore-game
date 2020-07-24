import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import './basicEnemyAttack.dart';

import '../enemy.dart';

import '../../../destructable.dart';
import '../../../dankGame.dart';
class BasicEnemy extends SpriteComponent with Destructable implements Enemy {
  @override
  DankGame game;
  @override
  bool isDead = false;
  @override
  double speed = 150.0;
  @override
  double maxHealth = 50.0;
  @override
  double damage = 50.0;
  @override
  double range = 50.0;

  @override
  double health;

  BasicEnemy(this.game) : super.fromSprite(72.0, 64.0, Sprite('sprites/enemies/basic_enemy.png')) {
    health = maxHealth;
  }

  void died() {
    isDead = true;
    health = maxHealth;
    game.score++;
  }

  @override
  void update(double t) {
    if (!isDead && health <= 0) {
      died();
    } else if (!isDead) {
      x += (game.player.x - x) / (10000/speed);
      y += (game.player.y - y) / (10000/speed);

      if ((game.player.x - x).abs() < range && (game.player.y - y).abs() < range) {
        attack();
      }
    }

    super.update(t);
  }

  @override
  void attack() {
    if (DateTime.now().millisecondsSinceEpoch % 1000 <= 100) {
      game.add(BasicEnemyAttack(game, this));
      game.player.health -= damage / 10;
    } 
  }
}