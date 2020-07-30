import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import '../../dankGame.dart';
import '../../destructable.dart';

abstract class Item extends SpriteComponent with Destructable, Tapable {
  final DankGame game;

  Item(this.game, {@required double width, @required double height, @required Sprite sprite}) : super.fromSprite(width, height, sprite);

  void use();

  @override
  void onTapDown(TapDownDetails details) {
    game.itemBar.equipItem(this);
  }
}