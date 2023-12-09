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
        child: Center(
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: ClipRect(
              clipBehavior: Clip.hardEdge,
              child: GameWidget<SnowballerGame>(
                game: snowBallerGame,
              ),
            ),
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

  @override
  final world = World();
  late final CameraComponent cameraComponent;

  @override
  Color backgroundColor() => const Color(0x400000FF);

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'player.png',
    ]);

    cameraComponent = CameraComponent(world: world);

    cameraComponent.viewfinder.anchor = Anchor.topLeft;
    addAll([cameraComponent, world]);

    player = Player(
      position: Vector2(0, 0),
    );

    world.add(player);
  }
}

class Player extends SpriteAnimationComponent with HasGameRef<SnowballerGame> {
  Player({
    required super.position,
  }) : super(
          size: Vector2.all(64),
          anchor: Anchor.topLeft,
        );

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('player.png'),
      SpriteAnimationData.sequenced(
        amount: 1,
        textureSize: Vector2.all(16),
        stepTime: 0.12,
      ),
    );
  }
}
