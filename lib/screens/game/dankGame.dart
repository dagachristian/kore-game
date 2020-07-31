import 'dart:math';
import 'dart:ui';

import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/flame.dart';
import 'package:flame/game/base_game.dart';
import 'package:flame/gestures.dart';

import './barrier.dart';
import './destructable.dart';
import './views/index.dart';
import './components/sprites/players/index.dart';
import './components/ui/index.dart';
import './controllers/index.dart';

class DankGame extends BaseGame with MultiTouchDragDetector, HasTapableComponents {
  Random r;
  bool paused;
  Barrier barrier;

  BackGround bg;
  Level lvl;

  Size screenSize;
  double tileSize;
  
  Player player;
  int score;

  EnemyController enemyController;

  HomeView homeView;
  GameOverView gameOverView;

  ScoreDisplay scoreDisplay;
  HealthBar healthBar;
  JoyStick joyStick;
  ItemBar itemBar;

  StartButton startButton;
  RestartButton restartButton;
  BackButton backButton;
  PauseButton pauseButton;
  HomeButton homeButton;

  DankGame() {
    initialize();
  }

  void initialize() async {
    r = Random();
    paused = false;
    barrier = Barrier();
    super.resize(await Flame.util.initialDimensions());

    score = 0;

    player = Player(this);
    
    homeView = HomeView(this);
    gameOverView = GameOverView(this);

    joyStick = JoyStick(this);
    itemBar = ItemBar(this);
    startButton = StartButton(this);
    restartButton = RestartButton(this);
    backButton = BackButton(this);
    pauseButton = PauseButton(this);
    homeButton = HomeButton(this);
    
    enemyController = EnemyController(this);
    bg = BackGround(this);
    lvl = LevelOne(this);
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
    if (!paused) {
      enemyController.update(t);

      super.update(t);
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;

    super.resize(size);
  }
}