import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';

class QouteView extends StatefulWidget {
  @override
  _QouteViewState createState() => _QouteViewState();
}

class _QouteViewState extends State<QouteView> {
  @override
  Widget build(BuildContext context) {
    Style style = Style(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pastor's Quote",
          style: nstyle.copyWith(
            color: Colors.white,
            fontSize: SizeConfig.textSize(context, 5),
          ),
        ),
        backgroundColor: blueblack,
      ),
      body: Column(
        children: [
          bannerImage('Assets/images/banner.png'),
          style.ySpace(6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: border)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.format_quote_sharp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    //  mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero cursus Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero cursus',
                          style: nstyle.copyWith(
                              fontSize: SizeConfig.textSize(context, 3.5))),
                      Text(
                        '- Solomon',
                        style: nstyle.copyWith(
                          fontSize: SizeConfig.textSize(context, 3.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
