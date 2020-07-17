import 'package:flame/util.dart';

class _Flame {
  Util flameUtil;

  Future<void> init() async {
    flameUtil = Util();
    await flameUtil.fullScreen();
    await flameUtil.setPortrait();
  }
}
final _Flame flame = _Flame();