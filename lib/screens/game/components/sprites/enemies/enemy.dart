import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';

import './enemyHealthBar.dart';
import './enemyAnimation.dart';

import '../mob.dart';

import '../../../dankGame.dart';
import '../../../destructable.dart';

abstract class Enemy extends SpriteComponent with Destructable implements Mob {
  DankGame game;
  EnemyHealthBar enemyHealthBar;

  @override
  bool isDead = false;
  final double speed;
  @override
  double maxHealth;
  final double damage;
  final double range;
  final double attackSpeed;

  @override
  double health;

  final List<Sprite> attackAnim;
  final List<Sprite> deathAnim;

  Enemy(
    {
      @required
      this.game,
      @required
      double width,
      @required
      double height,
      @required
      Sprite sprite,
      @required
      this.speed,
      @required
      this.maxHealth,
      @required
      this.damage,
      @required
      this.range,
      @required
      this.attackSpeed,
      @required
      this.attackAnim,
      @required
      this.deathAnim
    }
  ) : super.fromSprite(width, height, sprite) {
    health = maxHealth;
    enemyHealthBar = EnemyHealthBar(this);
    game.add(enemyHealthBar);
  }

  void died() {
    if (!isDead) {
      isDead = true;
      health = maxHealth;
      game.add(EnemyAnimation(this, deathAnim));
      game.remove([this, enemyHealthBar]);
    }
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

  void attack() {
    if (DateTime.now().millisecondsSinceEpoch % (1000 / attackSpeed) < 50) {
      game.add(EnemyAnimation(this, attackAnim));
      game.player.health -= damage / 10;
    } 
  }
}