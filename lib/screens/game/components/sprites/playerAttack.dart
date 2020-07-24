import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/dankGame.dart';

class PlayerAttack extends AnimationComponent {
  final DankGame game;

  @override
  final bool destroyOnFinish = true;

  PlayerAttack(this.game) : super(game.player.width, game.player.height, Animation.spriteList(<Sprite>[
    Sprite('sprites/player/playeropen.png'),
    Sprite('sprites/player/playerclosed.png')
  ], stepTime: 0.5, loop: false));

  @override
  void resize(Size size) {
    this.x = game.player.x;
    this.y = game.player.y;
  }
}