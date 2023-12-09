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

  late Coins coins;

  late Wall01 wall01;
  late Wall01 wall02;
  late Wall01 wall03;
  late Wall01 wall04;
  late Wall01 wall05;
  late Wall01 wall06;
  late Wall01 wall07;
  late Wall01 wall08;
  late Wall01 wall09;
  late Wall01 wall10;
  late Wall01 wall11;
  late Wall01 wall12;
  late Wall01 wall13;
  late Wall01 wall14;
  late Wall01 wall15;
  late Wall01 wall16;
  late Wall01 wall17;
  late Wall01 wall18;
  late Wall01 wall19;
  late Wall01 wall20;

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

    player = Player(
      position: Vector2(48 * 3, 32 * 3),
    );

    flaric = Flaric(
      position: Vector2(16 * 3, 48 * 3),
    );

    coins = Coins(
      position: Vector2(64 * 3, 16 * 3),
    );

    wall01 = Wall01(position: Vector2(48 * 0, 0));
    wall02 = Wall01(position: Vector2(48 * 1, 0));
    wall03 = Wall01(position: Vector2(48 * 2, 0));
    wall04 = Wall01(position: Vector2(48 * 3, 0));
    wall05 = Wall01(position: Vector2(48 * 4, 0));
    wall06 = Wall01(position: Vector2(48 * 5, 0));
    wall07 = Wall01(position: Vector2(48 * 6, 0));
    wall08 = Wall01(position: Vector2(48 * 7, 0));
    wall09 = Wall01(position: Vector2(48 * 8, 0));
    wall10 = Wall01(position: Vector2(48 * 9, 0));

    wall11 = Wall01(position: Vector2(48 * 0, 160 * 3 - 48));
    wall12 = Wall01(position: Vector2(48 * 1, 160 * 3 - 48));
    wall13 = Wall01(position: Vector2(48 * 2, 160 * 3 - 48));
    wall14 = Wall01(position: Vector2(48 * 3, 160 * 3 - 48));
    wall15 = Wall01(position: Vector2(48 * 4, 160 * 3 - 48));
    wall16 = Wall01(position: Vector2(48 * 5, 160 * 3 - 48));
    wall17 = Wall01(position: Vector2(48 * 6, 160 * 3 - 48));
    wall18 = Wall01(position: Vector2(48 * 7, 160 * 3 - 48));
    wall19 = Wall01(position: Vector2(48 * 8, 160 * 3 - 48));
    wall20 = Wall01(position: Vector2(48 * 9, 160 * 3 - 48));

    world.add(player);

    world.add(flaric);

    world.add(coins);

    world.add(wall01);
    world.add(wall02);
    world.add(wall03);
    world.add(wall04);
    world.add(wall05);
    world.add(wall06);
    world.add(wall07);
    world.add(wall08);
    world.add(wall09);
    world.add(wall10);
    world.add(wall11);
    world.add(wall12);
    world.add(wall13);
    world.add(wall14);
    world.add(wall15);
    world.add(wall16);
    world.add(wall17);
    world.add(wall18);
    world.add(wall19);
    world.add(wall20);

    cameraComponent.follow(player);

    addAll([cameraComponent, world]);
  }
}
