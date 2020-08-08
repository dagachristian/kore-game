import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import 'enemy.dart';
import 'enemyAnimation.dart';
import 'basicEnemy.dart';

import '../../../dankGame.dart';

class SlavEnemy extends Enemy with Destructable {
  List<Sprite> jumpAttackAnim = <Sprite>[
    Sprite('sprites/enemies/slav_boss_jump_attack_01.png'),
    Sprite('sprites/enemies/slav_boss_jump_attack_02.png'),
    Sprite('sprites/enemies/slav_boss_jump_attack_03.png'),
    Sprite('sprites/enemies/slav_boss_jump_attack_04.png'),
    Sprite('sprites/enemies/slav_boss_jump_attack_05.png'),
    Sprite('sprites/enemies/slav_boss_jump_attack_06.png'),
    Sprite('sprites/enemies/slav_boss_jump_attack_07.png'),
  ];

  List<Sprite> tongueAttackAnim = <Sprite>[
    Sprite('sprites/enemies/slav_boss_tongue_attack_01.png'),
    Sprite('sprites/enemies/slav_boss_tongue_attack_02.png'),
    Sprite('sprites/enemies/slav_boss_tongue_attack_03.png'),
    Sprite('sprites/enemies/slav_boss_tongue_attack_04.png'),
    Sprite('sprites/enemies/slav_boss_tongue_attack_05.png'),
    Sprite('sprites/enemies/slav_boss_tongue_attack_06.png'),
  ];

  String jumpAttackSound = 'sfx/enemies/slav_boss_jump_attack.mp3';
  String tongueAttackSound = 'sfx/enemies/slav_boss_tongue_attack.mp3';

  int maxSpawnEnemies = 5;
  int spawnedEnemies;

  SlavEnemy(DankGame game) : super(
    game: game,
    width: 180, 
    height: 360, 
    sprite: Sprite('sprites/enemies/slav_boss.png'), 
    speed: 100.0, 
    maxHealth: 500.0, 
    damage: 100.0,
    range: 125.0, 
    attackSpeed: .2,
    aggroRange: game.size.height,
    drop: () => game.lvls.currentLvl.levelPass(),
    attackAnim: [],
    deathAnim: [Sprite('sprites/enemies/slav_boss.png')],
    attackSound: '',
    deathSound: 'sfx/enemies/slav_boss_death.mp3'
  ) {
    spawnedEnemies = 0;
  }

  @override
  void update(double t) {
    if (DateTime.now().millisecondsSinceEpoch % 5000 < 50 && aggro && !game.player.isDead && spawnedEnemies <= maxSpawnEnemies) {
      game.controllers.enemyController.spawnEnemy(BasicEnemy(game), x + width/2, y + height*2/3);
      spawnedEnemies++;
    }
    super.update(t);
  }

  @override
  void attack() {
    if (DateTime.now().millisecondsSinceEpoch % (1000 / attackSpeed) < 50) {
      attacking = true;
      if (game.r.nextInt(100) < 20) {
        if (!game.sfxmuted) Flame.audio.play(jumpAttackSound);
        game.add(EnemyAnimation(this, jumpAttackAnim));
        Future.delayed(Duration(milliseconds: 1000)).then((_) {
          if (((game.player.x + game.player.width/2) - (x + width/2)).abs() < range && ((game.player.y + game.player.height/2) - (y + height/2)).abs() < range) {
            game.player.health -= damage / 4;
          }
        });
      } else {
        if (!game.sfxmuted) Flame.audio.play(tongueAttackSound);
        game.add(EnemyAnimation(this, tongueAttackAnim));
        Future.delayed(Duration(milliseconds: 800)).then((_) {
          if (((game.player.x + game.player.width/2) - (x + width/2)).abs() < range && ((game.player.y + game.player.height/2) - (y + height/2)).abs() < range) {
            game.player.health -= damage / 7;
          }
        });
      }
    } 
  }
}