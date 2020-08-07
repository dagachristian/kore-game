export './backButton.dart';
export './bgmButton.dart';
export './homeButton.dart';
export './pauseButton.dart';
export './restartButton.dart';
export './sfxButton.dart';
export './startButton.dart';

import './backButton.dart';
import './bgmButton.dart';
import './homeButton.dart';
import './pauseButton.dart';
import './restartButton.dart';
import './sfxButton.dart';
import './startButton.dart';

import '../../../dankGame.dart';

class Buttons {
  StartButton startButton;
  RestartButton restartButton;
  BackButton backButton;
  PauseButton pauseButton;
  HomeButton homeButton;
  BgmButton bgmButton;
  SfxButton sfxButton;

  Buttons(DankGame game) {
    startButton = StartButton(game);
    restartButton = RestartButton(game);
    backButton = BackButton(game);
    pauseButton = PauseButton(game);
    homeButton = HomeButton(game);
    bgmButton = BgmButton(game);
    sfxButton = SfxButton(game);
  }
}