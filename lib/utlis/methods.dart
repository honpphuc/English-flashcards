import 'package:flutter/material.dart';
import 'package:flutter_flashcard/notifier/flashcards_notifier.dart';
import 'package:flutter_flashcard/pages/flashcards_page.dart';
import 'package:provider/provider.dart';

import '../enums/settings.dart';

loadSession({required BuildContext context, required String topic}) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => FlashcardsPage()));
  Provider.of<FlashcardNotiFier>(context, listen: false).setTopic(topic: topic);
}

extension SettingsToText on Settings {
  String toText() {
    switch (this) {
      case Settings.englishFirst:
        return 'Show English First';
      case Settings.showVietnamese:
        return 'Show Vietnamese';
      case Settings.audioOnly:
        return 'Test Listening';
    }
  }
}
