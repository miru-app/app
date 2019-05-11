import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

void openDropdown(BuildContext appContext, Widget button, double buttonX, double buttonY, double width, List<DropdownItem> items) {
  Navigator.push(appContext, PageRouteBuilder(
    opaque: false,
    pageBuilder: (BuildContext context, _, __) {
      return DropdownButton(button: button, width: width, buttonX: buttonX, buttonY: buttonY, children: items);
    }
  ));
}

class DropdownButton extends StatelessWidget {
  final Widget button;
  final double buttonX;
  final double buttonY;
  final List<DropdownItem> children;
  final int maxVisibleChildren;
  final double width;

  DropdownButton({this.button, this.width, this.children, this.buttonX, this.buttonY, this.maxVisibleChildren = 99}) : super();

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
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
                      width: width,
                      decoration: BoxDecoration(
                        color: MiruColors.component,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8),
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
      )
    );
  }

}

class DropdownItem extends StatelessWidget {
  final String text;
  final onTap;

  DropdownItem({this.text, this.onTap}) : super();

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTap();
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(text, style: MiruText.text)
      )
    );
  }

}