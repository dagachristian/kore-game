import 'package:flame/sprite.dart';

import './item.dart';

import '../../dankGame.dart';

class BasicStrength extends Item {
  BasicStrength(DankGame game) : super(game, width: 90, height: 90, sprite: Sprite('items/basic_strength.png'), useSound: 'sfx/player/basic_heal.mp3');

  @override
  void use() async {
    if (!game.player.isDead) game.player.damage = game.player.damage * 5/3;
    super.use();
    await Future.delayed(Duration(seconds: 20)).then((_) => game.player.damage = game.player.damage * 3/5);
  }
}