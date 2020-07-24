import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/destructable.dart';

import '../../dankGame.dart';

class BackGround extends Component with Destructable {
  final DankGame game;
  Sprite bgSprite;
  Rect bgRect;

  BackGround(this.game) {
    bgSprite = Sprite('bg/background.jpg');
    bgRect = Rect.fromLTWH(
      0,
      0,
      game.size.width,
      game.size.height,
    );
  }

  @override
  void render(Canvas c) {
    bgSprite.renderRect(c, bgRect);
  }

  @override
  void update(double t) {}
}