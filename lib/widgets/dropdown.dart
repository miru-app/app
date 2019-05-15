import 'package:app/assets.dart';
import 'package:app/widgets/button.dart';
import 'package:flutter/widgets.dart';

class DropdownButton extends StatefulWidget {
  final Widget button;
  final double buttonX;
  final double buttonY;
  final List<DropdownItem> children;
  final int maxVisibleChildren;
  final double width;
  final Function(int) onChange;
  final Function onToggle;

  DropdownButton({this.button, this.width, this.children, this.buttonX, this.buttonY, this.onChange, this.onToggle, this.maxVisibleChildren = 99}) : super();

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
    widget.onToggle();
  }

  void prepareQuit() {
    goQuit = true;
    controller.reverse();
    widget.onToggle();
  }

  void quit() {
    Navigator.pop(context);
  }

  void select(int i) {
    widget.onChange(i);
    prepareQuit();
  }
  Widget build(BuildContext context) {
    List<Widget> list = [];
    widget.children.forEach((DropdownItem item) {
      if (item == null) return;
      return list.add(GestureDetector(
        onTap: () {
          select(widget.children.indexOf(item));
        },
        child: item
      ));
    });

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
                          children: list
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

class DropdownContainer extends StatefulWidget {
  final Function(Key, Animation, String, Function) builder; // key for button, onTap(Widget button) for button
  final List<DropdownItem> dropdown;
  final BuildContext appContext;
  final int index;

  DropdownContainer({this.builder, this.dropdown, this.appContext, this.index = 0});

  @override
  DropDownContainerState createState() => DropDownContainerState();

}

class DropDownContainerState extends State<DropdownContainer> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;
  int index;

  @override
  void initState() {
    super.initState();
    index = widget.index;
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
  }
       
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();

    // button used to render dropdown
    Button renderButton = widget.builder(Key('testing'), animation, widget.dropdown[index].text, null);

    // button used on settings page
    Button button = widget.builder(key, animation, widget.dropdown[index].text, (Button button) {
      final RenderBox box = key.currentContext.findRenderObject(); // find render object
      Offset buttonOffset = box.localToGlobal(Offset.zero); // get global offset coords to position dropdown
      List<Widget> children = widget.dropdown.toList();
      children[index] = null; // remove current item from the list

      // open dropdown
      Navigator.push(widget.appContext, PageRouteBuilder(
        opaque: false,
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) {
          return DropdownButton(
            button: renderButton,
            width: 130,
            buttonX: buttonOffset.dx,
            buttonY: buttonOffset.dy,
            children: children,
            onChange: (int i) {
              setState(() {
                index = i;
              });
            },
            onToggle: () {
              if (controller.isCompleted) controller.reverse();
              else controller.forward();
            }
          );
        }
      ));
    });
    
    return button;
  }

}