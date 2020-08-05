import 'package:flame/components/component.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/cupertino.dart';
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
  @override
  double speed;
  @override
  double maxHealth;
  @override
  double damage;
  @override
  double range;
  final double attackSpeed;
  final double aggroRange;

  @override
  double health;
  @override
  bool attacking = false;
  bool aggro = false;

  final List<Sprite> attackAnim;
  final List<Sprite> deathAnim;
  final String attackSound;
  final String deathSound;

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
      this.aggroRange,
      @required
      this.attackAnim,
      @required
      this.deathAnim,
      @required
      this.attackSound,
      @required
      this.deathSound
    }
  ) : super.fromSprite(width, height, sprite) {
    health = maxHealth;
    enemyHealthBar = EnemyHealthBar(this);
    game.add(enemyHealthBar);
  }

  @override
  void died() {
    if (!isDead) {
      isDead = true;
      health = maxHealth;
      Flame.audio.play(deathSound);
      game.add(EnemyAnimation(this, deathAnim));
      game.remove([this, enemyHealthBar]);
    }
  }

  @override
  void render(Canvas c) {
    if (!attacking) {
      super.render(c);
    }
  }

  void move() {
    if (!game.barrier.collide(this, ((game.player.x + game.player.width/2) - (x + width/2)) / (10000/speed), ((game.player.y + game.player.height/2) - (y + height/2)) / (10000/speed))) {
      x += ((game.player.x + game.player.width/2) - (x + width/2)) / (10000/speed);
      y += ((game.player.y + game.player.height/2) - (y + height/2)) / (10000/speed);
    }
  }

  @override
  void update(double t) {
    if (!isDead) {
      if (health <= 0) {
        died();
      } else {
        if (((game.player.x + game.player.width/2) - (x + width/2)).abs() < range && ((game.player.y + game.player.height/2) - (y + height/2)).abs() < range && !attacking) {
          attack();
        } else if (((game.player.x + game.player.width/2) - (x + width/2)).abs() < aggroRange && ((game.player.y + game.player.height/2) - (y + height/2)).abs() < aggroRange) {
          aggro = true;
          move();
        } else {
          aggro = false;
        }
      }
    }

    super.update(t);
  }

  @override
  void attack() {
    if (DateTime.now().millisecondsSinceEpoch % (1000 / attackSpeed) < 50) {
      attacking = true;
      Flame.audio.play(attackSound);
      game.add(EnemyAnimation(this, attackAnim));
      game.player.health -= damage / 10;
    } 
  }
}