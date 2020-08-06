import 'package:flame/sprite.dart';

import './item.dart';

import '../../dankGame.dart';

class BasicUltimate extends Item {
  BasicUltimate(DankGame game) : super(game, type: ItemType.CONSUMABLE, width: 90, height: 90, sprite: Sprite('items/basic_ultimate.png'), useSound: 'sfx/player/basic_heal.mp3');

  @override
  void use() async {
    if (!game.player.isDead) {
      game.player.damage = game.player.damage * 2;
      game.player.speed = game.player.speed * 1.5;
      game.player.health -= game.player.health * .1;
    }
    super.use();
    await Future.delayed(Duration(seconds: 10)).then((_) {
      game.player.damage = game.player.damage / 2;
      game.player.speed = game.player.speed / 1.5;
      game.player.health += game.player.health * .1;
    });
  }
}