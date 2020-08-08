import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';

import '../../items/index.dart';

import '../../../dankGame.dart';

abstract class Equipment extends SpriteComponent with Tapable, Destructable {
  final DankGame game;
  
  Item currentItem;
  double currentItemWidth;
  double currentItemHeight;

  double xOffset;
  double yOffset;
  double wOffset;
  double hOffset;
  
  Equipment(this.game, {
    @required double width,
    @required double height,
    @required Sprite sprite,
    this.xOffset = 0,
    this.yOffset = 0,
    this.wOffset = 0,
    this.hOffset = 0
  }) : super.fromSprite(width, height, sprite);

  void equipItem(Item item) {
    dequipItem();
    game.lvls.currentLvl.removeChild(item);
    currentItem = item;
    currentItemWidth = item.width;
    currentItemHeight = item.height;
    item.x = x + xOffset;
    item.y = y + yOffset;
    item.width = width + wOffset;
    item.height = height + hOffset;
    item.onEquip();
  }

  void dequipItem() {
    if (currentItem != null) {
      currentItem.y = game.player.y + game.player.height;
      currentItem.x = game.player.x;
      currentItem.width = currentItemWidth;
      currentItem.height = currentItemHeight;
      game.lvls.currentLvl.addChild(currentItem);
      currentItem.onDequip();
    }
  }

  void destroyItem() {
    if (currentItem != null) {
      dequipItem();
      game.remove([currentItem]);
      currentItem = null;
    }
  }

  @override
  void onDestroy() {
    if (currentItem != null) {
      game.remove([currentItem]);
    }
    super.onDestroy();
  }

  @override
  void onMount() {
    if (currentItem != null) {
      game.spawn([currentItem]);
    }
    super.onMount();
  }

  @override
  void onTapDown(TapDownDetails details) {
    if (currentItem != null) {
      currentItem.use();
    }
  }
}

class ItemBar extends Equipment {
  ItemBar(DankGame game) : super(
    game,
    width: game.tileSize * 1.8,
    height: game.tileSize * 1.8,
    sprite: Sprite('ui/item_slot.png'),
    xOffset: 5,
    yOffset: 5,
    wOffset: -10,
    hOffset: -10
  );

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) * 9/10;
    this.y = (size.height - this.height) * 3/4;

    super.resize(size);
  }
}

class HelmetSlot extends Equipment {
  HelmetSlot(DankGame game) : super(
    game,
    width: game.player.width * 9/10,
    height: game.player.height * 3/10,
    sprite: Sprite('empty.png'),
    yOffset: -40,
    xOffset: 7
  );

  @override
  void update(double t) {
    x = game.player.x;
    y = game.player.y;
    if (currentItem != null) {
      currentItem.x = x + xOffset;
      currentItem.y = y + yOffset;
    }
    super.update(t);
  }

  @override
  void resize(Size size) {
    this.x = game.player.x;
    this.y = game.player.y;
  }
}