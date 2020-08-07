export './equipment.dart';
export './healthBar.dart';
export './playerControls.dart';
export './score.dart';

import './equipment.dart';
import './healthBar.dart';
import './playerControls.dart';
import './score.dart';

import '../../../dankGame.dart';

class Huds {
  ScoreDisplay scoreDisplay;
  HealthBar healthBar;
  JoyStick joyStick;
  ItemBar itemBar;
  HelmetSlot helmetSlot;

  Huds(DankGame game) {
    joyStick = JoyStick(game);
    itemBar = ItemBar(game);
    helmetSlot = HelmetSlot(game);
    scoreDisplay = ScoreDisplay(game);
    healthBar = HealthBar(game);
  }
}