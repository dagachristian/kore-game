import 'package:flame/sprite.dart';

import '../level.dart';

import '../../../items/index.dart';
import '../../../sprites/enemies/index.dart';

import '../../../../dankGame.dart';

class LevelTwo extends Level {
  LevelTwo(DankGame game) : super(game, width: game.size.height * 16/9, height: game.size.height, sprite: Sprite('bg/level_02.jpg'));

  @override
  void start() {
    game.controllers.enemyController.spawnEnemy(SlavBoss(game), width * 3/4, height / 2);

    super.start();
  }

  @override
  Enemy getBoss() {}

  @override
  Item getItem() {}

  @override
  Enemy getEnemy() {}
}