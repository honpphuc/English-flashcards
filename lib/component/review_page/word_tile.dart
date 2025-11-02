
import 'package:flutter/material.dart';
import 'package:flutter_flashcard/component/app/tts_button.dart';
import 'package:flutter_flashcard/notifier/language_button_notifier.dart';
import 'package:provider/provider.dart';

import '../../models/word.dart';

class WordTile extends StatelessWidget {
  WordTile({required this.word, required this.animation,this.onPressed, super.key, required this.index});

  final Word word;

  final _tweenOffsetLeft = Tween<Offset>(
    begin: Offset(-1.0, 0.0),
    end: Offset.zero,
  );
  final _tweenOffsetRight = Tween<Offset>(
    begin: Offset(1.0, 0.0),
    end: Offset.zero,
  );

  final VoidCallback? onPressed;

  final Animation animation;

  final int index;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(CurveTween(curve: Curves.easeInOutSine)).drive(
          index % 2 == 0 ? _tweenOffsetRight : _tweenOffsetLeft),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 3, 8, 6),
        child: Consumer<LanguageButtonNotifier>(
          builder:(_, notifier, __) => ListTile(
            leading: notifier.showImage ? SizedBox(
                width: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/${word.english}.png'),
                )) : SizedBox(),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  notifier.showEnglish ? Text(word.english) : SizedBox(),
                  notifier.showCharacter ?Text(word.character) : SizedBox(),
                  notifier.showVietnamese ?Text(word.vietnamese) : SizedBox(),
                ],
              ),
              trailing: SizedBox(
                width: 80,
                child: Row(
                  children: [
                    TTSButton(word: word, iconSize: 25,),
                    Expanded(
                      child: IconButton(onPressed: (){
                        onPressed?.call();
                      }, icon: Icon(Icons.clear)),
                    ),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}