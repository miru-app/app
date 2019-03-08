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
Route generate(RouteSettings settings){
    Route page;
    switch(settings.name){
      case "/":
        page =  new PageRouteBuilder(
            pageBuilder: (BuildContext context,Animation<double> animation,
                Animation<double> secondaryAnimation){
              return new TestPage();
            },
            transitionsBuilder: (_, Animation<double> animation, Animation<double> second, Widget child) {
              return new FadeTransition(
                opacity: animation,
                child: new FadeTransition(
                  opacity: new Tween<double>(begin: 1.0, end: 0.0).animate(second),
                  child: child,
                ),
              );
            }
        );
        break;

      case "/home":
        page =  new PageRouteBuilder(
            pageBuilder: (BuildContext context,Animation<double> animation,
                Animation<double> secondaryAnimation){
              return new HomePage();
            },
            transitionsBuilder: (_, Animation<double> animation, Animation<double> second, Widget child) {
              return new FadeTransition(
                opacity: animation,
                child: new FadeTransition(
                  opacity: new Tween<double>(begin: 1.0, end: 0.0).animate(second),
                  child: child,
                ),
              );
            }
        );
        break;
    }
    return page;
  }

  Route unKnownRoute(RouteSettings settings){
    return new PageRouteBuilder(
        pageBuilder: (BuildContext context,Animation<double> animation,
            Animation<double> secondaryAnimation){
          return new Container(
            child:Text("Something borked!")
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new WidgetsApp(
        onGenerateRoute: generate,
        onUnknownRoute: unKnownRoute,
        initialRoute: "/",
        color: MiruColors.purplePrimary
    );
  }
}
