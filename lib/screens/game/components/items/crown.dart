import 'dart:ui';

import 'package:flame/animation.dart';
import 'package:flame/components/animation_component.dart';
import 'package:flame/sprite.dart';

import './item.dart';

import '../../dankGame.dart';

class Crown extends Item {
  CrownAnimation anim;

  Crown(DankGame game) : super(game, type: ItemType.HELMET, width: 100, height: 60, sprite: Sprite('items/crown.png'), useSound: '') {
    anim = CrownAnimation(this, width, height, Animation.spriteList(<Sprite>[
      Sprite('items/crown_01.png'),
      Sprite('items/crown_02.png'),
      Sprite('items/crown_03.png'),
      Sprite('items/crown_04.png'),
      Sprite('items/crown_05.png'),
      Sprite('items/crown_06.png'),
    ], stepTime: 0.1, loop: true));
  }

  @override
  void use() {}

  @override
  void onEquip() {
    game.player.maxHealth *= 1.25;
    game.spawn([anim]);
    super.onEquip();
  }

  @override
  void onDequip() {
    game.player.maxHealth /= 1.25;
    game.remove([anim]);
    super.onDequip();
  }

  @override
  void render(Canvas c) {
    if (!equipped) super.render(c);
  }

  @override
  void onDestroy() {
    game.remove([anim]);
  }

  @override
  void onMount() {
    if (equipped) game.spawn([anim]);
  }
}

class CrownAnimation extends AnimationComponent with Destructable {
  final Crown crown;

  CrownAnimation(this.crown, double width, double height, Animation animation) : super(width, height, animation);

  @override
  void update(double t) {
    x = crown.x;
    y = crown.y;
    width = crown.width;
    height = crown.height;
    super.update(t);
  }
}