import 'package:app/widgets/dropdown.dart';
import 'package:app/widgets/page.dart';
import 'package:flutter/widgets.dart';
import 'package:app/assets.dart';

class SettingsPage extends StatelessWidget  {
  final String title;
  final BuildContext appContext;

  final GlobalKey buttonkey = GlobalKey();

  SettingsPage({this.appContext, this.title});

  @override
  Widget build(BuildContext context) {
    final button = Text('dropdown', // button with key, on settings page
      key: buttonkey
    );
    final buttontwo = Text('dropdown'); // button without key, to use for the dropdown overlay

    return Container( // page itself
      color: MiruColors.dark,
      child: ListView( // list so the page can scroll
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          PageTitleDetailed('Settings','Configure your player'),
          GestureDetector(
            onTap: () {
              final RenderBox box = buttonkey.currentContext.findRenderObject();
              Offset buttonOffset = box.localToGlobal(Offset.zero);

              openDropdown(
                appContext,
                buttontwo,
                buttonOffset.dx,
                buttonOffset.dy,
                [DropdownItem(text: 'item 1'),
                DropdownItem(text: 'item 2')]
              );
            },
            child: button
          )
        ]
      )
    );
  }
}