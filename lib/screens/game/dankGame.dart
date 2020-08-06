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

import '../../config/index.dart' show config;

class DankGame extends BaseGame with MultiTouchDragDetector, HasTapableComponents {
  Random r;
  bool paused;
  bool sfxmuted;
  bool bgmmuted;
  Barrier barrier;

  BackGround bg;
  Level lvl;

  Size screenSize;
  double tileSize;
  
  Player player;
  int score;

  EnemyController enemyController;
  ItemController itemController;

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
  BgmButton bgmButton;
  SfxButton sfxButton;

  DankGame() {
    initialize();
  }

  void initialize() async {
    r = Random();
    paused = false;
    if (!config.sharedPrefs.containsKey('sfxmuted')) await config.sharedPrefs.setBool('sfxmuted', false);
    sfxmuted = config.sharedPrefs.getBool('sfxmuted');
    if (!config.sharedPrefs.containsKey('bgmmuted')) await config.sharedPrefs.setBool('bgmmuted', false);
    bgmmuted = config.sharedPrefs.getBool('bgmmuted');
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
    bgmButton = BgmButton(this);
    sfxButton = SfxButton(this);
    
    enemyController = EnemyController(this);
    itemController = ItemController(this);

    bg = BackGround(this);
    lvl = LevelOne(this);
    scoreDisplay = ScoreDisplay(this);
    healthBar = HealthBar(this);

    joyStick.addObserver(player);
    if (!bgmmuted) Flame.bgm.play('bgm/background_music.mp3', volume: 0.2);
    initSprites();
  }

  void initSprites() {
    homeView.loadView();
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