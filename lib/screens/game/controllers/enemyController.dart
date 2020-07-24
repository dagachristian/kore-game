import '../dankGame.dart';
import '../components/sprites/enemies/enemy.dart';

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
    stopped = true;
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
    game.enemies.forEach((Enemy enemy) => enemy.died());
    game.enemies = [];
  }
  
  void update(double t) {
    if (!stopped) {
      int nowTimestamp = DateTime.now().millisecondsSinceEpoch;

      int livingEnemies = 0;
      game.enemies.forEach((Enemy enemy) {
        if (!enemy.isDead) livingEnemies += 1;
      });

      if (nowTimestamp >= nextSpawn && livingEnemies < maxEnemies) {
        game.spawnEnemy();
        if (currentInterval > minSpawnInterval) {
          currentInterval -= intervalChange;
          currentInterval -= (currentInterval * .02).toInt();
        }
        nextSpawn = nowTimestamp + currentInterval;
      }
    }
  }
}