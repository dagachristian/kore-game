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
      'bg/backyard.png',
      'bg/lose-splash.png',
      'branding/title.png',
      'ui/dialog-credits.png',
      'ui/dialog-help.png',
      'ui/icon-credits.png',
      'ui/icon-help.png',
      'ui/start-button.png',
      'ui/callout.png',
      'ui/icon-music-disabled.png',
      'ui/icon-music-enabled.png',
      'ui/icon-sound-disabled.png',
      'ui/icon-sound-enabled.png',
      'flies/agile-fly-1.png',
      'flies/agile-fly-2.png',
      'flies/agile-fly-dead.png',
      'flies/drooler-fly-1.png',
      'flies/drooler-fly-2.png',
      'flies/drooler-fly-dead.png',
      'flies/house-fly-1.png',
      'flies/house-fly-2.png',
      'flies/house-fly-dead.png',
      'flies/hungry-fly-1.png',
      'flies/hungry-fly-2.png',
      'flies/hungry-fly-dead.png',
      'flies/macho-fly-1.png',
      'flies/macho-fly-2.png',
      'flies/macho-fly-dead.png',

      'sprites/player.png',
      'sprites/enemies/basic_enemy.png'
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