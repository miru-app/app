import 'dart:ui';

import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatefulWidget {
  final onEdit;
  final FocusNode focus;

  SearchBar({this.onEdit, this.focus});

  @override
  SearchBarState createState() => new SearchBarState();
}

class SearchBarState extends State<SearchBar> with TickerProviderStateMixin  {
  final TextEditingController textController = new TextEditingController();

  FocusNode focusNode;
  bool hasText = false;
  AnimationController controller;
  Animation animation;
  static final Animatable<double> tween = Tween<double>(
    begin: 0,
    end: 75, // size of cancel button with padding
  );

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
    focusNode = widget.focus;

    controller = AnimationController( // animation controller handles all animations
      duration: const Duration(milliseconds: 200), // duration of the transition
      vsync: this
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.ease
    )..addListener(() {
      setState((){});
    });

  }

  @override
  Widget build(BuildContext ctx) {
    return Container(
      child: Row(
      children: <Widget>[
        Expanded(
          child:
        GestureDetector(
            onTap: () {
              FocusScope.of(ctx).requestFocus(focusNode);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: MiruColors.component
              ),
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
        ),
          SizedBox(
            width: tween.evaluate(animation),
            child: GestureDetector(
              onTap: () {
                textController.clear();
                focusNode.unfocus();
              },
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text('Cancel', softWrap: false, style: MiruText.action)
              )
            )
          )
      ],
    ));
  }
}