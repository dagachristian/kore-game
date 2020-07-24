import 'package:flame/components/component.dart';

abstract class Mob extends SpriteComponent {
  bool isDead;
  double maxHealth;
  double health;
}