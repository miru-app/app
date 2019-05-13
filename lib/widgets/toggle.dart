import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class Toggle extends StatefulWidget {
  final bool isOn;

  Toggle(this.isOn);

  @override
  ToggleState createState() {
    return ToggleState();
  }
}

class ToggleState extends State<Toggle> with TickerProviderStateMixin {

  AnimationController controller;
  Animation animation;
  static final Animatable<Offset> tween = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(31, 0) // width - height
  );

  bool state = false;
  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
      duration: new Duration(milliseconds: 200),
      vsync: this,
    );

    animation = new CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut
    )..addListener(() {
      setState((){});
    });

    if (widget.isOn) {
      state = true;
      controller.value = controller.upperBound; // sets animation on completed state
    }
  }

  void changeToggle(bool newState) {
    if (state == newState) return;
    else if (newState) controller.forward();
    else controller.reverse();
    state = newState;
  }

  void toggle() {
    changeToggle(!state);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: Container(
        height: 29,
        width: 60,
        decoration: BoxDecoration(
          color: MiruColors.component,
          borderRadius: BorderRadius.circular(500)
        ),
        child: Stack(
          children: <Widget>[
            FadeTransition(
              opacity: animation,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      MiruColors.gradienttop,
                      MiruColors.gradientbottom
                    ]
                  ),
                  borderRadius: BorderRadius.circular(500)
                ),
              ),
            ),
            Transform.translate(
              offset: tween.evaluate(animation),
              child: Container(
                decoration: BoxDecoration(
                  color: MiruColors.textemphasis,
                  borderRadius: BorderRadius.circular(500)
                ),
                margin: EdgeInsets.all(4),
                height: 21,
                width: 21
              )
            )
          ]
        )
      )
    );
  }

}