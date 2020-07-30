import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:kore_game/screens/game/components/items/index.dart';
import 'package:kore_game/screens/game/components/items/item.dart';
import 'package:kore_game/screens/game/dankGame.dart';
import 'package:kore_game/screens/game/destructable.dart';

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
  }

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) * 9/10;
    this.y = (size.height - this.height) * 3/4;

    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails details) {
    currentItem.use();
  }

  @override
  void onDestroy() {
    game.remove([currentItem]);
    super.onDestroy();
  }
}