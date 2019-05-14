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

  void select(int i) {
    print('pressed item');
    prepareQuit();
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
              verticalDirection: VerticalDirection.up, // button goes on top, making the dropdown slide from below
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: List.generate(widget.children.length, (int i) {
                            return GestureDetector(
                              onTap: () {
                                select(i);
                              },
                              child: widget.children[i]
                            );
                          })
                        )
                      )
                    )
                  )
                ),
                widget.button
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
      color: MiruColors.component, //add color so its hitbox is larger
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Text(text, style: MiruText.text)
      )
    );
  }

}