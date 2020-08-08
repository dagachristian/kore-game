import 'package:flame/flame.dart';
import 'package:flame/util.dart';

class _Flame {
  Util flameUtil;

  Future<void> init() async {
    flameUtil = Util();
    await flameUtil.fullScreen();
    await flameUtil.setPortrait();

    await Flame.images.loadAll(<String>[
      'empty.png',

      'bg/background.jpg',

      'bg/level_01.jpg',
      'bg/watchtower.png',
      'bg/wall.png',

      'bg/level_02.jpg',

      'branding/logo.png',
      'branding/spritesheet.png',

      'ui/next.png',
      'ui/passed.png',
      'ui/game_over.png',
      'ui/restart.png',
      'ui/start.png',
      'ui/back.png',
      'ui/pause.png',
      'ui/home.png',
      'ui/game_over.png',
      'ui/healthbar.png',
      'ui/attack.png',
      'ui/attack_pressed.png',
      'ui/item_slot.png',
      'ui/bgm.png',
      'ui/mutebgm.png',
      'ui/sfx.png',
      'ui/mutesfx.png',
      'ui/levels.png',
      'ui/level1.png',
      'ui/level2.png',
      'ui/level3.png',
      'ui/lvl_select_bg.png',

      'items/basic_heal.png',
      'items/basic_strength.png',
      'items/basic_ultimate.png',

      'items/crown.png',
      'items/crown_01.png',
      'items/crown_02.png',
      'items/crown_03.png',
      'items/crown_04.png',
      'items/crown_05.png',
      'items/crown_06.png',

      'sprites/player/player.png',
      'sprites/player/player_attack_01.png',
      'sprites/player/player_attack_02.png',
      'sprites/player/player_death_01.png',
      'sprites/player/player_death_02.png',
      'sprites/player/player_death_03.png',
      'sprites/player/player_death_04.png',
      'sprites/player/player_death_05.png',
      'sprites/player/player_death_06.png',

      'sprites/enemies/basic_enemy.png',
      'sprites/enemies/basic_enemy_attack_01.png',
      'sprites/enemies/basic_enemy_attack_02.png',
      'sprites/enemies/basic_enemy_death_01.png',
      'sprites/enemies/basic_enemy_death_02.png',
      'sprites/enemies/basic_enemy_death_03.png',
      'sprites/enemies/basic_enemy_death_04.png',

      'sprites/enemies/rare_enemy.png',
      'sprites/enemies/rare_enemy_attack_01.png',
      'sprites/enemies/rare_enemy_attack_02.png',
      'sprites/enemies/rare_enemy_attack_03.png',
      'sprites/enemies/rare_enemy_attack_04.png',
      'sprites/enemies/rare_enemy_death_01.png',
      'sprites/enemies/rare_enemy_death_02.png',
      'sprites/enemies/rare_enemy_death_03.png',
      'sprites/enemies/rare_enemy_death_04.png',

      'sprites/enemies/slav_boss.png',
      'sprites/enemies/slav_boss_jump_attack_01.png',
      'sprites/enemies/slav_boss_jump_attack_02.png',
      'sprites/enemies/slav_boss_jump_attack_03.png',
      'sprites/enemies/slav_boss_jump_attack_04.png',
      'sprites/enemies/slav_boss_jump_attack_05.png',
      'sprites/enemies/slav_boss_jump_attack_06.png',
      'sprites/enemies/slav_boss_jump_attack_07.png',
      'sprites/enemies/slav_boss_tongue_attack_01.png',
      'sprites/enemies/slav_boss_tongue_attack_02.png',
      'sprites/enemies/slav_boss_tongue_attack_03.png',
      'sprites/enemies/slav_boss_tongue_attack_04.png',
      'sprites/enemies/slav_boss_tongue_attack_05.png',
      'sprites/enemies/slav_boss_tongue_attack_06.png',

      'sprites/enemies/slav_boss_evil.png',
      'sprites/enemies/slav_boss_evil_head_attack_01.png',
      'sprites/enemies/slav_boss_evil_head_attack_02.png',
      'sprites/enemies/slav_boss_evil_head_attack_03.png',
      'sprites/enemies/slav_boss_evil_head_attack_04.png',
      'sprites/enemies/slav_boss_evil_head_attack_05.png',
      'sprites/enemies/slav_boss_evil_head_attack_06.png',
      'sprites/enemies/slav_boss_evil_head_attack_07.png',
      'sprites/enemies/slav_boss_evil_laser_attack_01.png',
      'sprites/enemies/slav_boss_evil_laser_attack_02.png',
      'sprites/enemies/slav_boss_evil_laser_attack_03.png',
      'sprites/enemies/slav_boss_evil_laser_attack_04.png',
      'sprites/enemies/slav_boss_evil_laser_attack_05.png',
      'sprites/enemies/slav_boss_evil_laser_attack_06.png',
      'sprites/enemies/slav_boss_evil_death_01.png',
      'sprites/enemies/slav_boss_evil_death_02.png',
      'sprites/enemies/slav_boss_evil_death_03.png',
      'sprites/enemies/slav_boss_evil_death_04.png',
      'sprites/enemies/slav_boss_evil_death_05.png',
      'sprites/enemies/slav_boss_evil_death_06.png',
      'sprites/enemies/slav_boss_evil_death_07.png',
    ]);

    await Flame.audio.loadAll(<String>[
      'empty.mp3',

      'bgm/background_music.mp3',

      'sfx/player/player_death.mp3',
      'sfx/player/player_attack.mp3',
      'sfx/player/basic_heal.mp3',

      'sfx/enemies/basic_enemy_death.mp3',
      'sfx/enemies/basic_enemy_attack.mp3',

      'sfx/enemies/rare_enemy_death.mp3',
      'sfx/enemies/rare_enemy_attack.mp3',

      'sfx/enemies/slav_boss_death.mp3',
      'sfx/enemies/slav_boss_tongue_attack.mp3',
      'sfx/enemies/slav_boss_jump_attack.mp3',
      
      'sfx/enemies/slav_boss_evil_head_attack.mp3',
      'sfx/enemies/slav_boss_evil_laser_attack.mp3',
      'sfx/enemies/slav_boss_evil_bg.mp3',
    ]);

    Flame.bgm.initialize();
  }
}
final _Flame flame = _Flame();