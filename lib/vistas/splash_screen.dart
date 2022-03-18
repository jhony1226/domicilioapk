import 'dart:async';

import 'package:appdomiicilios/vistas/login.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState() {
    new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home()), (route) => false);
      });
    });

    new Timer(Duration(milliseconds: 10), () {
      setState(() {
        _isVisible =
            true; // Now it is showing fade effect and navigating to Login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient:LinearGradient(
          colors: [Color(0xffffc414), Color(0xa8ff9800)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )

        //   new LinearGradient(
        //   colors: [
        //     Theme.of(context).colorScheme.secondary,
        //     Theme.of(context).primaryColor
        //   ],
        //   begin: const FractionalOffset(0, 0),
        //   end: const FractionalOffset(1.0, 0.0),
        //   stops: [0.0, 1.0],
        //   tileMode: TileMode.clamp,
        // ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 140.0,
            width: 140.0,
            child: Center(
              child: ClipOval(
                  child: Image(
                    height: 100,
                      image: AssetImage(
                          'assets/img/logo.png')) //put your logo here
                  ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 40,
                    offset: Offset(0, 0.0),
                    spreadRadius: 10.0,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
