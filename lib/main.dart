import 'package:flutter/widgets.dart'; // Material design package
//import 'package:flutter/rendering.dart';
import 'package:app/assets.dart';
import 'package:app/pages/testpage.dart';
import 'package:app/pages/homepage.dart'; // Homepage widget

// Start the app
void main() {
  // Run the app
  //SdebugPaintSizeEnabled=true;
  runApp(MiruApp());
}

// This is where the app lives
class MiruApp extends StatelessWidget {
Route generate(RouteSettings settings) {
    Route page;
    switch(settings.name) {
      case '/':
        page = PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return TestPage();
          },
          transitionsBuilder: (_, Animation<double> animation, Animation<double> second, Widget child) {
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

      case '/home':
        page = PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return HomePage();
          },
          transitionsBuilder: (_, Animation<double> animation, Animation<double> second, Widget child) {
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
          child: const Text('Something borked!')
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      onGenerateRoute: generate,
      onUnknownRoute: unKnownRoute,
      initialRoute: '/',
      color: MiruColors.purplePrimary
    );
  }
}
