import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';

import 'enemy.dart';

import '../../../dankGame.dart';

class BasicEnemyDeath extends AnimationComponent {
  final DankGame game;
  final Enemy enemy;

  @override
  final bool destroyOnFinish = true;

  BasicEnemyDeath(this.game, this.enemy) : super(enemy.width, enemy.height, Animation.spriteList(<Sprite>[
    Sprite('sprites/enemies/basic_enemy_death_01.png'),
    Sprite('sprites/enemies/basic_enemy_death_02.png'),
    Sprite('sprites/enemies/basic_enemy_death_03.png'),
    Sprite('sprites/enemies/basic_enemy_death_04.png'),
  ], stepTime: 0.2, loop: false));

  @override
  void resize(Size size) {
    this.x = enemy.x;
    this.y = enemy.y;
  }
}