import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class SettingsSectionTitle extends StatelessWidget  {
  final String title;

  SettingsSectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Text(title, style: MiruText.subtitle),
    );
  }
}