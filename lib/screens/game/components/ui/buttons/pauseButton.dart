import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

import '../../../dankGame.dart';
import '../../../destructable.dart';

class PauseButton extends SpriteComponent with Tapable, Destructable {
  final DankGame game;

  PauseButton(this.game) : super.fromSprite(game.tileSize, game.tileSize, Sprite('ui/pause.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width)  * 9/10;
    this.y = (size.height - this.height) * 1/12;

    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails details) {
    if (game.paused) {
      game.paused = false;
      game.remove([game.homeButton]);
    } else {
      game.spawn([game.homeButton]);
      game.paused = true;
    }
  }
}
