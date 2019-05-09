import 'dart:ui';

import 'package:app/assets.dart';
import 'package:flutter/widgets.dart';

class SearchBar extends StatefulWidget {
  final onEdit;

  SearchBar({this.onEdit});

  @override
  SearchBarState createState() => new SearchBarState();
}

class SearchBarState extends State<SearchBar>  {
  final TextEditingController textController = new TextEditingController();
  final FocusNode focusNode = new FocusNode();
  
  bool hasText = false;

  @override
  void initState() {
    textController.addListener(() {
      widget.onEdit(textController.text);

      setState(() {
       hasText = textController.text != '';
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext ctx) {
    return Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
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
          )
        ),
        Offstage(
          offstage: !hasText,
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
      ]
    );
  }
}