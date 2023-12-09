import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:snowballer/flame_game/snowballer_game.dart';

class Wall01 extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<SnowballerGame> {
  Wall01({
    required super.position,
  }) : super(
          size: Vector2.all(48),
          anchor: Anchor.topLeft,
        );

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

    add(
      RectangleHitbox.relative(
        parentSize: Vector2.all(16),
        Vector2.all(0.9),
      ),
    );
  }
}
