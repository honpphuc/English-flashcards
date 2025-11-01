import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flashcard/component/app/custom_appbar.dart';
import 'package:flutter_flashcard/notifier/settings_notifier.dart';
import 'package:provider/provider.dart';

import '../component/settings/settings_title.dart';
import '../component/settings/switch_button.dart';
import '../configs/constants.dart';
import '../enums/settings.dart';

class SettingsPages extends StatefulWidget {
  const SettingsPages({super.key});

  @override
  State<SettingsPages> createState() => _SettingsPagesState();
}

class _SettingsPagesState extends State<SettingsPages> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsNotifier>(
      builder:(_, notifier, __) {

        bool audioFirst = notifier.displayOptions.entries
            .firstWhere((element) => element.key == Settings.audioOnly)
            .value;
        return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kAppBarHeight),
          child: CustomAppBar(),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SwitchButton(disasble: audioFirst, displayOption: Settings.englishFirst,),
                SwitchButton(displayOption: Settings.showVietnamese,),
                SwitchButton(displayOption: Settings.audioOnly,),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SettingsTitle(title: 'Reset', icon: Icon(Icons.refresh), callback: (){
                  notifier.resetSettings();
                },),
                SettingsTitle(title: 'Exit App', icon: Icon(Icons.exit_to_app), callback: (){
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },),
              ],
            )
          ],
        ),
      );
      },
    );
  }
}




