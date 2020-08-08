import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import './levelOne.dart';

import '../../../../destructable.dart';

class Courtyard extends PositionComponent with Destructable {
  final LevelOne level;

  Wall1 wall1;
  Wall2 wall2;
  WatchTower1 watchTower1;
  WatchTower2 watchTower2;

  Courtyard(this.level) {
    wall1 = Wall1(level);
    wall2 = Wall2(level);
    watchTower1 = WatchTower1(level);
    watchTower2 = WatchTower2(level);
  }

  @override
  void onMount() {
    level.game.spawn([wall1, wall2, watchTower1, watchTower2]);
    level.game.barrier.addBarriers([wall1, wall2, watchTower1, watchTower2]);
    level.children.addAll([wall1, wall2, watchTower1, watchTower2]);
    super.onMount();
  }

  @override
  void onDestroy() {
    level.game.remove([wall1, wall2, watchTower1, watchTower2]);
    super.onDestroy();
  }

  @override
  void render(Canvas c) {}
}

class Wall1 extends SpriteComponent with Destructable {
  final LevelOne level;

  Wall1(this.level) : super.fromSprite(750, 50, Sprite('bg/wall.png'));

  @override
  void resize(Size size) {
    this.x = level.width * .881;
    this.y = level.height * .59;

    super.resize(size);
  }
}

class Wall2 extends SpriteComponent with Destructable {
  final LevelOne level;

  Wall2(this.level) : super.fromSprite(750, 50, Sprite('bg/wall.png'));

  @override
  void resize(Size size) {
    this.x = level.width * .881;
    this.y = level.height * .792;

    super.resize(size);
  }
}

class WatchTower1 extends SpriteComponent with Destructable {
  final LevelOne level;

  WatchTower1(this.level) : super.fromSprite(150, 150, Sprite('bg/watchtower.png'));

  @override
  void resize(Size size) {
    this.x = level.width * .8596;
    this.y = level.height * .58;

    super.resize(size);
  }
}

class WatchTower2 extends SpriteComponent with Destructable {
  final LevelOne level;

  WatchTower2(this.level) : super.fromSprite(150, 150, Sprite('bg/watchtower.png'));

  @override
  void resize(Size size) {
    this.x = level.width * .8633;
    this.y = level.height * .78;

    super.resize(size);
  }
}