import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final snowBallerGame = SnowballerGame();

    return PopScope(
      onPopInvoked: (didPop) => false,
      canPop: false,
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: SafeArea(
          child: GameWidget<SnowballerGame>(
            game: snowBallerGame,
          ),
        ),
      ),
    );
  }
}

/// Snowballer game
class SnowballerGame extends FlameGame {
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

    cameraComponent = CameraComponent.withFixedResolution(
        world: world, width: 160, height: 160);

    cameraComponent.viewfinder.anchor = Anchor.topLeft;

    addAll([cameraComponent, world]);

    player = Player(
      position: Vector2(32, 16),
    );

    flaric = Flaric(
      position: Vector2(32, 48),
    );

    coins = Coins(
      position: Vector2(64, 16),
    );

    wall01 = Wall01(position: Vector2(16 * 0, 0));
    wall02 = Wall01(position: Vector2(16 * 1, 0));
    wall03 = Wall01(position: Vector2(16 * 2, 0));
    wall04 = Wall01(position: Vector2(16 * 3, 0));
    wall05 = Wall01(position: Vector2(16 * 4, 0));
    wall06 = Wall01(position: Vector2(16 * 5, 0));
    wall07 = Wall01(position: Vector2(16 * 6, 0));
    wall08 = Wall01(position: Vector2(16 * 7, 0));
    wall09 = Wall01(position: Vector2(16 * 8, 0));
    wall10 = Wall01(position: Vector2(16 * 9, 0));

    wall11 = Wall01(position: Vector2(16 * 0, 160 - 16));
    wall12 = Wall01(position: Vector2(16 * 1, 160 - 16));
    wall13 = Wall01(position: Vector2(16 * 2, 160 - 16));
    wall14 = Wall01(position: Vector2(16 * 3, 160 - 16));
    wall15 = Wall01(position: Vector2(16 * 4, 160 - 16));
    wall16 = Wall01(position: Vector2(16 * 5, 160 - 16));
    wall17 = Wall01(position: Vector2(16 * 6, 160 - 16));
    wall18 = Wall01(position: Vector2(16 * 7, 160 - 16));
    wall19 = Wall01(position: Vector2(16 * 8, 160 - 16));
    wall20 = Wall01(position: Vector2(16 * 9, 160 - 16));

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
  }
}

class Player extends SpriteAnimationComponent with HasGameRef<SnowballerGame> {
  Player({
    required super.position,
  }) : super(size: Vector2.all(16), anchor: Anchor.topLeft);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('player.png'),
      SpriteAnimationData.sequenced(
        amount: 2,
        textureSize: Vector2.all(16),
        stepTime: 0.5,
      ),
    );
  }
}

class Wall01 extends SpriteAnimationComponent with HasGameRef<SnowballerGame> {
  Wall01({
    required super.position,
  }) : super(size: Vector2.all(16), anchor: Anchor.topLeft);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('wall_01.png'),
      SpriteAnimationData.sequenced(
        amount: 1,
        textureSize: Vector2.all(16),
        stepTime: 0.5,
      ),
    );
  }
}

class Flaric extends SpriteAnimationComponent with HasGameRef<SnowballerGame> {
  Flaric({
    required super.position,
  }) : super(size: Vector2.all(16), anchor: Anchor.topLeft);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('flaric.png'),
      SpriteAnimationData.sequenced(
        amount: 2,
        textureSize: Vector2.all(16),
        stepTime: 0.25,
      ),
    );
  }
}

class Coins extends SpriteAnimationComponent with HasGameRef<SnowballerGame> {
  Coins({
    required super.position,
  }) : super(size: Vector2.all(16), anchor: Anchor.topLeft);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('coins.png'),
      SpriteAnimationData.sequenced(
        amount: 1,
        textureSize: Vector2.all(16),
        stepTime: 1,
      ),
    );
  }
}
