import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';

import '../dankGame.dart';

class HomeView extends SpriteComponent with Destructable {
  final DankGame game;
  
  HomeView(this.game) : super.fromSprite(0,0,Sprite('empty.png'));

  @override
  void onDestroy() {
    game.remove([game.lvls.bg, game.decorations.logo, game.buttons.startButton, game.buttons.bgmButton, game.buttons.sfxButton, game.buttons.levelsButton, game.decorations.currentLvlDisplay]);

    super.onDestroy();
  }

  @override
  void onMount() {
    game.spawn([game.lvls.bg, game.decorations.logo, game.buttons.startButton, game.buttons.bgmButton, game.buttons.sfxButton, game.buttons.levelsButton, game.decorations.currentLvlDisplay]);
  }
}