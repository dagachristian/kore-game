import 'package:flame/components/component.dart';

mixin Destructable on Component {
  bool toDestroy = false;

  void spawn() => toDestroy = false;
  void remove() => toDestroy = true;

  @override
  bool destroy() => toDestroy;
}