import 'package:app/widgets/button.dart';
import 'package:app/widgets/dropdown.dart';
import 'package:app/widgets/page.dart';
import 'package:app/widgets/settings_section_title.dart';
import 'package:app/widgets/settingsitem.dart';
import 'package:app/widgets/toggle.dart';
import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';
import 'package:app/util/database.dart' as database;

class SettingsPage extends StatelessWidget  {
  final String title;
  final BuildContext appContext;

  final GlobalKey buttonkey = GlobalKey();

  SettingsPage({this.appContext, this.title});

  @override
  Widget build(BuildContext context) { // button without key, to use for the dropdown overlay
    return Container( // page itself
      color: MiruColors.dark,
      child: ListView( // list so the page can scroll
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          PageTitleDetailed('Settings', 'Configure Miru'),
          SettingsSectionTitle('Account Sync'),
          SettingsItem(
            text: 'Replace This With Google Login Button',
            child: Toggle(true)
          ),
          SettingsSectionTitle('Playback Settings'),
          SettingsItem(
            text: 'Preffered provider',
            child: DropdownContainer(
              builder: (Key key, Animation animation, String selected, Function onTap) {
                return Button(key: key, animation: animation, onTap: onTap, dropdown: true, text: selected);
              },
              appContext: appContext,
              dropdown: [
                DropdownItem(text: 'Openload'),
                DropdownItem(text: 'Rapidvideo'),
                DropdownItem(text: 'StreamMango')
              ]
            )
          ),
          SettingsItem(
            text: 'A toggle thats off',
            child: Toggle(false)
          ),
          SettingsItem(
            text: 'An active toggle',
            child: Toggle(true)
          ),
          SettingsSectionTitle('UI Settings'),
          SettingsItem(
            text: 'Some UI Setting',
            child: Toggle(true)
          ),
        ]
      )
    );
  }
}