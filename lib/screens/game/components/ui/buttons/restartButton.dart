import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

import '../../../destructable.dart';
import '../../../dankGame.dart';

class RestartButton extends SpriteComponent with Tapable, Destructable {
  final DankGame game;

  RestartButton(this.game) : super.fromSprite(game.tileSize * 3, game.tileSize * 3, Sprite('ui/restart.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) / 2;
    this.y = (size.height - this.height) * 3/4;

    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails details) {
    game.lvl.reset();
    game.remove([game.gameOverView, game.restartButton, game.backButton]);
  }
}
