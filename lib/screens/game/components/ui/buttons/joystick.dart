import 'package:flame/components/joystick/joystick_action.dart';
import 'package:flame/components/joystick/joystick_component.dart';
import 'package:flame/components/joystick/joystick_directional.dart';
import 'package:kore_game/screens/game/destructable.dart';

import '../../../dankGame.dart';

class JoyStick extends JoystickComponent with Destructable {
  DankGame game;

  JoyStick(this.game) : super(componentPriority: 0,
    directional: JoystickDirectional(),
    actions: [
      JoystickAction(
        actionId: 1
      )
  ]);
}