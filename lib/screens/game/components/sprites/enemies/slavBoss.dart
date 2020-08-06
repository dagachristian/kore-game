import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';

import './enemy.dart';
import './enemyAnimation.dart';
import './basicEnemy.dart';
import './rareEnemy.dart';

import '../../../destructable.dart';
import '../../../dankGame.dart';

class SlavBoss extends Enemy with Destructable {
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

  SlavBoss(DankGame game) : super(
    game: game,
    width: 200, 
    height: 400, 
    sprite: Sprite('sprites/enemies/slav_boss.png'), 
    speed: 100.0, 
    maxHealth: 500.0, 
    damage: 100.0,
    range: 150.0, 
    attackSpeed: .2,
    aggroRange: game.size.height + game.player.height,
    attackAnim: [],
    deathAnim: [],
    attackSound: '',
    deathSound: 'sfx/enemies/slav_boss_death.mp3'
  );

  @override
  void update(double t) {
    if (DateTime.now().millisecondsSinceEpoch % 5000 < 50 && aggro && !game.player.isDead) {
      game.enemyController.spawnEnemy(BasicEnemy(game), x + width/2, y + height*2/3);
    }
    super.update(t);
  }

  @override
  void died() {
    if (!isDead) {
      isDead = true;
      health = maxHealth;
      game.remove([this, enemyHealthBar]);
      if (!game.player.isDead) {
        game.enemyController.spawnEnemy(SlavBossEvil(game), x, y);
      }
    }
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

class SlavBossEvil extends Enemy with Destructable {
  List<Sprite> headAttackAnim = <Sprite>[
    Sprite('sprites/enemies/slav_boss_evil_head_attack_01.png'),
    Sprite('sprites/enemies/slav_boss_evil_head_attack_02.png'),
    Sprite('sprites/enemies/slav_boss_evil_head_attack_03.png'),
    Sprite('sprites/enemies/slav_boss_evil_head_attack_04.png'),
    Sprite('sprites/enemies/slav_boss_evil_head_attack_05.png'),
    Sprite('sprites/enemies/slav_boss_evil_head_attack_06.png'),
    Sprite('sprites/enemies/slav_boss_evil_head_attack_07.png'),
  ];

  List<Sprite> laserAttackAnim = <Sprite>[
    Sprite('sprites/enemies/slav_boss_evil_laser_attack_01.png'),
    Sprite('sprites/enemies/slav_boss_evil_laser_attack_02.png'),
    Sprite('sprites/enemies/slav_boss_evil_laser_attack_03.png'),
    Sprite('sprites/enemies/slav_boss_evil_laser_attack_04.png'),
    Sprite('sprites/enemies/slav_boss_evil_laser_attack_05.png'),
    Sprite('sprites/enemies/slav_boss_evil_laser_attack_06.png'),
  ];

  String headAttackSound = 'sfx/enemies/slav_boss_evil_head_attack.mp3';
  String laserAttackSound = 'sfx/enemies/slav_boss_evil_laser_attack.mp3';

  SlavBossEvil(DankGame game) : super(
    game: game,
    width: 200, 
    height: 400, 
    sprite: Sprite('sprites/enemies/slav_boss_evil.png'), 
    speed: 120.0, 
    maxHealth: 600.0, 
    damage: 120.0,
    range: 150.0, 
    attackSpeed: .2,
    aggroRange: game.size.height + game.player.height,
    drop: () => game.lvl.levelPass(),
    attackAnim: [],
    deathAnim: <Sprite>[
      Sprite('sprites/enemies/slav_boss_evil_death_01.png'),
      Sprite('sprites/enemies/slav_boss_evil_death_02.png'),
      Sprite('sprites/enemies/slav_boss_evil_death_03.png'),
      Sprite('sprites/enemies/slav_boss_evil_death_04.png'),
      Sprite('sprites/enemies/slav_boss_evil_death_05.png'),
      Sprite('sprites/enemies/slav_boss_evil_death_06.png'),
      Sprite('sprites/enemies/slav_boss_evil_death_07.png'),
    ],
    attackSound: '',
    deathSound: 'sfx/enemies/slav_boss_death.mp3'
  );

  @override
  void update(double t) {
    if (DateTime.now().millisecondsSinceEpoch % 5000 < 50 && aggro && !game.player.isDead) {
      game.enemyController.spawnEnemy(RareEnemy(game), x + width/2, y + height*2/3);
    }
    super.update(t);
  }

  @override
  void attack() {
    if (DateTime.now().millisecondsSinceEpoch % (1000 / attackSpeed) < 50) {
      attacking = true;
      if (game.r.nextInt(100) < 20) {
        if (!game.sfxmuted) Flame.audio.play(headAttackSound);
        game.add(EnemyAnimation(this, headAttackAnim));
        Future.delayed(Duration(milliseconds: 1000)).then((_) {
          if (((game.player.x + game.player.width/2) - (x + width/2)).abs() < range && ((game.player.y + game.player.height/2) - (y + height/2)).abs() < range) {
            game.player.health -= damage / 4;
          }
        });
      } else {
        if (!game.sfxmuted) Flame.audio.play(laserAttackSound);
        game.add(EnemyAnimation(this, laserAttackAnim));
        Future.delayed(Duration(milliseconds: 600)).then((_) {
          if (((game.player.x + game.player.width/2) - (x + width/2)).abs() < range && ((game.player.y + game.player.height/2) - (y + height/2)).abs() < range) {
            game.player.health -= damage / 7;
          }
        });
      }
    } 
  }
}