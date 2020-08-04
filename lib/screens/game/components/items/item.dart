import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import '../../dankGame.dart';
import '../../destructable.dart';

abstract class Item extends SpriteComponent with Destructable, Tapable {
  final DankGame game;
  final int spawnChance;

  int uses;

  Item(this.game, {@required double width, @required double height, @required Sprite sprite, this.spawnChance = 0, this.uses = 1}) : super.fromSprite(width, height, sprite);

  void use() {
    uses -=1;
    if (uses <= 0) {
      game.itemBar.dequipItem(this);
    }
  }

  @override
  void onTapDown(TapDownDetails details) {
    game.itemBar.equipItem(this);
  }
}