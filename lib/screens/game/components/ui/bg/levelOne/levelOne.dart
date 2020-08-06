import 'package:flame/sprite.dart';

import './courtyard.dart';
import './specialArea.dart';

import '../level.dart';

import '../../../../dankGame.dart';
import '../../../items/index.dart';
import '../../../sprites/enemies/index.dart';

class LevelOne extends Level {
  Wall1 wall1;
  Wall2 wall2;
  WatchTower1 watchTower1;
  WatchTower2 watchTower2;

  SpecialWall1 specialWall1;
  SpecialWall2 specialWall2;
  SpecialWall3 specialWall3;
  SpecialWatchTower1 specialWatchTower1;

  LevelOne(DankGame game) : super(game, width: 5500.0, height: 5500.0, sprite: Sprite('bg/level_01.jpg')) {
    wall1 = Wall1(this);
    wall2 = Wall2(this);
    watchTower1 = WatchTower1(this);
    watchTower2 = WatchTower2(this);

    specialWall1 = SpecialWall1(this);
    specialWall2 = SpecialWall2(this);
    specialWall3 = SpecialWall3(this);
    specialWatchTower1 = SpecialWatchTower1(this);
  }

  @override
  void reset() {
    super.reset();

    game.enemyController.populateMapWithEnemies(game.lvl, 50);
    game.itemController.populateMapWithItems(game.lvl, 10);

    game.spawn([wall1, wall2, watchTower1, watchTower2, specialWall1, specialWall2, specialWall3, specialWatchTower1]);
    children.addAll([wall1, wall2, watchTower1, watchTower2, specialWall1, specialWall2, specialWall3, specialWatchTower1]);

    for(int i=0;i<8;i++) {
      game.enemyController.spawnEnemy(RareEnemy(game), game.r.nextInt((.2818 * width).toInt()).toDouble() + (.718 * width), game.r.nextInt((.1545 * height).toInt()).toDouble());
    }

    game.itemController.spawnItem(BasicUltimate(game), width * .9447, height * .0669);
  }

  @override
  Enemy getEnemy() {
    if (game.r.nextInt(100) < 10) {
      return RareEnemy(game);
    } else {
      return BasicEnemy(game);
    }
  }

  @override
  Enemy getBoss() {
    Enemy boss = SlavBoss(game);
    boss.x = width * 19/20;
    boss.y = height * 14/20;
    return boss;
  }

  @override
  Item getItem() {
    if (game.r.nextInt(100) < 20) {
      return (BasicStrength(game));
    } else {
      return BasicHeal(game);
    }
  }

  @override
  void onDestroy() {
    game.remove([wall1, wall2, watchTower1, watchTower2, specialWall1, specialWall2, specialWall3, specialWatchTower1]);
    super.onDestroy();
  }
}