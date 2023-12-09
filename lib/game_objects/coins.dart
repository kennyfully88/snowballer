import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:snowballer/flame_game/snowballer_game.dart';

class Coins extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<SnowballerGame> {
  Coins({
    required super.position,
  }) : super(
          size: Vector2.all(48),
          anchor: Anchor.topLeft,
        );

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

    add(
      RectangleHitbox(),
    );
  }
}
