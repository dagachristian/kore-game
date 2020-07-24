import 'package:flame/components/component.dart';
import 'package:kore_game/screens/game/dankGame.dart';
import 'package:kore_game/screens/game/destructable.dart';

abstract class Enemy extends SpriteComponent with Destructable {
  DankGame game;
  bool isDead;
  double speed;
  double maxHealth;
  double damage;
  double range;

  double health;

  void attack(double t);
}