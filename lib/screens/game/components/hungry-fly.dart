import 'dart:ui';

import 'package:flame/sprite.dart';

import './fly.dart';

import '../pogGame.dart';

class HungryFly extends Fly {
  HungryFly(PogGame game, double x, double y) : super(game) {
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/hungry-fly-1.png'));
    flyingSprite.add(Sprite('flies/hungry-fly-2.png'));
    deadSprite = Sprite('flies/hungry-fly-dead.png');

    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1.65, game.tileSize * 1.65);
  }
}