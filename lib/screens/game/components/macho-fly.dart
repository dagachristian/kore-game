import 'dart:ui';

import 'package:flame/sprite.dart';

import './fly.dart';

import '../pogGame.dart';

class MachoFly extends Fly {
  @override
  double get speed => game.tileSize * 2.5;
  
  MachoFly(PogGame game, double x, double y) : super(game) {
    flyingSprite = <Sprite>[];
    flyingSprite.add(Sprite('flies/macho-fly-1.png'));
    flyingSprite.add(Sprite('flies/macho-fly-2.png'));
    deadSprite = Sprite('flies/macho-fly-dead.png');

    flyRect = Rect.fromLTWH(x, y, game.tileSize * 2.025, game.tileSize * 2.025);
  }
}