import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../enums/settings.dart';
import '../utlis/methods.dart';

class SettingsNotifier extends ChangeNotifier {
  Map<Settings, bool> displayOptions = {
    Settings.englishFirst: true,
    Settings.showVietnamese: true,
    Settings.audioOnly: false,
  };
  updateDisplayOption({
    required Settings displayOption,
    required bool isToggled,
  }) {
    displayOptions.update(displayOption, (value) => isToggled);
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(displayOption.name, isToggled);
    });
    notifyListeners();
  }

  resetSettings() {
    displayOptions.update(Settings.englishFirst, (value) => true);
    displayOptions.update(Settings.showVietnamese, (value) => true);
    displayOptions.update(Settings.audioOnly, (value) => false);
    clearPreferences();
    notifyListeners();
  }
}
