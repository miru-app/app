import 'package:app/widgets/button.dart';
import 'package:app/widgets/dropdown.dart';
import 'package:app/widgets/page.dart';
import 'package:app/widgets/settingsitem.dart';
import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';

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
          PageTitleDetailed('Settings','Configure your player'),
          SettingsItem(
            text: 'Preffered provider',
            child: Button(
              onTap: () {
                final RenderBox box = buttonkey.currentContext.findRenderObject();
                Offset buttonOffset = box.localToGlobal(Offset.zero);

                openDropdown(
                  appContext,
                  Button(text: 'Openload'),
                  buttonOffset.dx,
                  buttonOffset.dy,
                  Button.width,
                  [DropdownItem(
                    text: 'Openload',
                    onTap: () {
                      print('pressed item 1');
                    }),
                  DropdownItem(
                    text: 'Rapidvideo',
                    onTap: () {
                      print('pressed item 2');
                    })
                  ]
                );
              },
              text: 'Openload',
              key: buttonkey
            )
          )
        ]
      )
    );
  }
}