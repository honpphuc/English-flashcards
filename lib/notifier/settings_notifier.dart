import 'package:flutter/material.dart';

import '../enums/settings.dart';

class SettingsNotifier extends ChangeNotifier{
  Map <Settings, bool> displayOptions = {
    Settings.englishFirst : true,
    Settings.showVietnamese : true,
    Settings.audioOnly : false,
  };
  updateDisplayOption({required Settings displayOption, required bool isToggled}){
    displayOptions.update(displayOption, (value) => isToggled);
    notifyListeners();
  }
  resetSettings(){
    displayOptions.update(Settings.englishFirst, (value) => true);
    displayOptions.update(Settings.showVietnamese, (value) => true);
    displayOptions.update(Settings.audioOnly, (value) => false);
    notifyListeners();
  }
}