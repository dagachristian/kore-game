import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';

import './player.dart';

class PlayerDeath extends AnimationComponent {
  final Player player;

  @override
  final bool destroyOnFinish = true;

  PlayerDeath(this.player) : super(player.width, player.height, Animation.spriteList(<Sprite>[
    Sprite('sprites/player/player_death_01.png'),
    Sprite('sprites/player/player_death_02.png'),
    Sprite('sprites/player/player_death_03.png'),
    Sprite('sprites/player/player_death_04.png'),
    Sprite('sprites/player/player_death_05.png'),
    Sprite('sprites/player/player_death_06.png'),
  ], stepTime: 0.2, loop: false));

  @override
  void resize(Size size) {
    this.x = player.x;
    this.y = player.y;
  }
}