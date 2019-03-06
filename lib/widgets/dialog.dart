import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';

class MiruDialog extends StatefulWidget {
  final Text content;

	MiruDialog({this.content}) : super();

  @override
  State<StatefulWidget> createState() => MiruDialogState();
}

class MiruDialogState extends State<MiruDialog> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacityAnimation;
  Animation<double> scaleAnimatoin;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.4).animate(CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    scaleAnimatoin = CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {
      });
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 100),
      child: Center(
        child: ScaleTransition(
          scale: scaleAnimatoin,
          child: Container(
            decoration: ShapeDecoration(
                color: Color.fromARGB(0, 0, 0, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: widget.content,
            ),
          ),
        ),
      ),
    );
  }
}