import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import '../dankGame.dart';

class NextLevelView extends SpriteComponent with Destructable {
  final DankGame game;

  NextLevelView(this.game) : super.fromSprite(game.tileSize * 6, game.tileSize * 2, Sprite('ui/passed.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) / 2;
    this.y = (size.width - this.width);

    super.resize(size);
  }

  @override
  void onDestroy() {
    game.remove([game.buttons.nextButton, game.buttons.backButton]);
    super.onDestroy();
  }

  @override
  void onMount() {
    game.spawn([game.buttons.nextButton, game.buttons.backButton]);
    super.onMount();
  }
}