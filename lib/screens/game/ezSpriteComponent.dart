import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import 'components/ui/bg/level.dart';
import 'dankGame.dart';

class EZSpriteComponent extends SpriteComponent with Destructable {
  final DankGame game;

  EZSpriteComponent(this.game, {
    double x = 0,
    double y = 0,
    double width = 0,
    double height = 0,
    @required Sprite sprite,
    bool barrier = false,
    Level parentLvl,
  }) : super.fromSprite(width, height, sprite) {
    this.x = x;
    this.y = y;
    if (barrier) game.barrier.addBarrier(this);
    parentLvl?.addChild(this);
  }

  @override
  void onDestroy() {
    game.barrier.removeBarrier(this);
  }
}

class EZTapableSpriteComponent extends SpriteComponent with Destructable, Tapable {
  final DankGame game;
  final Function onTapDwn;

  EZTapableSpriteComponent(this.game, {
    double x = 0,
    double y = 0,
    double width = 0,
    double height = 0,
    @required Sprite sprite,
    @required this.onTapDwn,
    bool barrier = false,
    Level parentLvl,
  }) : super.fromSprite(width, height, sprite) {
    this.x = x;
    this.y = y;
    if (barrier) game.barrier.addBarrier(this);
    parentLvl?.addChild(this);
  }

  @override
  void onDestroy() {
    game.barrier.removeBarrier(this);
  }

  @override
  void onTapDown(TapDownDetails details) {
    onTapDwn.call();
  }
}