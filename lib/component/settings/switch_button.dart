import 'package:flutter/material.dart';
import 'package:flutter_flashcard/utlis/methods.dart';
import 'package:provider/provider.dart';

import '../../enums/settings.dart';
import '../../notifier/settings_notifier.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    required this.displayOption,
    this.disasble = false,
    super.key,
  });
  final Settings displayOption;
  final bool disasble;
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
      builder: (_, notifier, __) => Column(
        children: [
          SwitchListTile(
            inactiveThumbColor: Colors.black.withOpacity(0.50),
            tileColor: disasble
                ? Colors.black.withOpacity(0.10)
                : Colors.transparent,
            title: Text(displayOption.toText()),
            value: notifier.displayOptions.entries
                .firstWhere((element) => element.key == displayOption)
                .value,
            onChanged: disasble
                ? null
                : (value) {
                    notifier.updateDisplayOption(
                      displayOption: displayOption,
                      isToggled: value,
                    );
                  },
          ),
          Divider(height: 1, thickness: 1,)
        ],
      ),
    );
  }
}
