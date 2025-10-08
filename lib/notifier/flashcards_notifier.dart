import 'package:flutter/cupertino.dart';

class FlashcardNotiFier extends ChangeNotifier {

  String topic = "";

  setTopic({required String topic}) {

    this.topic = topic;
    notifyListeners();
  }

  bool flipcard1 = false, flipcard2 = false;

  runFlipCard1() {
    flipcard1 = true;
    notifyListeners();
  }
  runFlipCard2() {
    flipcard2 = true;
    notifyListeners();
  }

}