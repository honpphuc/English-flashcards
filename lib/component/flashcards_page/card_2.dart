
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../animations/half_flip_animation.dart';
import '../../animations/slide_animation.dart';
import '../../enums/slide_direction.dart';
import '../../notifier/flashcards_notifier.dart';

class Card2 extends StatelessWidget {
  const Card2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardNotiFier>(
      builder:(_, notifier, __) => GestureDetector(
        child: HalfFlipAnimation(
          animate: notifier.flipcard2,
          reset: false,
          flipFromHalfWay: true,
          animationComplete: (){
            print('anim 2 flip completed');
          },
          child: SlideAnimation(
            direction: SlideDirection.leftIn,
            child: Center(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.7,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
