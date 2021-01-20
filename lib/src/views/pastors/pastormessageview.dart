import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';
import 'package:churchexpress/src/helpers/images.dart';

class FullMessageView extends StatefulWidget {
  FullMessageView({this.title});
  final String title;
  @override
  _FullMessageViewState createState() => _FullMessageViewState();
}

class _FullMessageViewState extends State<FullMessageView> {
  @override
  Widget build(BuildContext context) {
    Style style = Style(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: nstyle.copyWith(
                fontSize: SizeConfig.textSize(context, 5),
                color: Colors.white)),
        backgroundColor: blueblack,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bannerImage(great),
          style.ySpace(6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: nstyle.copyWith(
                          fontSize: SizeConfig.textSize(context, 5)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Pastor's Taiwo Oyewole",
                      style: nstyle.copyWith(
                          fontSize: SizeConfig.textSize(context, 4)),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '07 - 10 - 2019',
                      style: nstyle.copyWith(
                          fontSize: SizeConfig.textSize(context, 3.5)),
                    ),
                  ],
                ),
                Icon(
                  Icons.share,
                  size: 30,
                )
              ],
            ),
          ),
          style.ySpace(8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
             height: SizeConfig.yMargin(context, 6),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                        Container(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.headset),
                        SizedBox(width: 5),
                        Text('Listen',
                            style: nstyle.copyWith(
                                fontSize: SizeConfig.textSize(context, 4.5))),
                        style.xSpace(9),
                      ],
                    ),
                    Icon(Icons.download_sharp)
                  ],
                )),
          )
        ],
      ),
    );
  }
}
