import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:kore_game/screens/game/components/ui/bg/background.dart';

import '../dankGame.dart';

class LevelSelectView extends SpriteComponent with Destructable {
  final DankGame game;
  BackGround bg;
  EZSpriteComponent buttonsBg;

  LevelSelectView(this.game) : super.fromSprite(0, 0, Sprite('empty.png')) {
    bg = BackGround(game);
    buttonsBg = EZSpriteComponent(
      game,
      x: (game.size.width - game.size.width * 4/5) / 2,
      y: (game.size.height - game.size.height * 2/3) / 2,
      width: game.size.width * 4/5,
      height: game.size.height * 2/3,
      sprite: Sprite('ui/lvl_select_bg.png')
    );
  }
  
  @override
  void onMount() {
    game.spawn([bg, buttonsBg, game.buttons.levelSelectButtons, game.buttons.backButton]);
    super.onMount();
  }

  @override
  void onDestroy() {
    game.remove([bg, buttonsBg, game.buttons.levelSelectButtons, game.buttons.backButton]);
    super.onDestroy();
  }
}