import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/helpers/images.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';

class BooksView extends StatefulWidget {
  @override
  _BooksViewState createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  final GlobalKey<ScaffoldState> _sKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    Style style = Style(context);
    return Scaffold(
      key: _sKey,
      appBar: appBar('Books', () {
        _sKey.currentState.openDrawer();
      }, context),
      drawer: LoginDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            bannerImage(banner),
            style.ySpace(6),
            Stack(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Container(height: SizeConfig.yMargin(context, 15),
                    color: Colors.red,),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          style.ySpace(15),
                          Text(
                            'Knowing God Pt 1',
                            style: nstyle.copyWith(
                                fontSize: SizeConfig.textSize(context, 5.5)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Bishop T.D jakes',
                            style: nstyle.copyWith(
                                fontSize: SizeConfig.textSize(context, 4.5)),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero cursus Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero cursus Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero cursus Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero cursus Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero cursus Lorem ipsum dolor sit amet, ',
                              softWrap: true,
                              //  maxLines: 3,

                              style: nstyle.copyWith(
                                  fontSize: SizeConfig.textSize(context, 4.5),
                                  color: Colors.black54),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Price',
                            style: nstyle.copyWith(
                                fontSize: SizeConfig.textSize(context, 4.5),
                                color: Colors.black54),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '#1,500.00',
                            style: nstyle.copyWith(
                                fontSize: SizeConfig.textSize(context, 4.5),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(' ⭐⭐⭐⭐⭐'),
                              style.xSpace(4),
                              Text(
                                '580 reviews',
                                style: nstyle.copyWith(
                                    fontSize: SizeConfig.textSize(context, 4),
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                          style.ySpace(6),
                          buttonY(() {}, MediaQuery.of(context).size.width,
                              context, 'Buy')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -50,
                left: 0.0,
                right: 0.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  color: Colors.blue,
                    width: SizeConfig.xMargin(context, 2),
                    height: SizeConfig.yMargin(context, 30),
                    child: Image.asset(book, fit: BoxFit.fitHeight, width:SizeConfig.xMargin(context, 2 ,)),
              ),),
            ])
          ],
        ),
      ),
    );
  }
}

Widget buttonY(
    Function press, double width, BuildContext context, String text) {
  return GestureDetector(
    onTap: press,
    child: Container(
        width: width,
        height: SizeConfig.yMargin(context, 6.5),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10), color: yellow),
        alignment: Alignment.center,
        child: Text(text,
            style: nstyle.copyWith(
                color: blueblack, fontSize: SizeConfig.textSize(context, 6)))),
  );
}
