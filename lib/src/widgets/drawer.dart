import 'package:churchexpress/src/helpers/enummode.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/views/Authy/authyhome.dart';
import 'package:churchexpress/src/views/bible/offline_bible/books_page.dart';
import 'package:churchexpress/src/views/books/bookshome.dart';
import 'package:churchexpress/src/views/contact.dart';
import 'package:churchexpress/src/views/give/give.dart';
import 'package:churchexpress/src/views/hustle/hustle_list.dart';
import 'package:churchexpress/src/views/note/notes_list_page.dart';
import 'package:churchexpress/src/views/pastors/pastorscorner.dart';
import 'package:churchexpress/src/views/pastors/sermon/pastorscermon.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Style style = Style(context);
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          style.ySpace(5),
          drawerHeader(context),
          style.ySpace(2.6),
        ListTile(
      leading: FaIcon(
            FontAwesomeIcons.calendarWeek,
        size: SizeConfig.textSize(context, 5.8)
          ), 
      title: Text(
       'Weekly sermon',
        style: nstyle.copyWith(
            color: Colors.black, fontSize: SizeConfig.textSize(context, 3.8)),
      ),
      onTap: () { Navigator.of(context).pop();
              goTo(context, PastorSermon());
            },
    ),
          DrawerTiles(
            text: 'Pastor corner',
            press: () {
              Navigator.of(context).pop();
              goTo(context, Pastorscorner());
            },
            icon: Icons.rounded_corner_outlined,
          ),
          DrawerTiles(text: 'My hustle', press: (){goTo(context, HustleList());}, icon: Icons.work),
          DrawerTiles(
            text: 'hymns',
            press: () {},
            icon: Icons.wrap_text_outlined,
          ),
          DrawerTiles(
            text: 'Giving',
            press: (){goTo(context, Give());},
            icon: Icons.attach_money,
          ),
          DrawerTiles(
            text: 'Books',
            press: (){goTo(context, BooksHome());},
            icon: Icons.book,
          ),
                    DrawerTiles(
              text: 'My notes', press: (){
                Navigator.of(context).pop(); 
                goTo(context,Notes());}, icon: Icons.notes),
          DrawerTiles(
              text: 'Contact us', press: () { Navigator.of(context).pop(); 
                goTo(context,ContactPage());}, icon: Icons.support_agent),
          DrawerTiles(
            text: 'Settings',
            press: () {},
            icon: Icons.settings,
          ),
          DrawerTiles(text: 'Sign out', press: () {
             Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>AuthHome(mode: AuthyMode.LOGIN)));
          }, icon: Icons.exit_to_app),
           Expanded(
                        child: Align(
    alignment: AlignmentDirectional.bottomCenter,child: socialMedia()),
           ),
           SizedBox(height: 15)
        ],
      ),
    ));
  }
  
}

goTo(BuildContext context,Widget widget ){
   Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>widget));
}
class SignDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Style style = Style(context);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            style.ySpace(3),
            drawerHeader(context),
            style.ySpace(3),
            DrawerTiles(
              text: 'Giving',
              press: () {},
              icon: Icons.attach_money,
            ),
            DrawerTiles(
                text: 'Contact us', press: () {}, icon: Icons.support_agent),
            DrawerTiles(
              text: 'Settings',
              press: () {},
              icon: Icons.settings,
            ),
            DrawerTiles(text: 'Login', press: () {}, icon: Icons.exit_to_app),
           Expanded(
                        child: Align(
    alignment: AlignmentDirectional.bottomCenter,child: socialMedia()),
           )
          ],
        ),
      ),
    );
  }
}


Widget drawerHeader(BuildContext context) {
  return ListTile(
    title: Text(
      'Menu',
      style: nstyle.copyWith(fontSize: SizeConfig.textSize(context, 5.5)),
    ),
  );
}
Widget socialMedia(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
 
     FaIcon(
            FontAwesomeIcons.facebook,
           size: 30.0,
           color: Colors.blue,
          ),
     
     FaIcon(
            FontAwesomeIcons.twitter,
           size: 30.0,
             color: Colors.blue,
          ),
       
           FaIcon(
            FontAwesomeIcons.instagram,
              color: Colors.blue,
           size: 30.0,
          ),
  ],
    );
}
class DrawerTiles extends StatelessWidget {
  const DrawerTiles({
    Key key,
    @required this.text,
    this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final Function press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: SizeConfig.textSize(context, 5.8)),
      title: Text(
        text,
        style: nstyle.copyWith(
            color: Colors.black, fontSize: SizeConfig.textSize(context, 3.8)),
      ),
      onTap: press,
    );
  }
}
