import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import '../../dankGame.dart';
import '../../destructable.dart';

enum ItemType {
  CONSUMABLE,
  HELMET,
}

abstract class Item extends SpriteComponent with Destructable, Tapable {
  final DankGame game;
  final String useSound;
  final int spawnChance;
  final ItemType type;

  int uses;
  bool equipped;

  Item(this.game, {@required this.type, @required double width, @required double height, @required Sprite sprite, this.useSound = 'empty.mp3', this.spawnChance = 0, this.uses = 1}) : super.fromSprite(width, height, sprite) {
    equipped = false;
  }

  void use() {
    uses -=1;
    if (!game.sfxmuted) Flame.audio.play(useSound);
    if (uses <= 0) {
      game.itemBar.destroyItem();
    }
  }

  void onEquip() {
    equipped = true;
  }
  void onDequip() {
    equipped = false;
  }

  @override
  void onTapDown(TapDownDetails details) {
    switch(type) {
      case ItemType.CONSUMABLE:
        game.itemBar.equipItem(this);
        break;
      case ItemType.HELMET:
        game.helmetSlot.equipItem(this);
        break;
    }
  }
}