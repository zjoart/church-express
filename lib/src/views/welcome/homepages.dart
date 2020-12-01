import 'package:churchexpress/src/helpers/enummode.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:churchexpress/src/widgets/welcometiles.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  WelcomeView({this.mode});
  final AuthyMode mode;
  final GlobalKey<ScaffoldState> _sKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Scaffold(
        key: _sKey,
      appBar: appBar('Welcome', (){_sKey.currentState.openDrawer();}, context),
      drawer: (mode == AuthyMode.LOGIN) ?LoginDrawer(): SignDrawer(),
         body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
            child: Column(
            children: [
              Container(
                  child: Image.asset('Assets/images/homeheader.png')
                ),
Container(
  child: BodyTile(width: width,),
)
            ],
          ),
      ),
    );
  }
}