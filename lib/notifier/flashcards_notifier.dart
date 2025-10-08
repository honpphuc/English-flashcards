import 'package:flutter/cupertino.dart';
import 'package:flutter_flashcard/enums/slide_direction.dart';

class FlashcardNotiFier extends ChangeNotifier {

  String topic = "";

  setTopic({required String topic}) {

    this.topic = topic;
    notifyListeners();
  }

  SlideDirection swipedDirection = SlideDirection.none;

  bool flipcard1 = false, flipcard2 = false, swipeCard2 = false;

  runFlipCard1() {
    flipcard1 = true;
    notifyListeners();
  }
  runFlipCard2() {
    flipcard2 = true;
    notifyListeners();
  }

  runSwipeCard2({required SlideDirection direction}) {
    swipedDirection = direction;
    swipeCard2 = true;
    notifyListeners();
  }
}