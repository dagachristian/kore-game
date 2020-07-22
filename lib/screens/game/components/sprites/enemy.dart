import 'package:flame/components/component.dart';
import 'package:kore_game/screens/game/dankGame.dart';

abstract class Enemy extends SpriteComponent {
  DankGame game;
  bool isDead = false;
  double speed;
}