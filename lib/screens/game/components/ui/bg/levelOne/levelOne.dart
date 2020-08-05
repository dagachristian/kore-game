import 'package:flame/sprite.dart';

import './courtyard.dart';

import '../level.dart';

import '../../../../dankGame.dart';
import '../../../items/index.dart';
import '../../../sprites/enemies/index.dart';

class LevelOne extends Level {
  Wall1 wall1;
  Wall2 wall2;
  WatchTower1 watchTower1;
  WatchTower2 watchTower2;

  LevelOne(DankGame game) : super(game, width: 5500.0, height: 5500.0, sprite: Sprite('bg/level_01.jpg')) {
    wall1 = Wall1(this);
    wall2 = Wall2(this);
    watchTower1 = WatchTower1(this);
    watchTower2 = WatchTower2(this);
  }

  @override
  void reset() {
    super.reset();

    game.enemyController.populateMapWithEnemies(game.lvl, 40);
    game.itemController.populateMapWithItems(game.lvl, 10);

    game.spawn([wall1, wall2, watchTower1, watchTower2]);
    children.addAll([wall1, wall2, watchTower1, watchTower2]);
  }

  @override
  Enemy getEnemy() {
    if (game.r.nextInt(100) < RareEnemy.spawnChance) {
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
    return BasicHeal(game);
  }

  @override
  void onDestroy() {
    game.remove([wall1, wall2, watchTower1, watchTower2]);
    super.onDestroy();
  }
}