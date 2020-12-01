import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';

class Button extends StatelessWidget {
  const Button({Key key, @required this.width, this.press, this.text}) : super(key: key);
  final Function press;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: press,
        child: Container(
            width: width,
            height: SizeConfig.yMargin(context, 6.5),
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
                color: yellow),
            alignment: Alignment.center,
            child: Text(text,
                style: nstyle.copyWith(
                    color: blueblack,
                    fontSize: SizeConfig.textSize(context, 6)))),
      ),
    );
  }
}
