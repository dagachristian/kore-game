import 'package:flame/flame.dart';
import 'package:flame/util.dart';

import '../bgm.dart';

class _Flame {
  Util flameUtil;

  Future<void> init() async {
    flameUtil = Util();
    await flameUtil.fullScreen();
    await flameUtil.setPortrait();

    await Flame.images.loadAll(<String>[
      'bg/background.jpg',
      'branding/logo.png',
      'branding/spritesheet.png',
      'ui/game_over.png',
      'ui/restart.png',
      'ui/start.png',
      'ui/game_over.png',
      'ui/healthbar.png',
      'sprites/player/player.png',
      'sprites/player/player_attack_01.png',
      'sprites/player/player_attack_02.png',
      'sprites/enemies/basic_enemy.png',
      'sprites/enemies/basic_enemy_attack_01.png',
      'sprites/enemies/basic_enemy_attack_02.png',
    ]);

    Flame.audio.disableLog();
    await Flame.audio.loadAll(<String>[
      'sfx/haha1.ogg',
      'sfx/haha2.ogg',
      'sfx/haha3.ogg',
      'sfx/haha4.ogg',
      'sfx/haha5.ogg',
      'sfx/ouch1.ogg',
      'sfx/ouch2.ogg',
      'sfx/ouch3.ogg',
      'sfx/ouch4.ogg',
      'sfx/ouch5.ogg',
      'sfx/ouch6.ogg',
      'sfx/ouch7.ogg',
      'sfx/ouch8.ogg',
      'sfx/ouch9.ogg',
      'sfx/ouch10.ogg',
      'sfx/ouch11.ogg',
    ]);

    await BGM.add('bgm/home.mp3');
    await BGM.add('bgm/playing.mp3');
  }
}
final _Flame flame = _Flame();