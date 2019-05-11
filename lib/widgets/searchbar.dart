import 'dart:ui';

import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatefulWidget {
  final onEdit;

  SearchBar({this.onEdit});

  @override
  SearchBarState createState() => new SearchBarState();
}

class SearchBarState extends State<SearchBar> with TickerProviderStateMixin  {
  final TextEditingController textController = new TextEditingController();
  final FocusNode focusNode = new FocusNode();
  
  bool hasText = false;
  AnimationController controller;
  Animation<Offset> position;
  Animation<double> barWidth;
  static final Animatable<Offset> tween = Tween<Offset>(
    begin: const Offset(1.0, 0),
    end: Offset.zero,
  ).chain(CurveTween(
    curve: Curves.ease,
  ));
  static final Animatable<double> widthTween = Tween<double>(
    begin: 0,
    end: 75, // size of cancel button with padding
  ).chain(CurveTween(
    curve: Curves.ease,
  ));

  @override
  void initState() {
    super.initState();
    textController.addListener(() {
      widget.onEdit(textController.text);

      if (textController.text != '') {
          setState(() {  
            hasText = true;
          });
          controller.forward();
      } else {
        setState(() {  
          hasText = false;
        });
        controller.reverse();
      }
    });

    controller = AnimationController( // animation controller handles all animations
      duration: const Duration(milliseconds: 200), // duration of the transition
      vsync: this
    );

    position = controller.drive(tween);
    barWidth = widthTween.animate(CurvedAnimation(
      parent: controller,
      curve: Curves.ease
    ))..addListener(() {
        setState(() {}); // setting state so stuff actually gets updated.
    });
  }

  @override
  Widget build(BuildContext ctx) {
    final double width = MediaQuery.of(context).size.width - 40; // width minus padding
    return Container(
      width: width,
      child: Stack(
      children: <Widget>[
        GestureDetector(
            onTap: () {
              FocusScope.of(ctx).requestFocus(focusNode);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: MiruColors.component
              ),
              width: width - barWidth.value,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 12
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(MiruIcons.search, color: MiruColors.textemphasis)
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Text(hasText ? '' : 'Search...', style: MiruText.subtitle),
                        EditableText(
                          controller: textController,
                          focusNode: focusNode,
                          cursorColor: MiruColors.textemphasis,
                          backgroundCursorColor: MiruColors.component,
                          style: MiruText.emphasis,
                          keyboardType: TextInputType.text,
                          keyboardAppearance: Brightness.dark,
                          enableInteractiveSelection: true,
                        )  
                      ],
                    )
                  )
                ],
              )
            )
          ),
          Positioned(
            right: 0,
            child: SlideTransition(
            position: position,
            child: GestureDetector(
                    onTap: () {
                      focusNode.unfocus();
                      textController.clear();
                    },
                    child:Padding(
                      padding: EdgeInsets.all(15),
                      child: Text('Cancel', style: MiruText.action)
                    )
                  )
      
              )
          )
            ],
    ));
  }
}