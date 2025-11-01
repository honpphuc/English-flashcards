import 'package:flutter/material.dart';
import 'package:flutter_flashcard/utlis/methods.dart';
import 'package:provider/provider.dart';

import '../../enums/settings.dart';
import '../../notifier/settings_notifier.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({ required this.displayOption,
    super.key,
  });
  final Settings displayOption;
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
      builder: (_, notifier, __) => SwitchListTile(
        title: Text(displayOption.toText()),
        value: notifier.displayOptions.entries
            .firstWhere((element) => element.key == displayOption)
            .value,
        onChanged: (value) {
          notifier.updateDisplayOption(
            displayOption: displayOption,
            isToggled: value,
          );
        },
      ),
    );
  }
}