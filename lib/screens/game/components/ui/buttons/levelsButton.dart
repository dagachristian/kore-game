import 'package:flame/sprite.dart';

import '../../../dankGame.dart';

class LevelsButton extends EZTapableSpriteComponent {
  LevelsButton(DankGame game) : super(
    game,
    x: (game.size.width - game.tileSize * 3) / 2,
    y: (game.size.height - game.tileSize * 1.5) * 9/10,
    width: game.tileSize * 3,
    height: game.tileSize * 1.5,
    sprite: Sprite('ui/levels.png'),
    onTapDwn: () {
      game.remove([game.views.homeView]);
      game.spawn([game.views.levelSelectView]);
    }
  );
}

class LevelSelectButtons extends EZSpriteComponent {
  List<EZTapableSpriteComponent> lvlButtons;

  LevelSelectButtons(DankGame game) : super(
    game,
    sprite: Sprite('empty.png')
  ) {
    lvlButtons = [];
    for(int i=1;i<=game.lvls.levels.length;i++) {
      lvlButtons.add(EZTapableSpriteComponent(
        game,
        x: (game.size.width - game.tileSize * 3) / 2,
        y: (i * game.tileSize * 2 + 5) + (game.size.height - game.tileSize * 1.3) * 1/5,
        width: game.tileSize * 3,
        height: game.tileSize * 1.3,
        sprite: Sprite('ui/level$i.png'),
        onTapDwn: () {
          game.lvls.setCurrentLvl(i);
          game.remove([game.views.levelSelectView]);
          game.spawn([game.views.homeView]);
        } 
      ));
    }
  }

  @override
  void onMount() {
    game.spawn(lvlButtons);
  }

  @override
  void onDestroy() {
    game.remove(lvlButtons);
  }
}

class LevelSelectBg extends EZSpriteComponent {
  LevelSelectBg(DankGame game) : super(
    game,
    x: (game.size.width - game.size.width * 4/5) / 2,
    y: (game.size.height - game.size.height * 4/5) / 2,
    width: game.size.width * 4/5,
    height: game.size.height * 4/5,
    sprite: Sprite('ui/lvl_select_bg.png')
  );
}