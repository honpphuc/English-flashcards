
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../animations/half_flip_animation.dart';
import '../../animations/slide_animation.dart';
import '../../configs/constants.dart';
import '../../enums/slide_direction.dart';
import '../../notifier/flashcards_notifier.dart';
import 'card_display.dart';

class Card1 extends StatelessWidget {
  const Card1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardNotiFier>(
      builder:(_, notifier, __) => GestureDetector(
        onDoubleTap: (){
          notifier.runFlipCard1();
          notifier.setIgnoreTouches(ignore: true);
        },
        child: HalfFlipAnimation(
          animate: notifier.flipcard1,
          reset: notifier.resetFlipCard1,
          flipFromHalfWay: false,
          animationCompleted: (){
            notifier.resetCard1();
            notifier.runFlipCard2();
          },
          child: SlideAnimation(
            animationDuration: 1000,
            animationDelay: 200,
            animationCompleted: (){
              notifier.setIgnoreTouches(ignore: false);
            },
            reset: notifier.resetSlideCard1,
            animate: notifier.slidecard1,
            direction: SlideDirection.upIn,
            child: Center(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kCircularBorderRadius),
                  border: Border.all(
                    color: Colors.blueGrey,
                    width: kCardBorderWidth,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: CardDisplay(isCard1: true,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


