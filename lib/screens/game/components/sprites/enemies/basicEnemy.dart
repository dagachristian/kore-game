import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/dankGame.dart';

import '../enemy.dart';

class BasicEnemy extends SpriteComponent implements Enemy {
  @override
  DankGame game;
  @override
  bool isDead = false;
  @override
  double speed = 90.0;
  @override
  double health = 50.0;
  @override
  double damage = 10.0;
  @override
  double range = 50.0;

  BasicEnemy(this.game) : super.fromSprite(72.0, 64.0, Sprite('sprites/enemies/basic_enemy.png'));

  @override
  void update(double t) {
    if (health <= 0) {
      isDead = true;
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