import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/views/pastors/pastormessageview.dart';
import 'package:churchexpress/src/views/pastors/pastorqouteview.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:churchexpress/src/widgets/pastorswordstile.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';
import 'package:churchexpress/src/helpers/images.dart';

class Pastorscorner extends StatelessWidget {
  final GlobalKey<ScaffoldState> _sKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    Style style = Style(context);
    return Scaffold(
      key: _sKey,
      appBar: appBar("Pastor's Corner", () {
        _sKey.currentState.openDrawer();
      }, context),
      drawer: LoginDrawer(),
      body: Column(
        children: [
          bannerImage(banner),
          style.ySpace(7),
          cornerTile(context, Icons.mail, 'Pastors message', () {
            goTo(context, PastorsMessage());
          }),
          cornerTile(context, Icons.format_quote_sharp, 'Pastors Quotes', () {
            goTo(context, PatorsQoute());
          })
        ],
      ),
    );
  }

  Padding cornerTile(
      BuildContext context, IconData icon, String text, Function press) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: GestureDetector(
        onTap: press,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 15,
              ),
              Text(text,
                  style: nstyle.copyWith(
                      fontSize: SizeConfig.textSize(context, 5)))
            ],
          ),
        ),
      ),
    );
  }
}

class PastorsMessage extends StatefulWidget {
  @override
  _PastorsMessageState createState() => _PastorsMessageState();
}

class _PastorsMessageState extends State<PastorsMessage> {
  @override
  Widget build(BuildContext context) {
    Style style = Style(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pastor's Message",
          style: nstyle.copyWith(
            color: Colors.white,
            fontSize: SizeConfig.textSize(context, 5),
          ),
        ),
        backgroundColor: blueblack,
      ),
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
                    FullMessageView(
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

class PatorsQoute extends StatefulWidget {
  @override
  _PatorsQouteState createState() => _PatorsQouteState();
}

class _PatorsQouteState extends State<PatorsQoute> {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ' How Are you feeling',
            style: nstyle.copyWith(fontSize: SizeConfig.textSize(context, 5)),
          ),
          style.ySpace(7),
          qouteTile(context, 'Happy'),
          qouteTile(context, 'Excited'),
          qouteTile(context, 'Happy'),
          qouteTile(context, 'Sad'),
          qouteTile(context, 'Happy'),
          qouteTile(context, 'Lonely')
        ],
      ),
    );
  }

  Padding qouteTile(BuildContext context, String text, ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: GestureDetector(
        onTap: (){
          goTo(context, QouteView(title: text,));
        },
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
                border: Border.all(color: border),
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text(
                  text,
                  style: nstyle.copyWith(
                      fontSize: SizeConfig.textSize(context, 4.5)),
                ),
                Icon(Icons.arrow_forward_ios)
              ],
            )),
      ),
    );
  }
}
