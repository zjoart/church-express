import 'dart:async';

import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/enummode.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/viewmodels/shared.dart';
import 'package:churchexpress/src/views/Authy/authyhome.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Shared().getmode().then((value) {
        if (value == null || value == false) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => AuthHome(mode: AuthyMode.SINGUP,),
          ));
        } else if (value == true) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => AuthHome(mode: AuthyMode.LOGIN,),
          ));
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Opacity(
                opacity: 0.9,
                child: Image.asset(
                  "Assets/images/splashimage.png",
                  height: 150.0,
                )),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Welcome to Church",
              style: splashhead,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Christ our solid rock",
              style: splashbody,
            )
          ],
        ),
      ),
    );
  }
}
