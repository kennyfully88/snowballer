import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:snowballer/flame_game/snowballer_game.dart';
import 'package:snowballer/game_objects/coins.dart';
import 'package:snowballer/game_objects/flaric.dart';
import 'package:snowballer/game_objects/lava.dart';
import 'package:snowballer/game_objects/peaman.dart';
import 'package:snowballer/game_objects/wall01.dart';

enum PlayerDirection { none, up, right, down, left }

class Player extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<SnowballerGame> {
  Player({
    required super.position,
    required this.gameEnder,
  }) : super(
          size: Vector2.all(48),
          anchor: Anchor.bottomRight,
        );

  Function gameEnder;

  bool isGameOver = false;

  /// The previous direction of the player
  PlayerDirection previousPlayerDirection = PlayerDirection.none;

  /// The current direction of the player
  PlayerDirection currentPlayerDirection = PlayerDirection.none;

  void setPlayerDirection() {
    if (currentPlayerDirection.index == 0 ||
        currentPlayerDirection.index == 4) {
      currentPlayerDirection = PlayerDirection.up;
    } else {
      currentPlayerDirection =
          PlayerDirection.values[currentPlayerDirection.index + 1];
    }
  }

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('player.png'),
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.5,
        textureSize: Vector2.all(16),
        texturePosition: Vector2(0, 48),
      ),
    );

    add(
      RectangleHitbox.relative(
        Vector2.all(0.8),
        parentSize: Vector2.all(48),
      ),
    );
  }

  @override
  void update(double dt) {
    if (isGameOver) return;

    if (currentPlayerDirection == PlayerDirection.up) {
      position.y -= 3;

      if (previousPlayerDirection != currentPlayerDirection) {
        previousPlayerDirection = currentPlayerDirection;
        animation = SpriteAnimation.fromFrameData(
          game.images.fromCache('player.png'),
          SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.5,
            textureSize: Vector2.all(16),
            texturePosition: Vector2(0, 0),
          ),
        );
        return;
      }
    } else if (currentPlayerDirection == PlayerDirection.right) {
      position.x += 3;

      if (previousPlayerDirection != currentPlayerDirection) {
        previousPlayerDirection = currentPlayerDirection;
        animation = SpriteAnimation.fromFrameData(
          game.images.fromCache('player.png'),
          SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.5,
            textureSize: Vector2.all(16),
            texturePosition: Vector2(0, 16),
          ),
        );
        return;
      }
    } else if (currentPlayerDirection == PlayerDirection.down) {
      position.y += 3;

      if (previousPlayerDirection != currentPlayerDirection) {
        previousPlayerDirection = currentPlayerDirection;
        animation = SpriteAnimation.fromFrameData(
          game.images.fromCache('player.png'),
          SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.5,
            textureSize: Vector2.all(16),
            texturePosition: Vector2(0, 32),
          ),
        );
        return;
      }
    } else if (currentPlayerDirection == PlayerDirection.left) {
      position.x -= 3;

      if (previousPlayerDirection != currentPlayerDirection) {
        previousPlayerDirection = currentPlayerDirection;
        animation = SpriteAnimation.fromFrameData(
          game.images.fromCache('player.png'),
          SpriteAnimationData.sequenced(
            amount: 2,
            stepTime: 0.5,
            textureSize: Vector2.all(16),
            texturePosition: Vector2(0, 48),
          ),
        );
        return;
      }
    }

    super.update(dt);
  }

  @override
  Future<void> onCollision(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) async {
    if (isGameOver) return;

    if (other is Coins) {
      other.removeFromParent();
    }

    if (other is Flaric) {
      isGameOver = true;
      gameEnder();
      FlameAudio.bgm.pause();
    }

    if (other is Lava) {
      isGameOver = true;
      gameEnder();
      FlameAudio.bgm.pause();
    }

    if (other is Peaman) {
      other.removeFromParent();
    }

    if (other is Wall01) {
      if (currentPlayerDirection == PlayerDirection.up) {
        position.y += 3;
      } else if (currentPlayerDirection == PlayerDirection.right) {
        position.x -= 3;
      } else if (currentPlayerDirection == PlayerDirection.down) {
        position.y -= 3;
      } else if (currentPlayerDirection == PlayerDirection.left) {
        position.x += 3;
      }
    }

    super.onCollision(intersectionPoints, other);
  }
}
