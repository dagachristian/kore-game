import './backButton.dart';
import './bgmButton.dart';
import './homeButton.dart';
import './pauseButton.dart';
import './restartButton.dart';
import './sfxButton.dart';
import './startButton.dart';
import './nextButton.dart';
import './levelsButton.dart';

import '../../../dankGame.dart';

class Buttons {
  StartButton startButton;
  RestartButton restartButton;
  BackButton backButton;
  PauseButton pauseButton;
  HomeButton homeButton;
  BgmButton bgmButton;
  SfxButton sfxButton;
  NextButton nextButton;
  LevelsButton levelsButton;
  LevelSelectButtons levelSelectButtons;

  Buttons(DankGame game) {
    startButton = StartButton(game);
    restartButton = RestartButton(game);
    backButton = BackButton(game);
    pauseButton = PauseButton(game);
    homeButton = HomeButton(game);
    bgmButton = BgmButton(game);
    sfxButton = SfxButton(game);
    nextButton = NextButton(game);
    levelsButton = LevelsButton(game);
    levelSelectButtons = LevelSelectButtons(game);
  }
}