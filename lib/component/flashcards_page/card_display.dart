import 'package:flutter/material.dart';
import 'package:flutter_flashcard/component/flashcards_page/tts_button.dart';
import 'package:flutter_flashcard/notifier/flashcards_notifier.dart';
import 'package:provider/provider.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({super.key, required this.isCard1});

  final bool isCard1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<FlashcardNotiFier>(
        builder: (_, notifier, __) => isCard1
            ? Column(
                children: [
                  buildImage(notifier.word1.english),
                  buildTextBox(notifier.word1.english, context, 1),
                ],
              )
            : Column(
                children: [
                  buildImage(notifier.word2.english),
                  buildTextBox(notifier.word2.character, context, 2),
                  buildTextBox(notifier.word2.vietnamese, context, 1),
                  TTSButton(),
                ],
              ),
      ),
    );
  }

  Expanded buildTextBox(String text, BuildContext context, int flex) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FittedBox(
          child: Text(text, style: Theme.of(context).textTheme.displayLarge),
        ),
      ),
    );
  }

  Expanded buildImage(String image) {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Image.asset('assets/images/${image}.png'),
      ),
    );
  }
}
