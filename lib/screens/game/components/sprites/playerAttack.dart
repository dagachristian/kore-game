import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';

import './player.dart';

import '../../dankGame.dart';

class PlayerAttack extends AnimationComponent {
  final DankGame game;
  final Player player;

  @override
  final bool destroyOnFinish = true;

  PlayerAttack(this.game, this.player) : super(player.width, player.height, Animation.spriteList(<Sprite>[
    Sprite('sprites/player/player_attack_01.png'),
    Sprite('sprites/player/player_attack_02.png'),
    Sprite('sprites/player/player.png')
  ], stepTime: 0.25, loop: false));

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
}