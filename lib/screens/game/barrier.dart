import 'package:flame/components/component.dart';

import './components/sprites/mob.dart';

class Barrier {
  List<PositionComponent> barriers;

  Barrier() {
    barriers = [];
  }

  void addBarrier(PositionComponent pc) {
    barriers.add(pc);
  }

  void addBarriers(List<PositionComponent> pcs) {
    barriers.addAll(pcs);
  }

  void removeBarrier(PositionComponent pc) {
    barriers.remove(pc);
  }

  void removeBarriers() {
    barriers = [];
  }

  bool collide(Mob mob, double x, double y) {
    bool collides = false;
    barriers.forEach((PositionComponent pc) {
      if (mob.x + x < pc.x + pc.width && mob.x + x + mob.width > pc.x && mob.y + y < pc.y + pc.height && mob.y + y + mob.height > pc.y) {
        collides = true;
      }
    });
    return collides;
  }
}