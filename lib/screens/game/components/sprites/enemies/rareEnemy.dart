import 'package:flame/sprite.dart';

import './enemy.dart';

import '../../../destructable.dart';
import '../../../dankGame.dart';

class RareEnemy extends Enemy with Destructable {
  RareEnemy(DankGame game) : super(
    game: game,
    width: 80.0,
    height: 70.0,
    sprite: Sprite('sprites/enemies/rare_enemy.png'),
    speed: 200.0,
    maxHealth: 50.0,
    damage: 50.0,
    range: 80.0,
    attackSpeed: 0.5,
    aggroRange: game.size.width,
    attackAnim: <Sprite>[
      Sprite('sprites/enemies/rare_enemy_attack_01.png'),
      Sprite('sprites/enemies/rare_enemy_attack_02.png'),
      Sprite('sprites/enemies/rare_enemy_attack_03.png'),
      Sprite('sprites/enemies/rare_enemy_attack_04.png'),
      Sprite('sprites/enemies/rare_enemy.png')
    ],
    deathAnim: <Sprite>[
      Sprite('sprites/enemies/rare_enemy_death_01.png'),
      Sprite('sprites/enemies/rare_enemy_death_02.png'),
      Sprite('sprites/enemies/rare_enemy_death_03.png'),
      Sprite('sprites/enemies/rare_enemy_death_04.png'),
    ],
    attackSound: 'sfx/enemies/rare_enemy_attack.mp3',
    deathSound: 'sfx/enemies/rare_enemy_death.mp3'
  );
}