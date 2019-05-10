import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

void openDropdown(BuildContext appContext, Widget button, double buttonX, double buttonY) {
  Navigator.push(appContext, PageRouteBuilder(
    opaque: false,
    pageBuilder: (BuildContext context, _, __) {
      return DropdownButton(button: button, buttonX: buttonX, buttonY: buttonY);
    }
  ));
}

class DropdownButton extends StatelessWidget {
  final Widget button;
  final double buttonX;
  final double buttonY;
  final List<DropdownItem> children;
  final int maxVisibleChildren;

  DropdownButton({this.button, this.children, this.buttonX, this.buttonY, this.maxVisibleChildren = 99}) : super();

  Widget build(BuildContext context) {
    return Container(
      color: MiruColors.overlay,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: buttonX,
            top: buttonY,
            child: Column(
              children: <Widget>[
                button
              ],
            )
          )
        ]
      )
    );
  }

}

class DropdownItem extends StatelessWidget {
  final Widget button;
  final List<DropdownItem> children;

  DropdownItem({this.button, this.children}) : super();

  Widget build(BuildContext context) {
    return Container(
      color: MiruColors.overlay,
      child: Stack(
        children: <Widget>[

        ],
      )
    );
  }

}