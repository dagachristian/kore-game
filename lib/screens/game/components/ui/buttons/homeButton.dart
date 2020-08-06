import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

import '../../../dankGame.dart';
import '../../../destructable.dart';

class HomeButton extends SpriteComponent with Tapable, Destructable {
  final DankGame game;

  HomeButton(this.game) : super.fromSprite(game.tileSize * 4, game.tileSize * 4, Sprite('ui/home.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) / 2;
    this.y = (size.height - this.height) / 2;

    super.resize(size);
  }

 @override
  void onTapDown(TapDownDetails details) {
    game.paused = false;
    game.player.died();
    game.enemyController.killAll();
    game.lvl.removeAll();
    game.remove([game.pauseButton, game.homeButton, game.gameOverView, game.lvl]);
    game.homeView.loadView();
  }
}