import 'package:flutter/material.dart';
import 'package:flutter_flashcard/enums/language_type.dart';

class LanguageButtonNotifier extends ChangeNotifier {
  bool showImage = true,
      showEnglish = true,
      showCharacter = false,
      showVietnamese = false;
  updateShowLanguage({required LanguageType language}) {
    switch (language) {
      case LanguageType.image:
        showImage = !showImage;
        break;
      case LanguageType.english:
        showEnglish = !showEnglish;
        break;
      case LanguageType.character:
        showCharacter = !showCharacter;
        break;
      case LanguageType.vietnamese:
        showVietnamese = !showVietnamese;
        break;
    }
    notifyListeners();
  }
}
