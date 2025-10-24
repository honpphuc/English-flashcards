
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_flashcard/component/flashcards_page/card_display.dart';
import 'package:flutter_flashcard/configs/constants.dart';
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
        onHorizontalDragEnd: (details){

          if(details.primaryVelocity! > 100) {
            notifier.runSwipeCard2(direction: SlideDirection.rightAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouches(ignore: true);
            notifier.generateCurrentWord();
          }
          if(details.primaryVelocity! < 100) {
            notifier.runSwipeCard2(direction: SlideDirection.leftAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouches(ignore: true);
            notifier.generateCurrentWord();
          }
        },
        child: HalfFlipAnimation(
          animate: notifier.flipcard2,
          reset: notifier.resetFlipCard2,
          flipFromHalfWay: true,
          animationCompleted: (){
            notifier.setIgnoreTouches(ignore: false);
          },
          child: SlideAnimation(
            animationDuration: 1000,
            animationDelay: 200,
            animationCompleted: (){
              notifier.resetCard2();
            },
            reset: notifier.resetSwipeCard2,
            animate: notifier.swipeCard2,
            direction: notifier.swipedDirection,
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
                child: Transform(
                  alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: CardDisplay(isCard1: false)
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}
