import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flutter/painting.dart';

import './enemy.dart';

import '../../../destructable.dart';

class EnemyHealthBar extends Component with Destructable {
  final Enemy enemy;

  TextPainter tp;
  TextStyle textStyle;
  Offset textOffset;

  EnemyHealthBar(this.enemy) {
    tp = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textStyle = TextStyle(
      color: Color(0xff000000),
      fontSize: 15,
    );
  }

  @override
  void render(Canvas c) {
    tp.paint(c, textOffset);
  }

  @override
  void update(double t) {
    tp.text = TextSpan(
      text: enemy.health.toInt().toString(),
      style: textStyle,
    );
    tp.layout();
    textOffset = Offset(
      enemy.x - 10,
      enemy.y - 10,
    );
  }
  
}