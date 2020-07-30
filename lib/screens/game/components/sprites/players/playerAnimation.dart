import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';

import 'player.dart';

class PlayerAnimation extends AnimationComponent {
  final Player player;

  @override
  final bool destroyOnFinish = true;

  PlayerAnimation(this.player, List<Sprite> anim) : super(player.width, player.height, Animation.spriteList(anim, stepTime: 0.2, loop: false));

  @override
  void resize(Size size) {
    this.x = player.x;
    this.y = player.y;
  }

  @override
  void update(double t) {
    x = player.x;
    y = player.y;
    super.update(t);
  }

  @override
  void onDestroy() {
    player.attacking = false;
    super.onDestroy();
  }
}