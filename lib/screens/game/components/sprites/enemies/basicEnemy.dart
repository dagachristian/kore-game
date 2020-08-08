import 'package:flame/sprite.dart';

import './enemy.dart';

import '../../../dankGame.dart';

class BasicEnemy extends Enemy with Destructable {
  BasicEnemy(DankGame game) : super(
    game: game,
    width: 72.0, 
    height: 64.0, 
    sprite: Sprite('sprites/enemies/basic_enemy.png'), 
    speed: 150.0, 
    maxHealth: 50.0, 
    damage: 40.0, 
    range: 50.0, 
    attackSpeed: 1,
    aggroRange: game.size.width - 10,
    drop: () => game.player.health += 1,
    attackAnim: <Sprite>[
      Sprite('sprites/enemies/basic_enemy_attack_01.png'),
      Sprite('sprites/enemies/basic_enemy_attack_02.png'),
      Sprite('sprites/enemies/basic_enemy.png')
    ], 
    deathAnim: <Sprite>[
      Sprite('sprites/enemies/basic_enemy_death_01.png'),
      Sprite('sprites/enemies/basic_enemy_death_02.png'),
      Sprite('sprites/enemies/basic_enemy_death_03.png'),
      Sprite('sprites/enemies/basic_enemy_death_04.png'),
    ],
    attackSound: 'sfx/enemies/basic_enemy_attack.mp3',
    deathSound: 'sfx/enemies/basic_enemy_death.mp3'
  );
}