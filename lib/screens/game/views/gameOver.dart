import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import '../dankGame.dart';

class GameOverView extends SpriteComponent with Destructable {
  final DankGame game;

  GameOverView(this.game) : super.fromSprite(game.tileSize * 7, game.tileSize * 4, Sprite('ui/game_over.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) / 2;
    this.y = (size.width - this.width);

    super.resize(size);
  }

  @override
  void onDestroy() {
    game.remove([game.buttons.restartButton, game.buttons.backButton]);
    super.onDestroy();
  }

  @override
  void onMount() {
    game.spawn([game.buttons.restartButton, game.buttons.backButton]);
    super.onMount();
  }
}