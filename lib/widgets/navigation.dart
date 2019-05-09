import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class BottomBar extends StatefulWidget {
  final onTap;
  final selected;

  BottomBar({this.onTap, this.selected});

  @override
  BottomBarState createState() {
    return BottomBarState();
  }
}

class BottomBarState extends State<BottomBar> {
  var onTap;
  int selected;

  @override
  void initState() {
    this.onTap = widget.onTap;
    this.selected = widget.selected;
    super.initState();
  }

  void changeTab(int index) {
    if (!this.onTap(index)) return; //unsuccessfull change, dont move the selected index.
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext ctx) {
    return Container(
      color: MiruColors.dark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () { changeTab(1); },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                MiruIcons.heart_filled,
                color: selected == 1 ? MiruColors.action : MiruColors.textmuted
              )
            )
          ),
          GestureDetector(
            onTap: () { changeTab(2); },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                MiruIcons.search,
                color: selected == 2 ? MiruColors.action : MiruColors.textmuted
              )
            )
          ),
          GestureDetector(
            onTap: () { changeTab(3); },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                MiruIcons.folder,
                color: selected == 3 ? MiruColors.action : MiruColors.textmuted
              )
            )
          ),
          GestureDetector(
            onTap: () { changeTab(4); },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                MiruIcons.settings,
                color: selected == 4 ? MiruColors.action : MiruColors.textmuted
              )
            )
          ),
          GestureDetector(
            onTap: () { changeTab(5); },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                MiruIcons.heart_filled,
                color: selected == 5 ? MiruColors.action : MiruColors.textmuted
              )
            )
          )
        ]
      )
    );
  }

}