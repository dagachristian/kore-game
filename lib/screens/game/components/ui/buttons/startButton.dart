import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

import '../../../dankGame.dart';
import '../../../destructable.dart';

class StartButton extends SpriteComponent with Tapable, Destructable {
  final DankGame game;

  StartButton(this.game) : super.fromSprite(game.tileSize * 3, game.tileSize * 3, Sprite('ui/start.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) / 2;
    this.y = (size.height - this.height) * 3/4;

    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails details) {
    game.spawn([game.lvl]);
    game.remove([game.homeView, game.startButton, game.bg]);
    game.player.respawn();
    game.lvl.reset();
  }
}
