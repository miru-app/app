import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class SettingsItem extends StatelessWidget  {
  final String text;
  final Widget child;

  SettingsItem({ this.text, this.child });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 46,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(text, style: MiruText.emphasis)
          ),
          child
        ],
      )
    );

  }
}