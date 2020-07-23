import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import 'package:kore_game/screens/game/dankGame.dart';

class HomeView extends SpriteComponent {
  final DankGame game;

  HomeView(this.game) : super.fromSprite(game.tileSize * 7, game.tileSize * 4, Sprite('branding/logo.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) / 2;
    this.y = (size.width - this.width) * 4/5;

    super.resize(size);
  }
}