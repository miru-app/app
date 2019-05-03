import 'package:flutter/widgets.dart';

Route unKnownRoute(RouteSettings settings) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation){
      return Container(
        child: Text("Something borked!")
      );
    }
  );
}