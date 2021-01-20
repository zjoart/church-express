import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';
import 'package:churchexpress/src/helpers/images.dart';
class SermonView extends StatefulWidget {
  SermonView({this.title});
  final String title;
  @override
  _SermonViewState createState() => _SermonViewState();
}

class _SermonViewState extends State<SermonView> {
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: yellow),
                      child: Text(
                        '4 days left',
                        style: nstyle.copyWith(
                            fontSize: SizeConfig.textSize(context, 3.5)),
                      ),
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
          ),
          style.ySpace(4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              height: SizeConfig.yMargin(context, 6),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: Text('Take note',
                  style: nstyle.copyWith(
                      fontSize: SizeConfig.textSize(context, 5))),
            ),
          )
        ],
      ),
    );
  }
}
