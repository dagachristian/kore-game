import '../components/items/index.dart';
import '../components/ui/bg/level.dart';
import '../dankGame.dart';

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

  void populateMapWithItems(Level lvl, int amount) {
    for (int i=0;i<amount;i++) {
      Item item = lvl.getItem();
      item.x = game.r.nextInt(lvl.width.toInt()).toDouble();
      item.y = game.r.nextInt(lvl.height.toInt()).toDouble();
      items.add(item);
      game.lvl.addChild(item);
    }
    game.spawn(items);
  }
}