import 'package:app/assets.dart';
import 'package:app/tabs/home.dart';
import 'package:app/tabs/library.dart';
import 'package:app/tabs/search.dart';
import 'package:app/tabs/settings.dart';
import 'package:app/widgets/navigation.dart';
import 'package:flutter/widgets.dart';

class MiruApp extends StatefulWidget {

  MiruApp();

  @override
  MiruAppState createState() {
    return MiruAppState();
  }
}

class MiruAppState extends State<MiruApp> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> tabOffset;

  @override
  void initState() {
    super.initState();

    if (previous < index) {
      goRight = false;
    } else {
      goRight = true;
    }// transition direction

    controller = AnimationController( // animation controller handles all animations
      duration: const Duration(milliseconds: 500), // duration of the transition
      vsync: this
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
          setState(() {
            animationInProgress = false; // setting this to false removes all of the animation offsets to get ready for the next transition.
            controller.value = 0; // resets the value so the next animation can start
          });
      }
    });

    tabOffset = Tween<double>( // tabboffset gets animated from 0 to 1 if animating.
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.ease
    ))..addListener(() {
        setState(() {}); // setting state so stuff actually gets updated.
    });
  }

  void changeTab(int newIndex) {
    setState(() {
      animationInProgress = true;
      previous = index;
      index = newIndex;

      if (previous < index) {
        goRight = false;
      } else {
        goRight = true;
      }// transition direction
      
    });
    controller.forward();
  }

  double calculateOffset(int tab, double width) {
    // in animation
    if (animationInProgress) {
      if (tab == previous) {
        if (goRight) {
          // if the tab should be pushed to the right out of view
          return width * tabOffset.value;
        } else {
          // if the tab should be pushed to the left out of view
          return width * tabOffset.value * -1; // inverted so it goes left
        }
      }
      if (tab == index) {
        if (goRight) {
          // if the tab should be pushed to the right into of view
          return width * (tabOffset.value -1 ); // offsetted by one so it goes from outside of the view to inside
        } else {
          // if the tab should be pushed to the left into of view
          return width * ((tabOffset.value *-1) + 1); // inverted so it goes left and offsetted by one so it goes from outside the view to inside
        }
      }
    } else {
      return 0;
    }
    // tab shouldn't be rendered.
    return 0;
  }

  bool shouldRender(int tab) {
    if (tab == previous && animationInProgress) return true;
    if (tab == index) return true;
    return false;
  }

  int index = 3;
  int previous = 0;
  bool goRight = false;
  bool animationInProgress = false;
  @override
  Widget build(BuildContext ctx) {
    final double width = MediaQuery.of(context).size.width;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: MiruColors.dark
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  Offstage(
                    offstage: !shouldRender(1),
                    child: TickerMode(
                      enabled: shouldRender(1),
                      child: Transform.translate(
                        offset: Offset(calculateOffset(1, width),0.0),
                        child: HomeTab(
                          appContext: ctx
                        ),
                      )
                    ),
                  ),
                  Offstage(
                    offstage: !shouldRender(2),
                    child: TickerMode(
                      enabled: shouldRender(2),
                      child: Transform.translate(
                        offset: Offset(calculateOffset(2, width),0.0),
                        child: SearchTab(
                          appContext: ctx
                        ),
                      )
                    ),
                  ),
                  Offstage(
                    offstage: !shouldRender(3),
                    child: TickerMode(
                      enabled: shouldRender(3),
                      child: Transform.translate(
                        offset: Offset(calculateOffset(3, width),0.0),
                        child: LibraryTab(
                          appContext: ctx
                        ),
                      )
                    ),
                  ),
                  Offstage(
                    offstage: !shouldRender(4),
                    child: TickerMode(
                      enabled: shouldRender(4),
                      child: Transform.translate(
                        offset: Offset(calculateOffset(4, width),0.0),
                        child: SettingsTab(
                          appContext: ctx
                        ),
                      )
                    ),
                  ),
                  Offstage( // testing tab
                    offstage: !shouldRender(5),
                    child: TickerMode(
                      enabled: shouldRender(5),
                      child: Transform.translate(
                        offset: Offset(calculateOffset(5, width),0.0),
                        child: SearchTab(
                          appContext: ctx
                        ),
                      )
                    ),
                  ),
                ],
              )
            ),
            BottomBar(
              onTap: (int pageIndex) {
                changeTab(pageIndex);
              },
              selected: this.index
            )
          ],
        )
      )
    );
  }
}