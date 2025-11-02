import 'package:flutter/material.dart';
import 'package:flutter_flashcard/enums/language_type.dart';
import 'package:flutter_flashcard/notifier/language_button_notifier.dart';
import 'package:flutter_flashcard/utlis/methods.dart';
import 'package:provider/provider.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({required this.languageType, super.key});

  final LanguageType languageType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 1, 6, 1),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Provider.of<LanguageButtonNotifier>(context, listen: false)
                  .updateShowLanguage(language: languageType);
            }, child: Text(languageType.toSymbol())),
      ),
    );
  }
}
