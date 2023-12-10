import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:snowballer/flame_game/snowballer_game.dart';

class Lava extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<SnowballerGame> {
  Lava({
    required super.position,
  }) : super(
          size: Vector2.all(48),
          anchor: Anchor.topLeft,
        );

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('lava.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2.all(16),
        stepTime: 0.5,
      ),
    );

    add(
      RectangleHitbox(),
    );
  }
}
