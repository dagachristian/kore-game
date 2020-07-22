import 'dart:math';
import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/joystick/joystick_component.dart';
import 'package:flame/components/joystick/joystick_events.dart';
import 'package:flame/sprite.dart';

class Player extends SpriteComponent implements JoystickListener {
  final double speed = 100.0;

  double intensity = 0;
  double direction = 0;

  Player() : super.fromSprite(88.0, 116.0, Sprite('sprites/player.png'));

  @override
  void update(double t) {
    x += intensity * speed * sin(direction);
    y += intensity * speed * cos(direction);

    super.update(t);
  }

  @override
  void resize(Size size) {
    this.x = (size.width - this.width)/2;
    this.y = (size.width - this.width)/2;
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    print('attack');
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    intensity = event.intensity;
    direction = event.radAngle;
  }
}