import 'dart:ui';

import 'package:flame/components/animation_component.dart';
import 'package:flame/spritesheet.dart';

import 'package:kore_game/screens/game/dankGame.dart';

class HomeView extends AnimationComponent {
  final DankGame game;

  static final SpriteSheet logoSheet = SpriteSheet(
      columns: 80,
      rows: 1,
      imageName: 'branding/spritesheet.png',
      textureWidth: 102,
      textureHeight: 70,
    );

  HomeView(this.game) : super(408.0, 280.0, logoSheet.createAnimation(0, stepTime: 0.05));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) / 2;
    this.y = (size.height - this.height) * 1/3;

    super.resize(size);
  }
}