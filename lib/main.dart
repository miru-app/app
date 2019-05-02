import 'package:app/assets.dart';
import 'package:app/widgets/app.dart';
import 'package:flutter/widgets.dart';
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

  Route unKnownRoute(RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
        return Container(
          child: Text("Something borked!")
        );
      }
    );
  }

  runApp(
    WidgetsApp(
      color: MiruColors.dark,
      onGenerateRoute: generate,
      onUnknownRoute: unKnownRoute,
      initialRoute: "/"
    )
  );
}
