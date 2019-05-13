import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

void openDropdown(BuildContext appContext, Widget button, double buttonX, double buttonY, double width, List<DropdownItem> items) {
  Navigator.push(appContext, PageRouteBuilder(
    opaque: false,
    transitionDuration: Duration.zero,
    pageBuilder: (BuildContext context, _, __) {
      return DropdownButton(button: button, width: width, buttonX: buttonX, buttonY: buttonY, children: items);
    }
  ));
}

class DropdownButton extends StatefulWidget {
  final Widget button;
  final double buttonX;
  final double buttonY;
  final List<DropdownItem> children;
  final int maxVisibleChildren;
  final double width;

  DropdownButton({this.button, this.width, this.children, this.buttonX, this.buttonY, this.maxVisibleChildren = 99}) : super();

  @override
  DropdownButtonState createState() {
    return DropdownButtonState();
  }
}

class DropdownButtonState extends State<DropdownButton> with TickerProviderStateMixin {

  AnimationController controller;
  Animation animation;
  static final Animatable<Offset> tween = Tween<Offset>(
    begin: Offset(0, -50),
    end: Offset.zero
  );

  bool goQuit = false;
  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
      duration: new Duration(milliseconds: 200),
      vsync: this,
    )..addStatusListener((status){
      if (goQuit && !controller.isAnimating) {
        quit();
      }
    });
    animation = new CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut
    )..addListener(() {
      setState((){});
    });

    controller.forward(); //start animation on load
  }

  void prepareQuit() {
    goQuit = true;
    controller.reverse();
  }

  void quit() {
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: prepareQuit,
      child: Stack(
        children: <Widget>[
          FadeTransition(
            opacity: animation,
            child: Container(
              decoration: BoxDecoration(
                color: MiruColors.overlay
              )
            )
          ),
          Positioned(
            left: widget.buttonX,
            top: widget.buttonY,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                widget.button,
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: FadeTransition(
                    opacity: animation,
                    child: Transform.translate(
                      offset: tween.evaluate(animation),
                      child: Container(
                        width: widget.width,
                        decoration: BoxDecoration(
                          color: MiruColors.component,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          children: widget.children
                        )
                      )
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
  final onTap;

  DropdownItem({this.text, this.onTap}) : super();

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Text(text, style: MiruText.text)
      )
    );
  }

}