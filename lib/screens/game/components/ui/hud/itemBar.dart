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
  double currentItemWidth;
  double currentItemHeight;
  
  ItemBar(this.game) : super.fromSprite(game.tileSize * 1.8, game.tileSize * 1.8, Sprite('ui/item_slot.png'));

  void equipItem(Item item) {
    dequipItem();
    game.lvl.removeChild(item);
    currentItem = item;
    currentItemWidth = item.width;
    currentItemHeight = item.height;
    item.x = x + 5;
    item.y = y + 5;
    item.width = width - 10;
    item.height = height - 10;
  }

  void dequipItem() {
    if (currentItem != null) {
      currentItem.y = game.player.y + game.player.height;
      currentItem.x = game.player.x;
      currentItem.width = currentItemWidth;
      currentItem.height = currentItemHeight;
      game.lvl.addChild(currentItem);
    }
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