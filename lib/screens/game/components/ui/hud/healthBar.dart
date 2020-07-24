import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import '../../../dankGame.dart';
import '../../../destructable.dart';

class HealthBar extends SpriteComponent with Destructable {
  DankGame game;

  HealthBar(this.game) : super.fromSprite(game.size.width, 30, Sprite('ui/healthbar.png'));

  @override
  void update(double t) {
    this.width = game.player.health / game.player.maxHealth * game.size.width;

    super.update(t);
  }
}