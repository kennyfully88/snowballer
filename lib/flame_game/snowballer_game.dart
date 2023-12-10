import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:snowballer/game_objects/coins.dart';
import 'package:snowballer/game_objects/flaric.dart';
import 'package:snowballer/game_objects/player.dart';
import 'package:snowballer/game_objects/wall01.dart';

class SnowballerGame extends FlameGame
    with HasCollisionDetection, TapCallbacks {
  SnowballerGame();

  late Player player;

  late Flaric flaric;

  final flaricList = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];

  final List mapAreaA1 = [
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 3, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1],
    [1, 1, 1, 1, 2, 0, 1, 1, 1, 1],
  ];

  @override
  void onTapDown(TapDownEvent event) {
    player.setPlayerDirection();

    super.onTapDown(event);
  }

  @override
  final world = World();
  late final CameraComponent cameraComponent;

  @override
  Color backgroundColor() => const Color(0x00000000);

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'player.png',
      'wall_01.png',
      'flaric.png',
      'coins.png',
    ]);

    cameraComponent = CameraComponent(
      world: world,
    );

    player = Player(position: Vector2(96, 96));

    flaric = Flaric(position: Vector2(384, 48));

    void renderMapArea(mapAreaName, mapX, mapY) {
      for (int i = 0; i < mapAreaName.length; i++) {
        for (int j = 0; j < mapAreaName[i].length; j++) {
          if (mapAreaName[i][j] == 1) {
            Wall01 tile = Wall01(
                position: Vector2(((mapX * 480) + (48 * j)).toDouble(),
                    ((mapY * 480) + (48 * i)).toDouble()));
            world.add(tile);
          } else if (mapAreaName[i][j] == 2) {
            Coins tile = Coins(
                position: Vector2(((mapX * 480) + (48 * j)).toDouble(),
                    ((mapY * 480) + (48 * i)).toDouble()));
            world.add(tile);
          } else if (mapAreaName[i][j] == 3) {
            Flaric tile = Flaric(
                position: Vector2(((mapX * 480) + (48 * j)).toDouble(),
                    ((mapY * 480) + (48 * i)).toDouble()));
            world.add(tile);
          }
        }
      }
    }

    renderMapArea(mapAreaA1, 0, 0);
    renderMapArea(mapAreaA1, 1, 0);

    world.add(player);
    world.add(flaric);
    cameraComponent.follow(player);
    addAll([cameraComponent, world]);
  }
}
