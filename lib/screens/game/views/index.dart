export './home.dart';
export './gameOver.dart';
export './playing.dart';

import './home.dart';
import './gameOver.dart';
import './playing.dart';

import '../dankGame.dart';

class Views {
  HomeView homeView;
  GameOverView gameOverView;
  PlayingView playingView;
  
  Views(DankGame game) {
    homeView = HomeView(game);
    gameOverView = GameOverView(game);
    playingView = PlayingView(game);
  }
}