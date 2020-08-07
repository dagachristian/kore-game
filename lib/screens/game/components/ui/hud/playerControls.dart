import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/joystick/joystick_component.dart';
import 'package:flame/components/joystick/joystick_directional.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';

import '../../../dankGame.dart';

class JoyStick extends JoystickComponent with Destructable {
  final DankGame game;
  AttackButton attackButton;

  JoyStick(this.game) : super(componentPriority: 0,
    directional: JoystickDirectional(
      isFixed: false,
      size: 120
    )
  ) {
    attackButton = AttackButton(game);
  }

  @override
  void onMount() {
    game.spawn([attackButton]);
    super.onMount();
  }

  @override
  void onDestroy() {
    game.remove([attackButton]);
    super.onDestroy();
  }
}

class AttackButton extends SpriteComponent with Tapable, Destructable {
  final DankGame game;

  AttackButton(this.game) : super.fromSprite(game.tileSize * 2.3, game.tileSize * 2.3, Sprite('ui/attack.png'));

  @override
  void resize(Size size) {
    this.x = (size.width - this.width) * 9/10;
    this.y = (size.height - this.height) * 19/20;

    super.resize(size);
  }

  @override
  void onTapDown(TapDownDetails details) {
    sprite = Sprite('ui/attack_pressed.png');
    if (!game.player.isDead && !game.paused) {
      game.player.attack();
    }
  }

  @override
  void onTapUp(TapUpDetails details) {
    sprite = Sprite('ui/attack.png');
  }
}