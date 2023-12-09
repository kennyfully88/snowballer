import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:snowballer/flame_game/snowballer_game.dart';
import 'package:snowballer/game_objects/wall01.dart';

class Player extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<SnowballerGame> {
  Player({
    required super.position,
  }) : super(
          size: Vector2.all(48),
          anchor: Anchor.bottomRight,
        );

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

    add(
      RectangleHitbox(),
    );
  }

  @override
  void update(double dt) {
    position.y += 3;
    super.update(dt);
  }

  @override
  void onCollision(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Wall01) {
      position.y -= 3;
      // other.removeFromParent();
    }

    super.onCollision(intersectionPoints, other);
  }
}
