import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/views/welcome/home.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';

class Skip extends StatelessWidget {
  const Skip({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: FlatButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen()));
          },
          child: Text(
            'Skip',
            style: nstyle.copyWith(fontSize: SizeConfig.textSize(context, 4.5)),
          ),
        ),
      ),
    );
  }
}
