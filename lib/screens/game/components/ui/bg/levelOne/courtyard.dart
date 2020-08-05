import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import './levelOne.dart';

import '../../../../destructable.dart';

class Wall1 extends SpriteComponent with Destructable {
  final LevelOne level;

  Wall1(this.level) : super.fromSprite(750, 50, Sprite('bg/wall.png')) {
    level.game.barrier.addBarrier(this);
  }

  @override
  void resize(Size size) {
    this.x = level.width * .881;
    this.y = level.height * .59;

    super.resize(size);
  }
}

class Wall2 extends SpriteComponent with Destructable {
  final LevelOne level;

  Wall2(this.level) : super.fromSprite(750, 50, Sprite('bg/wall.png')) {
    level.game.barrier.addBarrier(this);
  }

  @override
  void resize(Size size) {
    this.x = level.width * .881;
    this.y = level.height * .792;

    super.resize(size);
  }
}

class WatchTower1 extends SpriteComponent with Destructable {
  final LevelOne level;

  WatchTower1(this.level) : super.fromSprite(150, 150, Sprite('bg/watchtower.png')) {
    level.game.barrier.addBarrier(this);
  }

  @override
  void resize(Size size) {
    this.x = level.width * .8596;
    this.y = level.height * .58;

    super.resize(size);
  }
}

class WatchTower2 extends SpriteComponent with Destructable {
  final LevelOne level;

  WatchTower2(this.level) : super.fromSprite(150, 150, Sprite('bg/watchtower.png')) {
    level.game.barrier.addBarrier(this);
  }

  @override
  void resize(Size size) {
    this.x = level.width * .8633;
    this.y = level.height * .78;

    super.resize(size);
  }
}