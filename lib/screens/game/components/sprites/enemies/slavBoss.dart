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

  SlavBoss(DankGame game) : super(
    game: game,
    width: 200, 
    height: 400, 
    sprite: Sprite('sprites/enemies/slav_boss.png'), 
    speed: 100.0, 
    maxHealth: 500.0, 
    damage: 100.0,
    range: 125.0, 
    attackSpeed: .2,
    aggroRange: game.size.height + game.player.height,
    attackAnim: [],
    deathAnim: []
  );

  @override
  void update(double t) {
    if (DateTime.now().millisecondsSinceEpoch % 5000 < 50 && aggro) {
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
      game.enemyController.spawnEnemy(SlavBossEvil(game), x, y);
    }
  }

  @override
  void attack() {
    if (DateTime.now().millisecondsSinceEpoch % (1000 / attackSpeed) < 50) {
      attacking = true;
      if (game.r.nextInt(100) < 20) {
        game.add(EnemyAnimation(this, jumpAttackAnim));
        game.player.health -= damage / 5;
      } else {
        game.add(EnemyAnimation(this, tongueAttackAnim));
        game.player.health -= damage / 8;
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

  SlavBossEvil(DankGame game) : super(
    game: game,
    width: 200, 
    height: 400, 
    sprite: Sprite('sprites/enemies/slav_boss_evil.png'), 
    speed: 120.0, 
    maxHealth: 600.0, 
    damage: 120.0,
    range: 125.0, 
    attackSpeed: .2,
    aggroRange: game.size.height + game.player.height,
    attackAnim: [],
    deathAnim: <Sprite>[
      Sprite('sprites/enemies/slav_boss_evil_death_01.png'),
      Sprite('sprites/enemies/slav_boss_evil_death_02.png'),
      Sprite('sprites/enemies/slav_boss_evil_death_03.png'),
      Sprite('sprites/enemies/slav_boss_evil_death_04.png'),
      Sprite('sprites/enemies/slav_boss_evil_death_05.png'),
      Sprite('sprites/enemies/slav_boss_evil_death_06.png'),
      Sprite('sprites/enemies/slav_boss_evil_death_07.png'),
    ]
  );

  @override
  void update(double t) {
    if (DateTime.now().millisecondsSinceEpoch % 5000 < 50 && aggro) {
      game.enemyController.spawnEnemy(RareEnemy(game), x + width/2, y + height*2/3);
    }
    super.update(t);
  }

  @override
  void attack() {
    if (DateTime.now().millisecondsSinceEpoch % (1000 / attackSpeed) < 50) {
      attacking = true;
      if (game.r.nextInt(100) < 20) {
        game.add(EnemyAnimation(this, headAttackAnim));
        game.player.health -= damage / 5;
      } else {
        game.add(EnemyAnimation(this, laserAttackAnim));
        game.player.health -= damage / 8;
      }
    } 
  }
}