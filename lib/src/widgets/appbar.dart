import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';

Widget appBar( String text, Function press, BuildContext context){
  return AppBar(
   title: Text(text, style: nstyle.copyWith(color: Colors.white, fontSize: SizeConfig.textSize(context, 5), ),),
      leading: IconButton(
                icon: Image.asset("Assets/icons/drawer.png"),
                onPressed: press),
                backgroundColor: blueblack,
  );
}
 Image bannerImage(String image) => Image.asset(image, fit: BoxFit.cover);



