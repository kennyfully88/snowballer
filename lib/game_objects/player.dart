import 'dart:async' as synchro;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:snowballer/flame_game/snowballer_game.dart';
import 'package:snowballer/game_objects/coins.dart';
import 'package:snowballer/game_objects/flaric.dart';
import 'package:snowballer/game_objects/lava.dart';
import 'package:snowballer/game_objects/orb.dart';
import 'package:snowballer/game_objects/peaman.dart';
import 'package:snowballer/game_objects/wall01.dart';
import 'package:snowballer/providers/game_logic.dart';
import 'package:snowballer/screens/game_screen/game_screen.dart';

enum PlayerDirection { none, up, right, down, left }

class Player extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<SnowballerGame> {
  Player({
    required super.position,
    required this.gameEnder,
    required this.goodEnding,
  }) : super(
          size: Vector2.all(48),
          anchor: Anchor.bottomRight,
        );

  final Function gameEnder;
  final Function goodEnding;

  bool isGameOver = false;
  bool gameOverAnimation = false;
  bool canHitFlarics = false;

  double webPlatformBoost = 2;

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
        Vector2.all(0.75),
        parentSize: Vector2.all(48),
      ),
    );
  }

  @override
  void update(double dt) {
    if (isGameOver && gameOverAnimation) {
      return;
    }

    if (isGameOver) {
      animation = SpriteAnimation.fromFrameData(
        game.images.fromCache('player.png'),
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.5,
          textureSize: Vector2.all(16),
          texturePosition: Vector2(0, 64),
        ),
      );

      gameOverAnimation = true;
      return;
    }

    if (currentPlayerDirection == PlayerDirection.up) {
      position.y -= 3;

      if (kIsWeb) position.y -= webPlatformBoost;

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

      if (kIsWeb) position.x += webPlatformBoost;

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

      if (kIsWeb) position.y += webPlatformBoost;

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

      if (kIsWeb) position.x -= webPlatformBoost;

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
      gameScreenKey.currentContext?.read<GameLogic>().addCoin();
      FlameAudio.play('got_item.wav');
    }

    if (other is Flaric) {
      if (canHitFlarics) {
        other.removeFromParent();
        FlameAudio.play('game_over.wav');
      } else {
        isGameOver = true;
        FlameAudio.bgm.pause();
        FlameAudio.play('game_over.wav');

        if (currentPlayerDirection == PlayerDirection.up) {
          position.y += 3;
          if (kIsWeb) position.y += webPlatformBoost;
        } else if (currentPlayerDirection == PlayerDirection.right) {
          position.x -= 3;
          if (kIsWeb) position.x -= webPlatformBoost;
        } else if (currentPlayerDirection == PlayerDirection.down) {
          position.y -= 3;
          if (kIsWeb) position.y -= webPlatformBoost;
        } else if (currentPlayerDirection == PlayerDirection.left) {
          position.x += 3;
          if (kIsWeb) position.x += webPlatformBoost;
        }

        synchro.Timer(const Duration(milliseconds: 3000), () {
          gameEnder();
          gameScreenKey.currentContext?.read<GameLogic>().resetGame();
        });
      }
    }

    if (other is Lava) {
      isGameOver = true;
      FlameAudio.bgm.pause();
      FlameAudio.play('game_over.wav');

      synchro.Timer(const Duration(milliseconds: 3000), () {
        gameEnder();
        gameScreenKey.currentContext?.read<GameLogic>().resetGame();
      });
    }

    if (other is Orb) {
      other.removeFromParent();
      FlameAudio.play('got_item.wav');
      gameScreenKey.currentContext?.read<GameLogic>().enableFlaricHit();
      canHitFlarics = true;
    }

    if (other is Peaman) {
      other.removeFromParent();
      FlameAudio.bgm.pause();

      FlameAudio.play('got_item.wav');

      synchro.Timer(const Duration(milliseconds: 3000), () {
        goodEnding();
        gameScreenKey.currentContext?.read<GameLogic>().resetGame();
      });
    }

    if (other is Wall01) {
      if (currentPlayerDirection == PlayerDirection.up) {
        position.y += 3;
        if (kIsWeb) position.y += webPlatformBoost;
      } else if (currentPlayerDirection == PlayerDirection.right) {
        position.x -= 3;
        if (kIsWeb) position.x -= webPlatformBoost;
      } else if (currentPlayerDirection == PlayerDirection.down) {
        position.y -= 3;
        if (kIsWeb) position.y -= webPlatformBoost;
      } else if (currentPlayerDirection == PlayerDirection.left) {
        position.x += 3;
        if (kIsWeb) position.x += webPlatformBoost;
      }
    }

    super.onCollision(intersectionPoints, other);
  }
}
