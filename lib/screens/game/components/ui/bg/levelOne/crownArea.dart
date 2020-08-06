import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/components/items/crown.dart';

import './levelOne.dart';

import '../../../sprites/enemies/basicEnemy.dart';

import '../../../../destructable.dart';

class CrownArea extends PositionComponent with Destructable {
  final LevelOne level;

  CrownWall1 crownWall1;
  CrownWall2 crownWall2;
  CrownWatchTower1 crownWatchTower1;

  CrownArea(this.level) {
    crownWall1 = CrownWall1(level);
    crownWall2 = CrownWall2(level);
    crownWatchTower1 = CrownWatchTower1(level);
  }

  @override
  void onMount() {
    level.game.spawn([crownWall1, crownWall2, crownWatchTower1]);
    level.children.addAll([crownWall1, crownWall2, crownWatchTower1]);
    for(int i=0;i<12;i++) {
      level.game.enemyController.spawnEnemy(BasicEnemy(level.game), level.game.r.nextInt((.1818 * level.width).toInt()).toDouble(), level.game.r.nextInt((.2273 * level.height).toInt()).toDouble() + (.7727 * level.height));
    }
    level.game.itemController.spawnItem(Crown(level.game), level.width * .0509, level.height * .9545);
    super.onMount();
  }

  @override
  void onDestroy() {
    level.game.remove([crownWall1, crownWall2, crownWatchTower1]);
    super.onDestroy();
  }

  @override
  void render(Canvas c) {}
}

class CrownWall1 extends SpriteComponent with Destructable {
  final LevelOne level;

  CrownWall1(this.level) : super.fromSprite(1000, 50, Sprite('bg/wall.png')) {
    level.game.barrier.addBarrier(this);
  }

  @override
  void resize(Size size) {
    this.x = level.width * 0;
    this.y = level.height * .7727;

    super.resize(size);
  }
}

class CrownWall2 extends SpriteComponent with Destructable {
  final LevelOne level;

  CrownWall2(this.level) : super.fromSprite(50, 1300, Sprite('bg/wall.png')) {
    level.game.barrier.addBarrier(this);
  }

  @override
  void resize(Size size) {
    this.x = level.width * .182;
    this.y = level.height * .845;

    super.resize(size);
  }
}


class CrownWatchTower1 extends SpriteComponent with Destructable {
  final LevelOne level;

  CrownWatchTower1(this.level) : super.fromSprite(150, 150, Sprite('bg/watchtower.png')) {
    level.game.barrier.addBarrier(this);
  }

  @override
  void resize(Size size) {
    this.x = level.width * .18;
    this.y = level.height * .765;

    super.resize(size);
  }
}
