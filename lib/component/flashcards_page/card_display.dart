import 'package:flutter/material.dart';
import 'package:flutter_flashcard/component/flashcards_page/tts_button.dart';
import 'package:flutter_flashcard/notifier/flashcards_notifier.dart';
import 'package:flutter_flashcard/notifier/settings_notifier.dart';
import 'package:provider/provider.dart';

import '../../enums/settings.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({super.key, required this.isCard1});

  final bool isCard1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Consumer<SettingsNotifier>(
        builder: (_, notifier, __) {
          final setEnglishFirst = notifier.displayOptions.entries
              .firstWhere((element) => element.key == Settings.englishFirst)
              .value;
          final showVietnamese = notifier.displayOptions.entries
              .firstWhere((element) => element.key == Settings.showVietnamese)
              .value;
          final audioOnly = notifier.displayOptions.entries
              .firstWhere((element) => element.key == Settings.audioOnly)
              .value;
          return Consumer<FlashcardNotiFier>(
            builder: (_, notifier, __) => isCard1
                ? Column(
                    children: [
                      if(audioOnly) ... [
                        TTSButton()
                      ] else if(showVietnamese) ... [
                        buildTextBox(notifier.word1.character, context, 3),
                        showVietnamese ? buildTextBox(notifier.word1.vietnamese, context, 1) : SizedBox(),
                      ] else ... [
                        buildImage(notifier.word1.english),
                        buildTextBox(notifier.word1.english, context, 1),
                      ]
                    ],
                  )
                : Column(
                    children: [
                      if(audioOnly) ... [
                        buildImage(notifier.word2.english),
                        buildTextBox(notifier.word2.english, context, 2),
                        buildTextBox(notifier.word2.character, context, 2),
                        showVietnamese ? buildTextBox(notifier.word2.vietnamese, context, 1) : SizedBox(),
                        TTSButton(),
                      ] else if(showVietnamese) ... [
                        buildImage(notifier.word2.english),
                        buildTextBox(notifier.word2.english, context, 2),
                        TTSButton(),
                      ] else ... [
                        buildImage(notifier.word2.english),
                        buildTextBox(notifier.word2.character, context, 2),
                        showVietnamese ? buildTextBox(notifier.word2.vietnamese, context, 1) : SizedBox(),
                      ]
                    ],
                  ),
          );
        },
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
        child: Image.asset('assets/images/$image.png'),
      ),
    );
  }
}
