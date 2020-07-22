import '../dankGame.dart';

import '../components/sprites/enemy.dart';

class EnemyController {
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxEnemies = 10;

  final DankGame game;
  int currentInterval;
  int nextSpawn;
  bool stopped;

  EnemyController(this.game) {
    start();
  }

  void start() {
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
    stopped = false;
  }

  void stop() {
    stopped = true;
  }

  void killAll() {
    game.enemies.forEach((Enemy enemy) => enemy.isDead = true);
  }
  
  void update(double t) {
    int nowTimestamp = DateTime.now().millisecondsSinceEpoch;

    int livingEnemies = 0;
    game.enemies.forEach((Enemy enemy) {
      if (!enemy.isDead) livingEnemies += 1;
    });

    if (nowTimestamp >= nextSpawn && livingEnemies < maxEnemies && !stopped) {
      game.spawnEnemy();
      if (currentInterval > minSpawnInterval) {
        currentInterval -= intervalChange;
        currentInterval -= (currentInterval * .02).toInt();
      }
      nextSpawn = nowTimestamp + currentInterval;
    }
  }

}