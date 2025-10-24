import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_flashcard/configs/constants.dart';
import 'package:flutter_flashcard/data/words.dart';
import 'package:flutter_flashcard/enums/slide_direction.dart';
import 'package:flutter_flashcard/models/word.dart';

class FlashcardNotiFier extends ChangeNotifier {

  String topic = "";
  Word word1 = Word(topic: "", english: "Loading Arrow", character: "", vietnamese: "");
  Word word2 = Word(topic: "", english: "Loading Arrow", character: "", vietnamese: "");
  List<Word> selectedWords = [];

  setTopic({required String topic}) {

    this.topic = topic;
    notifyListeners();
  }

  generateAllSelectedWords(){
    selectedWords.clear();
    selectedWords = words.where((element) => element.topic == topic).toList();
  }

  generateCurrentWord(){
    if(selectedWords.isNotEmpty) {
      final r = Random().nextInt(selectedWords.length);
      word1 = selectedWords[r];
      selectedWords.removeAt(r);
    }else {
      print("all words selected");
    }
    Future.delayed(const Duration(milliseconds: kSlideAwayDuration),(){
      word2 = word1;
    });
  }

  bool ignoreTouchers = true;

  setIgnoreTouches({required bool ignore}){
    ignoreTouchers = ignore;
    notifyListeners();
  }

  SlideDirection swipedDirection = SlideDirection.none;

  bool slidecard1 = false, flipcard1 = false, flipcard2 = false, swipeCard2 = false;

  bool resetSlideCard1 = false, resetFlipCard1 = false, resetFlipCard2 = false, resetSwipeCard2 = false;

  runSlideCard1(){
    resetSlideCard1 = false;
    slidecard1 = true;
    notifyListeners();
  }

  runFlipCard1() {
    resetFlipCard1 = false;
    flipcard1 = true;
    notifyListeners();
  }

  resetCard1(){
    resetSlideCard1 = true;
    resetFlipCard1 = true;
    slidecard1 = false;
    flipcard1 = false;
  }

  runFlipCard2() {
    resetFlipCard2 = false;
    flipcard2 = true;
    notifyListeners();
  }

  runSwipeCard2({required SlideDirection direction}) {
    swipedDirection = direction;
    resetSwipeCard2 = false;
    swipeCard2 = true;
    notifyListeners();
  }
  resetCard2(){
    resetSwipeCard2 = true;
    resetFlipCard2 = true;
    swipeCard2 = false;
    flipcard2 = false;
  }
}