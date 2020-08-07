import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

import '../../../dankGame.dart';

import '../../../../../config/index.dart' show config;

class BgmButton extends SpriteComponent with Tapable, Destructable {
  final DankGame game;

  BgmButton(this.game) : super.fromSprite(game.tileSize, game.tileSize, (game.bgmmuted) ? Sprite('ui/mutebgm.png') : Sprite('ui/bgm.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width)  * 15/20;
    this.y = (size.height - this.height) * 1/20;

    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails details) {
    if (game.bgmmuted) {
      game.bgmmuted = false;
      config.sharedPrefs.setBool('bgmmuted', false);
      sprite = Sprite('ui/bgm.png');
      Flame.bgm.play('bgm/background_music.mp3', volume: 0.2);
    } else {
      game.bgmmuted = true;
      config.sharedPrefs.setBool('bgmmuted', true);
      sprite = Sprite('ui/mutebgm.png');
      Flame.bgm.stop();
    }
  }
}