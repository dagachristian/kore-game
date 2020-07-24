import 'package:flame/components/component.dart';

import '../../dankGame.dart';
import '../../destructable.dart';

abstract class Enemy extends SpriteComponent with Destructable {
  DankGame game;
  bool isDead;
  double speed;
  double maxHealth;
  double damage;
  double range;

  double health;

  void attack();
}