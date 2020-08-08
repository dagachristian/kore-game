import './logo.dart';
import './currentLevelDisplay.dart';

import '../../../dankGame.dart';

class Decorations {
  Logo logo;
  CurrentLvlDisplay currentLvlDisplay;

  Decorations(DankGame game) {
    logo = Logo(game);
    currentLvlDisplay = CurrentLvlDisplay(game);
  }
}