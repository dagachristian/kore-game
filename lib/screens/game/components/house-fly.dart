import 'dart:ui';

import 'package:flame/sprite.dart';

import './fly.dart';

import '../pogGame.dart';

class HouseFly extends Fly {
  HouseFly(PogGame game, double x, double y) : super(game) {
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/house-fly-1.png'));
    flyingSprite.add(Sprite('flies/house-fly-2.png'));
    deadSprite = Sprite('flies/house-fly-dead.png');

    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
  }
}