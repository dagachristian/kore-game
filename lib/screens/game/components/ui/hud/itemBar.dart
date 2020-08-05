import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

import '../../items/index.dart';
import '../../items/item.dart';

import '../../../dankGame.dart';
import '../../../destructable.dart';

class ItemBar extends SpriteComponent with Tapable, Destructable {
  final DankGame game;
  
  Item currentItem;
  
  ItemBar(this.game) : super.fromSprite(100, 100, Sprite('ui/item_slot.png'));

  void equipItem(Item item) {
    if (currentItem != null) {
      currentItem.y = game.player.y + game.player.height;
      currentItem.x = game.player.x;
      game.lvl.addChild(currentItem);
    }
    game.lvl.removeChild(item);
    currentItem = item;
    item.x = x + 5;
    item.y = y + 5;
    item.width = 90;
    item.height = 90;
  }

  void destroyItem() {
    game.remove([currentItem]);
    currentItem = null;
  }

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) * 9/10;
    this.y = (size.height - this.height) * 3/4;

    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails details) {
    if (currentItem != null) {
      currentItem.use();
    }
  }

  @override
  void onDestroy() {
    if (currentItem != null) {
      game.remove([currentItem]);
    }
    currentItem = null;
    super.onDestroy();
  }
}