import './home.dart';
import './gameOver.dart';
import './playing.dart';
import './nextLevel.dart';
import './levelSelect.dart';

import '../dankGame.dart';

class Views {
  HomeView homeView;
  GameOverView gameOverView;
  PlayingView playingView;
  NextLevelView nextLevelView;
  LevelSelectView levelSelectView;
  
  Views(DankGame game) {
    homeView = HomeView(game);
    gameOverView = GameOverView(game);
    playingView = PlayingView(game);
    nextLevelView = NextLevelView(game);
    levelSelectView = LevelSelectView(game);
  }
}