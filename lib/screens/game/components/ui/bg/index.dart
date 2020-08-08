import './level.dart';
import './levelOne/levelOne.dart';
import './levelTwo/levelTwo.dart';
import './background.dart';

import '../../../dankGame.dart';

import '../../../../../config/index.dart' show config;

class Levels {
  int currentLvlIndex;
  List<Level> levels;

  BackGround bg;

  LevelOne levelOne;
  LevelTwo levelTwo;

  Levels(DankGame game) {
    bg = BackGround(game);

    levelOne = LevelOne(game);
    levelTwo = LevelTwo(game);

    levels = [
      levelOne,
      levelTwo
    ];

    if (!config.sharedPrefs.containsKey('currentLvlIndex')) config.sharedPrefs.setInt('currentLvlIndex', 0);
    // currentLvlIndex = config.sharedPrefs.getInt('currentLvlIndex') ?? 0;
    currentLvlIndex = 0;
  }

  void nextLvl() {
    if (currentLvlIndex + 1 < levels.length) {
      currentLvlIndex++;
      config.sharedPrefs.setInt('currentLvlIndex', currentLvlIndex);
    }
  }

  void setCurrentLvl(int lvl) {
    if (lvl <= levels.length && lvl > 0) {
      currentLvlIndex = lvl - 1;
      config.sharedPrefs.setInt('currentLvlIndex', currentLvlIndex);
    }
  }

  Level get currentLvl => levels[currentLvlIndex];
}