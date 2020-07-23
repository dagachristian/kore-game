import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import 'package:kore_game/screens/game/dankGame.dart';

class GameOverView extends SpriteComponent {
  final DankGame game;

  GameOverView(this.game) : super.fromSprite(game.tileSize * 7, game.tileSize * 4, Sprite('ui/game_over.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width)/2;
    this.y = (size.width - this.width)/2;

    super.resize(size);
  }
}