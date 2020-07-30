import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';

import 'enemy.dart';

class EnemyAnimation extends AnimationComponent {
  final Enemy enemy;

  @override
  final bool destroyOnFinish = true;

  EnemyAnimation(this.enemy, List<Sprite> sprites, [double stepTime]) : super(enemy.width, enemy.height, Animation.spriteList(sprites, stepTime: stepTime ?? 0.2, loop: false));

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

  @override
  void onDestroy() {
    enemy.attacking = false;
    super.onDestroy();
  }
}