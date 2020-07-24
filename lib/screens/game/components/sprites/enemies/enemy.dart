import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import './enemyHealthBar.dart';

import '../mob.dart';

import '../../../dankGame.dart';
import '../../../destructable.dart';


abstract class Enemy extends SpriteComponent with Destructable implements Mob {
  DankGame game;
  EnemyHealthBar enemyHealthBar;
  double speed;
  double damage;
  double range;
  double attackSpeed;
  List<Sprite> attackAnim;
  List<Sprite> deathAnim;

  void died();
  void attack();
}