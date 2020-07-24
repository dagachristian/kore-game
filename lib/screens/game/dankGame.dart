import 'dart:math';
import 'dart:ui';

import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';

import './destructable.dart';

import './view.dart';
import './views/index.dart';

import './components/sprites/players/index.dart';
import './components/sprites/enemies/index.dart';

import './components/ui/index.dart';

import './controllers/enemyController.dart';

class DankGame extends BaseGame with MultiTouchDragDetector, HasTapableComponents {
  Random r;

  BackGround bg;
  ScoreDisplay scoreDisplay;
  HealthBar healthBar;

  Size screenSize;
  double tileSize;
  
  Player player;
  int score;

  EnemyController enemyController;

  View activeView = View.home;
  HomeView homeView;
  GameOverView gameOverView;

  JoyStick joyStick;
  StartButton startButton;
  RestartButton restartButton;

  DankGame() {
    initialize();
  }

  void initialize() async {
    r = Random();
    super.resize(await Flame.util.initialDimensions());

    score = 0;

    player = Player(this);
    
    homeView = HomeView(this);
    gameOverView = GameOverView(this);

    joyStick = JoyStick(this);
    startButton = StartButton(this);
    restartButton = RestartButton(this);
    
    enemyController = EnemyController(this);
    bg = BackGround(this);
    scoreDisplay = ScoreDisplay(this);
    healthBar = HealthBar(this);

    joyStick.addObserver(player);
    
    initSprites();
  }

  void initSprites() {
    spawn([bg, homeView, startButton]);
  }

  void spawn(List<Destructable> cs) {
    cs.forEach((c) {
      c.spawn();
      add(c);
    });
  }

  void remove(List<Destructable> cs) {
    cs.forEach((c) {
      c.remove();
    });
  }

  @override
  void onReceiveDrag(DragEvent drag) {
    joyStick.onReceiveDrag(drag);
    super.onReceiveDrag(drag);
  }

  @override
  void update(double t) {
    enemyController.update(t);

    super.update(t);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;

    super.resize(size);
  }
}