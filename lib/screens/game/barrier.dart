import 'package:flame/components/component.dart';
import 'components/sprites/mob.dart';

class Barrier {
  List<SpriteComponent> barriers;

  Barrier() {
    barriers = [];
  }

  void addBarrier(SpriteComponent c) {
    barriers.add(c);
  }

  void removeBarrier(SpriteComponent c) {
    barriers.remove(c);
  }

  void removeBarriers() {
    barriers = [];
  }

  bool collide(Mob mob, double x, double y) {
    bool collides = false;
    barriers.forEach((SpriteComponent c) {
      if (mob.x + x < c.x + c.width && mob.x + x + mob.width > c.x && mob.y + y < c.y + c.height && mob.y + y + mob.height > c.y) {
        collides = true;
      }
    });
    return collides;
  }
}