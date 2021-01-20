import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/enummode.dart';
import 'package:churchexpress/src/views/Livestream/video_list_page.dart';
import 'package:churchexpress/src/views/bible/offline_bible/books_page.dart';
import 'package:churchexpress/src/views/bible/online_bible/books_page.dart';
import 'package:churchexpress/src/views/location/location.dart';
import 'package:churchexpress/src/views/welcome/homepages.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginHome extends StatefulWidget {
  @override
  _LoginHomeState createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {

  int _index  = 0; 
  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_index) {
      case 0:
        child = WelcomeView(mode: AuthyMode.LOGIN,);
        break;
      case 1:
        child = VideoListPage();
        break;
      case 2:
        child = LocationHome();
        break;
      case 3:
        child = BookPage();
        break;
    }
    return Scaffold(
      body: SizedBox.expand(child: child),
      bottomNavigationBar: _createBottomNavigationBar()
    );
  }
   Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (newIndex) => setState(() => _index = newIndex),
      backgroundColor: blueblack,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      unselectedItemColor: Colors.white,
      selectedItemColor: yellow,
      items: [
        BottomNavigationBarItem(
            icon: FaIcon(
            FontAwesomeIcons.cross,
           size: 25.0,
          ), label: 'Welcome'),
        BottomNavigationBarItem(
            icon:  FaIcon(
            FontAwesomeIcons.video,
           size: 25.0,
          ), label: 'LiveStream'),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined, size: 25.0,), label: 'Location'),
        BottomNavigationBarItem(
            icon: FaIcon(
            FontAwesomeIcons.bible,
        size: 25.0,
          ), label: 'Bible'),
      ],
    );
  }

}

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  int _index  = 0;
  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_index) {
      case 0:
        child = WelcomeView(mode: AuthyMode.SINGUP,);
        break;
      case 1:
        child = VideoListPage();
        break;
      case 2:
        child = FlutterLogo();
        break;
      case 3:
        child = NewBooksPage();
        break;
    }
    return Scaffold(
      body: SizedBox.expand(child: child),
      bottomNavigationBar: _createBottomNavigationBar()
     );
  }
 
  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (newIndex) => setState(() => _index = newIndex),
      backgroundColor: blueblack,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      unselectedItemColor: Colors.white,
      selectedItemColor: yellow,
      items: [
        BottomNavigationBarItem(
            icon: FaIcon(
            FontAwesomeIcons.cross,
           size: 25.0,
          ), label: 'Welcome'),
        BottomNavigationBarItem(
            icon:  FaIcon(
            FontAwesomeIcons.video,
           size: 25.0,
          ), label: 'LiveStream'),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined, size: 25.0,), label: 'Location'),
        BottomNavigationBarItem(
            icon: FaIcon(
            FontAwesomeIcons.bible,
        size: 25.0,
          ), label: 'Bible'),
      ],
    );
  }

}
