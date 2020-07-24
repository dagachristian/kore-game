import 'dart:ui';

import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';
import 'package:kore_game/screens/game/destructable.dart';

import '../dankGame.dart';

class HomeView extends AnimationComponent with Destructable {
  final DankGame game;
  
  static final SpriteSheet logoSheet = SpriteSheet(
      columns: 80,
      rows: 1,
      imageName: 'branding/spritesheet.png',
      textureWidth: 101,
      textureHeight: 60,
    );

  HomeView(this.game) : super(game.size.width + 10, 450.0, logoSheet.createAnimation(0, stepTime: 0.1));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) / 2;
    this.y = (size.height - this.height) * 1/4;

    super.resize(size);
  }
}