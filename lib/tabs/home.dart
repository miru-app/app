import 'package:app/assets.dart';
import 'package:app/pages/home.dart';
import 'package:flutter/widgets.dart';
import 'package:app/navigationhelper.dart' as navigationHelper;

class HomeTab extends StatelessWidget {
  final BuildContext appContext;
  
  HomeTab({this.appContext});

  Route generate(RouteSettings settings) {
    Route page;
    switch(settings.name) {
      case "/":
        page = PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return HomePage(
              appContext: this.appContext
            );
          },
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> second, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: FadeTransition(
                opacity: Tween<double>(begin: 1.0, end: 0.0).animate(second),
                child: child,
              ),
            );
          }
        );
        break;
    }

    return page;
  }

  @override
  Widget build(BuildContext ctx) {
    return WidgetsApp(
      color: MiruColors.dark,
      onGenerateRoute: generate,
      onUnknownRoute: navigationHelper.unKnownRoute,
      initialRoute: "/"
    );
  }
}