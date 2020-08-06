import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/components/items/basicUltimate.dart';

import './levelOne.dart';

import '../../../sprites/enemies/rareEnemy.dart';

import '../../../../destructable.dart';

class SpecialArea extends PositionComponent with Destructable {
  final LevelOne level;

  SpecialWall1 specialWall1;
  SpecialWall2 specialWall2;
  SpecialWall3 specialWall3;
  SpecialWatchTower1 specialWatchTower1;

  SpecialArea(this.level) {
    specialWall1 = SpecialWall1(level);
    specialWall2 = SpecialWall2(level);
    specialWall3 = SpecialWall3(level);
    specialWatchTower1 = SpecialWatchTower1(level);
  }

  @override
  void onMount() {
    level.game.spawn([specialWall1, specialWall2, specialWall3, specialWatchTower1]);
    level.children.addAll([specialWall1, specialWall2, specialWall3, specialWatchTower1]);
    for(int i=0;i<8;i++) {
      level.game.enemyController.spawnEnemy(RareEnemy(level.game), level.game.r.nextInt((.2818 * level.width).toInt()).toDouble() + (.718 * level.width), level.game.r.nextInt((.1545 * level.height).toInt()).toDouble());
    }
    level.game.itemController.spawnItem(BasicUltimate(level.game), level.width * .9447, level.height * .0669);
    super.onMount();
  }

  @override
  void onDestroy() {
    level.game.remove([specialWall1, specialWall2, specialWall3, specialWatchTower1]);
    super.onDestroy();
  }

  @override
  void render(Canvas c) {}
}

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
