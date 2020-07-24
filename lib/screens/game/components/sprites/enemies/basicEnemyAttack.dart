import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';

import 'enemy.dart';

import '../../../dankGame.dart';

class BasicEnemyAttack extends AnimationComponent {
  final DankGame game;
  final Enemy enemy;

  @override
  final bool destroyOnFinish = true;

  BasicEnemyAttack(this.game, this.enemy) : super(enemy.width, enemy.height, Animation.spriteList(<Sprite>[
    Sprite('sprites/enemies/basic_enemy_attack_01.png'),
    Sprite('sprites/enemies/basic_enemy_attack_02.png'),
    Sprite('sprites/enemies/basic_enemy.png')
  ], stepTime: 0.2, loop: false));

  @override
  void resize(Size size) {
    this.x = enemy.x;
    this.y = enemy.y;
  }

  @override
  void update(double t) {
    x = enemy.x;
    y = enemy.y;
    super.update(t);
  }
}