import 'package:flame/components/component.dart';

abstract class Entity extends SpriteComponent {
  double maxHealth;
  double health;
}