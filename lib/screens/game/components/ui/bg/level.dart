import 'package:flame/components/component.dart';

import '../../../destructable.dart';

abstract class Level extends SpriteComponent with Destructable {
  void reset();
  void moveX(double x);
  void moveY(double y);
  void addChild(SpriteComponent child);
  void addChildren(List<SpriteComponent> childs);
  void removeChild(SpriteComponent child);
  void removeAll();
}