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

export './destructable.dart';
export './ezSpriteComponent.dart';

class DankGame extends BaseGame with MultiTouchDragDetector, HasTapableComponents {
  Random r;
  bool paused;
  bool sfxmuted;
  bool bgmmuted;
  Barrier barrier;

  Levels lvls;

  Size screenSize;
  double tileSize;

  int score;
  int currentLevel;
  
  Player player;
  Controllers controllers;
  Views views;
  Huds huds;
  Buttons buttons;
  Decorations decorations;

  DankGame() {
    initialize();
  }

  void initialize() async {
    r = Random();
    paused = false;
    score = 0;

    if (!config.sharedPrefs.containsKey('sfxmuted')) await config.sharedPrefs.setBool('sfxmuted', false);
    sfxmuted = config.sharedPrefs.getBool('sfxmuted');
    if (!config.sharedPrefs.containsKey('bgmmuted')) await config.sharedPrefs.setBool('bgmmuted', false);
    bgmmuted = config.sharedPrefs.getBool('bgmmuted');
    Flame.audio.disableLog();
    super.resize(await Flame.util.initialDimensions());

    barrier = Barrier();

    player = Player(this);
    views = Views(this);
    huds = Huds(this);
    lvls = Levels(this);
    buttons = Buttons(this);
    controllers = Controllers(this);
    decorations = Decorations(this);

    huds.joyStick.addObserver(player);
    if (!bgmmuted) Flame.bgm.play('bgm/background_music.mp3', volume: 0.2);
    initSprites();
  }

  void initSprites() {
    spawn([views.homeView]);
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
    huds.joyStick.onReceiveDrag(drag);
    super.onReceiveDrag(drag);
  }

  @override
  void update(double t) {
    if (!paused) {
      controllers.enemyController.update(t);

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