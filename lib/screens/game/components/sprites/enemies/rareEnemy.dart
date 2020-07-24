import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import './enemy.dart';
import './enemyAnimation.dart';
import './enemyHealthBar.dart';

import '../../../destructable.dart';
import '../../../dankGame.dart';

class RareEnemy extends SpriteComponent with Destructable implements Enemy {
  @override
  DankGame game;
  @override
  EnemyHealthBar enemyHealthBar;
  @override
  bool isDead = false;
  @override
  double speed = 200.0;
  @override
  double maxHealth = 50.0;
  @override
  double damage = 50.0;
  @override
  double range = 80.0;
  @override
  double attackSpeed = 0.5;

  @override
  double health;

  @override
  List<Sprite> attackAnim = <Sprite>[
    Sprite('sprites/enemies/rare_enemy_attack_01.png'),
    Sprite('sprites/enemies/rare_enemy_attack_02.png'),
    Sprite('sprites/enemies/rare_enemy_attack_03.png'),
    Sprite('sprites/enemies/rare_enemy_attack_04.png'),
    Sprite('sprites/enemies/rare_enemy.png')
  ];

  @override
  List<Sprite> deathAnim = <Sprite>[
    Sprite('sprites/enemies/rare_enemy_death_01.png'),
    Sprite('sprites/enemies/rare_enemy_death_02.png'),
    Sprite('sprites/enemies/rare_enemy_death_03.png'),
    Sprite('sprites/enemies/rare_enemy_death_04.png'),
  ];

  RareEnemy(this.game) : super.fromSprite(72.0, 64.0, Sprite('sprites/enemies/rare_enemy.png')) {
    health = maxHealth;
    enemyHealthBar = EnemyHealthBar(this);
    game.add(enemyHealthBar);
  }

  @override
  void died() {
    if (!isDead) {
      isDead = true;
      health = maxHealth;
      game.add(EnemyAnimation(this, deathAnim));
      game.remove([this, enemyHealthBar]);
    }
  }

  @override
  void update(double t) {
    if (!isDead && health <= 0) {
      died();
    } else if (!isDead) {
      x += (game.player.x - x) / (10000/speed);
      y += (game.player.y - y) / (10000/speed);

      if ((game.player.x - x).abs() < range && (game.player.y - y).abs() < range) {
        attack();
      }
    }

    super.update(t);
  }

  @override
  void attack() {
    if (DateTime.now().millisecondsSinceEpoch % (1000 / attackSpeed) <= 100) {
      game.add(EnemyAnimation(this, attackAnim));
      game.player.health -= damage / 10;
    } 
  }
}