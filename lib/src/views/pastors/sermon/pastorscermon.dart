
import 'package:churchexpress/src/helpers/style.dart';

import 'package:churchexpress/src/views/pastors/sermon/sermonview.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:churchexpress/src/widgets/pastorswordstile.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/images.dart';

class PastorSermon extends StatefulWidget {
  @override
  _PastorSermonState createState() => _PastorSermonState();
}

class _PastorSermonState extends State<PastorSermon> {
  final GlobalKey<ScaffoldState> _sKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    Style style = Style(context);
    return Scaffold(
      key: _sKey,
      appBar: appBar("Weekly Sermon", () {
        _sKey.currentState.openDrawer();
      }, context),
      drawer: LoginDrawer(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            bannerImage(banner),
            style.ySpace(6),
            PastorsWordsTile(
              press: () {
                goTo(
                    context,
                    SermonView(
                      title: 'Get Ready for Greatness',
                    ));
              },
            ),
            PastorsWordsTile(
              press: () {},
            ),
            PastorsWordsTile(
              press: () {},
            ),
            PastorsWordsTile(
              press: () {},
            ),
            PastorsWordsTile(
              press: () {},
            ),
            PastorsWordsTile(
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
