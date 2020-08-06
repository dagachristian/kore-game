import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

import '../../../dankGame.dart';
import '../../../destructable.dart';

import '../../../../../config/index.dart' show config;

class SfxButton extends SpriteComponent with Tapable, Destructable {
  final DankGame game;

  SfxButton(this.game) : super.fromSprite(game.tileSize, game.tileSize, (game.sfxmuted) ? Sprite('ui/mutesfx.png') : Sprite('ui/sfx.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) * 19/20;
    this.y = (size.height - this.height) * 1/20;

    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails details) {
    if (game.sfxmuted) {
      game.sfxmuted = false;
      config.sharedPrefs.setBool('sfxmuted', false);
      sprite = Sprite('ui/sfx.png');
    } else {
      game.sfxmuted = true;
      config.sharedPrefs.setBool('sfxmuted', true);
      sprite = Sprite('ui/mutesfx.png');
    }
  }
}