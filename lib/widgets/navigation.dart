import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class BottomBar extends StatefulWidget {
  final onTap;

  BottomBar({this.onTap});

  @override
  BottomBarState createState() {
    return BottomBarState();
  }
}

class BottomBarState extends State<BottomBar> {
  var onTap;

  @override
  void initState() {
    this.onTap = widget.onTap;
    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {
    return Container(
      color: MiruColors.dark,
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: () => {
                onTap(0)
              },
              child: Text('switch0')
            )
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => {
                onTap(1)
              },
              child: Text('switch1')
            )
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => {
                onTap(2)
              },
              child: Text('switch2')
            )
          )
        ],
      )
    );
  }

}