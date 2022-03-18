import 'package:appdomiicilios/vistas/home.dart';
import 'package:flutter/material.dart';
import 'package:appdomiicilios/vistas/splash_screen.dart';
import 'package:hexcolor/hexcolor.dart';


var routes = <String, WidgetBuilder>{
  "/home": (BuildContext context) => Home(),
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Color _primaryColor = HexColor('#ffc414');
  Color _accentColor = HexColor('#ff9800');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange).copyWith(secondary: _accentColor),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
          bodyText1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
        routes: routes
    );
  }
}



