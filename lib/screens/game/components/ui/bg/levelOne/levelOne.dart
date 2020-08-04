import 'package:flame/sprite.dart';

import './courtyard.dart';

import '../../index.dart';

import '../../../../dankGame.dart';

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
    game.itemController.populateMapWithItems(game.lvl, [], 10);

    game.spawn([wall1, wall2, watchTower1, watchTower2]);
    children.addAll([wall1, wall2, watchTower1, watchTower2]);
  }

  @override
  void onDestroy() {
    game.remove([wall1, wall2, watchTower1, watchTower2]);
    super.onDestroy();
  }
}