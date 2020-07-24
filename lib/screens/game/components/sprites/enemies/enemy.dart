import 'package:flame/components/component.dart';

import './enemyHealthBar.dart';

import '../entity.dart';

import '../../../dankGame.dart';
import '../../../destructable.dart';


abstract class Enemy extends SpriteComponent with Destructable implements Entity {
  DankGame game;
  EnemyHealthBar enemyHealthBar;
  bool isDead;
  double speed;
  double damage;
  double range;

  void died();
  void attack();
}