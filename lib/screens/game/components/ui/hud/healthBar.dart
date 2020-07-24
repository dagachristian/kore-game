import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/dankGame.dart';
import 'package:kore_game/screens/game/destructable.dart';

class HealthBar extends SpriteComponent with Destructable {
  DankGame game;

  HealthBar(this.game) : super.fromSprite(game.size.width, 30, Sprite('ui/healthbar.png'));
}