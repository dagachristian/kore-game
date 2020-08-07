import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

import '../../../dankGame.dart';

class BackButton extends SpriteComponent with Tapable, Destructable {
  final DankGame game;

  BackButton(this.game) : super.fromSprite(game.tileSize * 1.5, game.tileSize * 1.5, Sprite('ui/back.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) * 1/8;
    this.y = (size.height - this.height) * 9/10;

    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails details) {
    game.controllers.enemyController.killAll();
    game.lvl.removeAll();
    game.remove([game.views.gameOverView, game.lvl]);
    game.views.homeView.loadView();
  }
}
