import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import '../../../dankGame.dart';

class BackGround extends SpriteComponent with Destructable {
  final DankGame game;

  BackGround(this.game) : super.fromSprite(game.size.width, game.size.height, Sprite('bg/background.jpg'));
}