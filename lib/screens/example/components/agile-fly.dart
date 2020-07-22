import 'dart:ui';

import 'package:flame/sprite.dart';

import './fly.dart';

import '../pogGame.dart';

class AgileFly extends Fly {
  @override
  double get speed => game.tileSize * 5;
  
  AgileFly(PogGame game, double x, double y) : super(game) {
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');

    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
  }
}