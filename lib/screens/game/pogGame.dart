import 'dart:math';
import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'package:kore_game/bgm.dart';
import 'package:kore_game/screens/game/components/music-button.dart';
import 'package:kore_game/screens/game/components/sound-button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';

import './view.dart';
import './views/home-view.dart';
import './views/lost-view.dart';
import './views/credits-view.dart';
import './views/help-view.dart';

import './components/backyard.dart';
import './components/score-display.dart';
import './components/highscore-display.dart';

import './components/fly.dart';
import './components/agile-fly.dart';
import './components/house-fly.dart';
import './components/drooler-fly.dart';
import './components/hungry-fly.dart';
import './components/macho-fly.dart';

import './components/start-button.dart';
import './components/help-button.dart';
import './components/credits-button.dart';

import './controllers/spawner.dart';

import '../../config/flame.dart';

class PogGame extends Game {
  Random rnd;
  final SharedPreferences storage;

  FlySpawner spawner;

  Size screenSize;
  double tileSize;
  List<Fly> flies;
  int score;

  Backyard background;
  ScoreDisplay scoreDisplay;
  HighscoreDisplay highscoreDisplay;

  HelpButton helpButton;
  CreditsButton creditsButton;
  StartButton startButton;
  MusicButton musicButton;
  SoundButton soundButton;

  View activeView = View.home;
  HomeView homeView;
  LostView lostView;
  HelpView helpView;
  CreditsView creditsView;

  PogGame(this.storage) {
    initialize();
  }

  void initialize() async {
    score = 0;
    flies = <Fly>[];
    rnd = Random();
    resize(await flame.flameUtil.initialDimensions());

    spawner = FlySpawner(this);

    background = Backyard(this);
    scoreDisplay = ScoreDisplay(this);
    highscoreDisplay = HighscoreDisplay(this);

    startButton = StartButton(this);
    helpButton = HelpButton(this);
    creditsButton = CreditsButton(this);
    musicButton = MusicButton(this);
    soundButton = SoundButton(this);

    homeView = HomeView(this);
    lostView = LostView(this);
    helpView = HelpView(this);
    creditsView = CreditsView(this);

    playHomeBGM();
  }

  void playHomeBGM() {
    BGM.play(0);
  }

  void playPlayingBGM() {
    BGM.play(1);
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 1.35));
    double y = (rnd.nextDouble() * (screenSize.height - (tileSize * 2.85))) + (tileSize * 1.5);
    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
    highscoreDisplay.render(canvas);
    if (activeView == View.playing) scoreDisplay.render(canvas);

    flies.forEach((Fly fly) => fly.render(canvas));

    if (activeView == View.home) homeView.render(canvas);

    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
      helpButton.render(canvas);
      creditsButton.render(canvas);
    }

    musicButton.render(canvas);
    soundButton.render(canvas);

    if (activeView == View.lost) lostView.render(canvas);
    if (activeView == View.help) helpView.render(canvas);
    if (activeView == View.credits) creditsView.render(canvas);
  }

  @override
  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
    spawner.update(t);
    if (activeView == View.playing) scoreDisplay.update(t);
  }
  
  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;

    // start button
    if (!isHandled && startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandled = true;
      }
    }
    // help button
    if (!isHandled && helpButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        helpButton.onTapDown();
        isHandled = true;
      }
    }

    // credits button
    if (!isHandled && creditsButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        creditsButton.onTapDown();
        isHandled = true;
      }
    }

    if (!isHandled) {
      if (activeView == View.help || activeView == View.credits) {
        activeView = View.home;
        isHandled = true;
      }
    }

    // music button
    if (!isHandled && musicButton.rect.contains(d.globalPosition)) {
      musicButton.onTapDown();
      isHandled = true;
    }

    // sound button
    if (!isHandled && soundButton.rect.contains(d.globalPosition)) {
      soundButton.onTapDown();
      isHandled = true;
    }

    if (soundButton.isEnabled) {
      Flame.audio.play('sfx/haha' + (rnd.nextInt(5) + 1).toString() + '.ogg');
    }

    // hit fly
    if (!isHandled) {
      bool didHitAFly = false;
      flies.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
          isHandled = true;
          didHitAFly = true;
        }
      });
      if (activeView == View.playing && !didHitAFly) {
        Flame.audio.play('sfx/haha' + (rnd.nextInt(5) + 1).toString() + '.ogg');
        playHomeBGM();
        activeView = View.lost;
      }
    }
  }
}