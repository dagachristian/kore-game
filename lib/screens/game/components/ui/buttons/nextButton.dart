import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

import '../../../dankGame.dart';

class NextButton extends SpriteComponent with Tapable, Destructable {
  final DankGame game;

  NextButton(this.game) : super.fromSprite(game.tileSize * 3, game.tileSize * 3, Sprite('ui/next.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) / 2;
    this.y = (size.height - this.height) * 3/4;

    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails details) {
    game.remove([game.lvls.currentLvl]);
    game.lvls.nextLvl();
    game.spawn([game.lvls.currentLvl]);
    game.remove([game.views.nextLevelView]);
    game.lvls.currentLvl.reset();
  }
}
