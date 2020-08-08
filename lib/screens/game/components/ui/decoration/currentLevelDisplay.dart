import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flutter/painting.dart';

import '../../../dankGame.dart';

class CurrentLvlDisplay extends Component with Destructable {
  final DankGame game;

  TextPainter painter;
  TextStyle textStyle;
  Offset position;

  CurrentLvlDisplay(this.game) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textStyle = TextStyle(
      color: Color(0xffffffff),
      fontSize: 48,
      shadows: <Shadow>[
        Shadow(
          blurRadius: 7,
          color: Color(0xff000000),
          offset: Offset(3, 3),
        ),
      ],
    );

    position = Offset.zero;
  }

  @override
  void render(Canvas c) {
    painter.paint(c, position);
  }

  @override
  void update(double t) {
    if ((painter.text?.text ?? '') != (game.lvls.currentLvlIndex+1).toString()) {
      painter.text = TextSpan(
        text: 'Lvl: ' + (game.lvls.currentLvlIndex+1).toString(),
        style: textStyle,
      );

      painter.layout();

      position = Offset(
        (game.screenSize.width * 1 / 20),
        (game.screenSize.height * 1 / 25),
      );
    }
  }
}