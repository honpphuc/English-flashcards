import 'package:flutter/material.dart';
import 'package:flutter_flashcard/enums/language_type.dart';
import 'package:flutter_flashcard/notifier/flashcards_notifier.dart';
import 'package:flutter_flashcard/notifier/settings_notifier.dart';
import 'package:flutter_flashcard/pages/flashcards_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

extension LanguageSymbol on LanguageType {
  String toSymbol() {
    switch (this) {
      case LanguageType.image:
        return '🖼️';
      case LanguageType.english:
        return '🇬🇧';
      case LanguageType.character:
        return 'VN';
      case LanguageType.vietnamese:
        return '🇻🇳';
    }
  }
}

updatePreferencesOnRestart({required BuildContext context}) {
  final settingsNotifier = Provider.of<SettingsNotifier>(
    context,
    listen: false,
  );
  for (var e in settingsNotifier.displayOptions.entries) {
    SharedPreferences.getInstance().then((prefs) {
      final reusult = prefs.getBool(e.key.name);
      if (reusult != null) {
        settingsNotifier.displayOptions.update(e.key, (value) => reusult);
      }
    });
  }
}

clearPreferences() {
  SharedPreferences.getInstance().then((prefs) {
    for (var e in SettingsNotifier().displayOptions.entries) {
      prefs.remove(e.key.name);
    }
  });
}
