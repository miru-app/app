import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

void openDropdown(BuildContext appContext, Widget button, double buttonX, double buttonY, List<DropdownItem> items) {
  Navigator.push(appContext, PageRouteBuilder(
    opaque: false,
    pageBuilder: (BuildContext context, _, __) {
      return DropdownButton(button: button, buttonX: buttonX, buttonY: buttonY, children: items);
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                button,
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: MiruColors.component,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      children: this.children
                    )
                  )
                )
              ],
            )
          )
        ]
      )
    );
  }

}

class DropdownItem extends StatelessWidget {
  final String text;

  DropdownItem({this.text}) : super();

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Text(text, style: MiruText.subtitle)
    );
  }

}