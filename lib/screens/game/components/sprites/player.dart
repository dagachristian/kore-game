import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/joystick/joystick_component.dart';
import 'package:flame/components/joystick/joystick_events.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/components/sprites/enemy.dart';
import 'package:kore_game/screens/game/dankGame.dart';

class Player extends SpriteComponent implements JoystickListener {
  final DankGame game;

  final double speed = 115.0;
  final double maxHealth = 100.0;

  bool isDead = false;
  double damage = 20.0;
  double range = 100.0;
  double health;

  double intensity = 0;
  double direction = 0;
  bool _move = false;

  Player(this.game) : super.fromSprite(96.0, 132.0, Sprite('sprites/player/player.png'));

  void attack() {
    game.enemies.forEach((Enemy enemy) {
      if ((enemy.x - x).abs() < range && (enemy.y - y).abs() < range) {
        enemy.health -= damage;
      }
    });
  }

  @override
  void update(double t) {
    if ((health == null) ? false: health <= 0) {
      isDead = true;
      game.enemyController.stop();
      health = maxHealth;
    }
    if (!isDead) {
      if (_move) {
        if (x >= -60 && x <= game.size.width + 10 && y >= -60 && y <= game.size.height + 10) {
          x += intensity * speed * cos(direction) / 100.0;
          y += intensity * speed * sin(direction) / 100.0;
        } else {
          if (x < -60) {
            x += game.size.width + 20;
          } else if (x > game.size.width + 10) {
            x -= game.size.width + 60;
          } else if (y < -60) {
            y += game.size.height + 20;
          } else if (y > game.size.height + 10) {
            y -= game.size.height + 60;
          } else {
            x = (game.size.width - this.width)/2;
            y = (game.size.width - this.width)/2;
          }
        }
      }
    }
    
    super.update(t);
  }

  @override
  void resize(Size size) {
    this.x = (size.width - this.width)/2;
    this.y = (size.width - this.width)/2;

    health = maxHealth;

    super.resize(size);
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (!isDead) {
      attack();
    }
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    _move = event.directional != JoystickMoveDirectional.IDLE;

    if (_move) {
      intensity = event.intensity;
      direction = event.radAngle;
    }
  }
}