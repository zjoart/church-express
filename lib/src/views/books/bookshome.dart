import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:churchexpress/src/widgets/bookspage.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';

class BooksHome extends StatefulWidget {
  @override
  _BooksHomeState createState() => _BooksHomeState();
}

class _BooksHomeState extends State<BooksHome> {
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
          physics: BouncingScrollPhysics(),
                  child: Column(
            children: [
              bannerImage('Assets/images/banner.png'),
              style.ySpace(6),
              BooksPage(style: style),
                 BooksPage(style: style),
                    BooksPage(style: style),
                       BooksPage(style: style)
            ],
          ),
        ));
  }
}
