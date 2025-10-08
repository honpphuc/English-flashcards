import 'package:flutter/cupertino.dart';

class FlashcardNotiFier extends ChangeNotifier {

  String topic = "";

  setTopic({required String topic}) {

    this.topic = topic;
    notifyListeners();
  }

}