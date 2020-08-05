import 'dart:math';

import '../dankGame.dart';
import '../components/sprites/enemies/index.dart';
import '../components/ui/index.dart';

class EnemyController {
  Random r;

  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 250;
  final int intervalChange = 3;
  final int maxEnemies = 10;

  final int rareEnemyMinChance = 10;
  final int rareEnemyMaxChance = 50;

  final DankGame game;
  int currentInterval;
  int nextSpawn;
  bool stopped;
  List<Enemy> enemies;

  EnemyController(this.game) {
    stopped = true;
    r = Random();
    enemies = [];
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
    enemies.forEach((Enemy enemy) => enemy.died());
    enemies = [];
  }
  
  void update(double t) {
    if (!stopped) {
      int nowTimestamp = DateTime.now().millisecondsSinceEpoch;

      int livingEnemies = 0;
      enemies.forEach((Enemy enemy) {
        if (!enemy.isDead) livingEnemies += 1;
      });

      if (nowTimestamp >= nextSpawn && livingEnemies < maxEnemies) {
        spawnRandEnemy();
        if (currentInterval > minSpawnInterval) {
          currentInterval -= intervalChange;
          currentInterval -= (currentInterval * .02).toInt();
        }
        nextSpawn = nowTimestamp + currentInterval;
      }
    }
  }

  void spawnRandEnemy() {
    Enemy enemy;
    int spawnedEnemy = r.nextInt(100);
    double rareEnemyChance = minSpawnInterval / currentInterval * rareEnemyMaxChance;
    if (spawnedEnemy < rareEnemyChance || spawnedEnemy < rareEnemyMinChance) {
      enemy = RareEnemy(game);
    } else {
      enemy = BasicEnemy(game);
    }
    enemy.x = r.nextInt(game.size.width.toInt()).toDouble();
    enemy.y = r.nextInt(game.size.height.toInt()).toDouble();
    switch(r.nextInt(4)) {
      case 0:
        enemy.x += game.size.width;
        break;
      case 1:
        enemy.x -= game.size.width;
        break;
      case 2:
        enemy.y += game.size.height;
        break;
      case 3:
        enemy.y -= game.size.height;
        break;
    }
    game.lvl.addChild(enemy);
    enemies.add(enemy);
    game.spawn([enemy]);
  }

  void populateMapWithEnemies(Level lvl, int amount) {
    for (int i=0;i<amount;i++) {
      Enemy enemy = lvl.getEnemy();
      enemy.x = r.nextInt(lvl.width.toInt()).toDouble();
      enemy.y = r.nextInt(lvl.height.toInt()).toDouble();
      enemies.add(enemy);
      game.lvl.addChild(enemy);
    }
    Enemy boss = lvl.getBoss();
    enemies.add(boss);
    game.lvl.addChild(boss);
    game.spawn(enemies);
  }

  void spawnEnemy(Enemy enemy, double x, double y) {
    enemy.x = x;
    enemy.y = y;
    enemies.add(enemy);
    game.lvl.addChild(enemy);
    game.spawn([enemy]);
  }
}