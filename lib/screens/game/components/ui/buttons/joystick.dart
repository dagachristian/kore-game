import 'package:flame/components/joystick/joystick_action.dart';
import 'package:flame/components/joystick/joystick_component.dart';
import 'package:flame/components/joystick/joystick_directional.dart';
import 'package:flutter/painting.dart';
import 'package:kore_game/screens/game/destructable.dart';

import '../../../dankGame.dart';

class JoyStick extends JoystickComponent with Destructable {
  DankGame game;

  JoyStick(this.game) : super(componentPriority: 0,
    directional: JoystickDirectional(
      margin: EdgeInsets.fromLTRB(game.size.width * 4/5, game.size.height * 4/5, game.size.width * 1/10, game.size.height * 1/10)
    ),
    actions: [
      JoystickAction(
        actionId: 1,
        margin: EdgeInsets.fromLTRB(game.size.width * 1/10, game.size.height * 4/5, game.size.width * 4/5, game.size.height * 1/10)
      )
  ]);
}