import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/components/items/item.dart';
import 'package:kore_game/screens/game/dankGame.dart';

class BasicHeal extends Item {
  BasicHeal(DankGame game) : super(game, width: 90, height: 90, sprite: Sprite('items/basic_heal.png'));

  @override
  void use() {
    if (!game.player.isDead) game.player.health += 20;
  }
}