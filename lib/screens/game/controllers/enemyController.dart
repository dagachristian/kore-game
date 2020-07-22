import '../dankGame.dart';

import '../components/sprites/enemy.dart';

class EnemyController {
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxEnemies = 7;

  final DankGame game;
  int currentInterval;
  int nextSpawn;

  EnemyController(this.game) {
    start();
  }

  void start() {
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAll() {
    game.enemies.forEach((Enemy enemy) => enemy.isDead = true);
  }
  
  void update(double t) {
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch;

    int livingFlies = 0;
    game.enemies.forEach((Enemy enemy) {
      if (!enemy.isDead) livingFlies += 1;
    });

    if (nowTimestamp >= nextSpawn && livingFlies < maxEnemies) {
      game.spawnEnemy();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * .02).toInt();
      }
      nextSpawn = nowTimestamp + currentInterval;
    }
  }

}