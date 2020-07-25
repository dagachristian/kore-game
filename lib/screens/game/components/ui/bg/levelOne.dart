import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/dankGame.dart';
import 'package:kore_game/screens/game/destructable.dart';

class LevelOne extends SpriteComponent with Destructable {
  DankGame game;

  LevelOne(this.game) : super.fromSprite(5000.0, 5000.0, Sprite('bg/level_01.jpg'));
}