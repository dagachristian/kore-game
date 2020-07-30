import 'package:flame/components/component.dart';

abstract class Mob extends SpriteComponent {
  bool isDead;
  double maxHealth;
  double damage;
  double range;
  double speed;
  double health;
  bool attacking;

  void died();
  void attack();
}