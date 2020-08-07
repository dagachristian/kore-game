import 'package:flame/sprite.dart';

import './courtyard.dart';
import './specialArea.dart';
import './crownArea.dart';

import '../level.dart';

import '../../../items/index.dart';
import '../../../sprites/enemies/index.dart';

import '../../../../dankGame.dart';

class LevelOne extends Level {
  Courtyard courtyard;
  SpecialArea specialArea;
  CrownArea crownArea;

  LevelOne(DankGame game) : super(game, width: 5500.0, height: 5500.0, sprite: Sprite('bg/level_01.jpg')) {
    courtyard = Courtyard(this);
    specialArea = SpecialArea(this);
    crownArea = CrownArea(this);
  }

  @override
  void start() {
    game.controllers.enemyController.populateMapWithEnemies(game.lvl, 50);
    game.controllers.itemController.populateMapWithItems(game.lvl, 10);

    game.spawn([courtyard, specialArea, crownArea]);

    super.start();
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
    game.remove([courtyard, specialArea, crownArea]);
    super.onDestroy();
  }
}