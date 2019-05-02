import 'package:app/assets.dart';
import 'package:app/pages/anime.dart';
import 'package:app/pages/home.dart';
import 'package:flutter/widgets.dart';

class HomeTab extends StatelessWidget {
  
  Route generate(RouteSettings settings) {
    Route page;
    switch(settings.name) {
      case "/":
        page = PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return HomePage();
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

        case "/anime": // anime info page
        page = PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return AnimePage(anime: settings.arguments);
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

  Route unKnownRoute(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
        return Container(
          child: Text("Something borked!")
        );
      }
    );
  }

  @override
  Widget build(BuildContext ctx) {
    return WidgetsApp(
      color: MiruColors.dark,
      onGenerateRoute: generate,
      onUnknownRoute: unKnownRoute,
      initialRoute: "/"
    );
  }
}