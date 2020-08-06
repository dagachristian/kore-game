import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/destructable.dart';

import 'levelOne.dart';

class SpecialWall1 extends SpriteComponent with Destructable {
  final LevelOne level;

  SpecialWall1(this.level) : super.fromSprite(50, 300, Sprite('bg/wall.png')) {
    level.game.barrier.addBarrier(this);
  }

  @override
  void resize(Size size) {
    this.x = level.width * .709;
    this.y = level.height * 0;

    super.resize(size);
  }
}

class SpecialWall2 extends SpriteComponent with Destructable {
  final LevelOne level;

  SpecialWall2(this.level) : super.fromSprite(50, 300, Sprite('bg/wall.png')) {
    level.game.barrier.addBarrier(this);
  }

  @override
  void resize(Size size) {
    this.x = level.width * .709;
    this.y = level.height * .109;

    super.resize(size);
  }
}

class SpecialWall3 extends SpriteComponent with Destructable {
  final LevelOne level;

  SpecialWall3(this.level) : super.fromSprite(1800, 50, Sprite('bg/wall.png')) {
    level.game.barrier.addBarrier(this);
  }

  @override
  void resize(Size size) {
    this.x = level.width * .709;
    this.y = level.height * .1636;

    super.resize(size);
  }
}

class SpecialWatchTower1 extends SpriteComponent with Destructable {
  final LevelOne level;

  SpecialWatchTower1(this.level) : super.fromSprite(150, 150, Sprite('bg/watchtower.png')) {
    level.game.barrier.addBarrier(this);
  }

  @override
  void resize(Size size) {
    this.x = level.width * .6996;
    this.y = level.height * .152;

    super.resize(size);
  }
}
