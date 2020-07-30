import 'package:flame/components/component.dart';
import 'package:kore_game/screens/game/destructable.dart';

abstract class Level extends SpriteComponent with Destructable {
  void reset();
  void moveX(double x);
  void moveY(double y);
  void addChild(SpriteComponent child);
}