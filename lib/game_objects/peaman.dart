import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:snowballer/flame_game/snowballer_game.dart';

class Peaman extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<SnowballerGame> {
  Peaman({
    required super.position,
  }) : super(
          size: Vector2.all(48),
          anchor: Anchor.topLeft,
        );

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
      game.images.fromCache('peaman.png'),
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
}
