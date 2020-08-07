import 'dart:ui';

import 'package:flame/components/component.dart';

import '../dankGame.dart';

class PlayingView extends PositionComponent with Destructable {
  final DankGame game;

  PlayingView(this.game);

  @override
  void onMount() {
    game.spawn([game.player, game.huds.joyStick, game.huds.itemBar, game.huds.helmetSlot, game.huds.healthBar, game.buttons.pauseButton]);
  }

  @override
  void onDestroy() {
    game.remove([game.player, game.huds.joyStick, game.huds.itemBar, game.huds.helmetSlot, game.huds.healthBar, game.buttons.pauseButton]);
  }

  @override
  void render(Canvas c) {}
}