export './enemyController.dart';
export './itemController.dart';

import './enemyController.dart';
import './itemController.dart';

import '../dankGame.dart';

class Controllers {
  EnemyController enemyController;
  ItemController itemController;

  Controllers(DankGame game) {
    enemyController = EnemyController(game);
    itemController = ItemController(game);
  }
}