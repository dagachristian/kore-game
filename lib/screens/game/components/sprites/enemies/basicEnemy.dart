import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/dankGame.dart';

import '../enemy.dart';

class BasicEnemy extends SpriteComponent implements Enemy {
  @override
  bool isDead = false;

  @override
  double speed = 10;
  
  @override
  DankGame game;

  BasicEnemy(this.game) : super.fromSprite(72.0, 64.0, Sprite('sprites/enemies/basic_enemy.png'));

  @override
  void update(double t) {
    x += (game.player.x - x) / (1000/speed);
    y += (game.player.y - y) / (1000/speed);

    super.update(t);
  }
}