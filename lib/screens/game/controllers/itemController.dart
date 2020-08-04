import 'package:kore_game/screens/game/components/items/basicHeal.dart';
import 'package:kore_game/screens/game/components/items/item.dart';
import 'package:kore_game/screens/game/components/ui/bg/level.dart';
import 'package:kore_game/screens/game/dankGame.dart';

class ItemController {
  final DankGame game;
  List<Item> items;

  ItemController(this.game) {
    items = [];
  }

  void destroyAll() {
    game.remove(items);
    items = [];
  }

  void populateMapWithItems(Level lvl, List<Item> itms, int amount) {
    for (int i=0;i<amount;i++) {
      Item item = BasicHeal(game);
      for (Item e in itms) {
        if (game.r.nextInt(100) < e.spawnChance) {
          item = e;
          break;
        }
      }
      item.x = game.r.nextInt(lvl.width.toInt()).toDouble();
      item.y = game.r.nextInt(lvl.height.toInt()).toDouble();
      items.add(item);
      game.lvl.addChild(item);
    }
    game.spawn(items);
  }
}