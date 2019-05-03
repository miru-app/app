import 'package:app/assets.dart';
import 'package:app/widgets/app.dart';
import 'package:flutter/widgets.dart';
import 'package:app/navigationhelper.dart' as navigationHelper;
//import 'package:flutter/rendering.dart'; // ui debug

void main() {
  //debugPaintSizeEnabled=true; // enable ui debug
  
  Route generate(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return MiruApp();
      }
    );
  }

  runApp(
    WidgetsApp(
      color: MiruColors.dark,
      onGenerateRoute: generate,
      onUnknownRoute: navigationHelper.unKnownRoute,
      initialRoute: "/"
    )
  );
}
