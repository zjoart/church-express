import 'package:churchexpress/src/models/bible/offline/bible_model.dart';


import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/views/welcome/home.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'chapters_page.dart';

class NewBooksPage extends StatefulWidget {
  @override
  _NewBooksPageState createState() => _NewBooksPageState();
}

class _NewBooksPageState extends State<NewBooksPage> {
  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/bible/Books.txt');
  }

  Future<String> books;
  List<String> book_list;
  List<String> stripped_book = [];

  Future<BibleModel> boo;

  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    books = loadAsset();
    books.then((value) {
      setState(() {
        book_list = value.split(",");

        for (var i = 0; i < book_list.length; i++) {
          stripped_book.add(book_list[i].replaceAll(RegExp(r"[^\s\w]"), ""));
        }
      });

      print(book_list[0]);
      print(stripped_book[0]);
      print(book_list[1]);
      print(stripped_book[1]);
      print(book_list[2]);
      print(stripped_book[2]);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          key: _globalKey,
          appBar: AppBar(
              title: Text(
                "Bible",
                style: appBarTextStyle,
              ),
              backgroundColor: blueblack,
              leading: IconButton(
                  icon: Image.asset("Assets/icons/drawer.png"),
                  onPressed: () {
                    _globalKey.currentState.openDrawer();
                  })),
          drawer: LoginDrawer(),
          body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: stripped_book.length,
              itemBuilder: (context, index) {
              String the_book = stripped_book[index];
              String the_stripped_book = the_book.replaceAll(" ", "");
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (BuildContext context, _, __) => NewChapterPage(bookName: the_stripped_book,),
                        transitionsBuilder:
                            (_, Animation<double> animation, __, Widget child) {
                          return new FadeTransition(
                              opacity: animation, child: child);
                        }));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          width: 1.0,
                          color: Colors.black.withOpacity(0.3))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: <Widget>[Text(the_book, style: bibleTitleStyle,)],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      )),
    );
  }

  Future<bool> _onWillPop() {
    return  Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (BuildContext context, _, __) => HomeScreen(),
            transitionsBuilder:
                (_, Animation<double> animation, __, Widget child) {
              return new FadeTransition(
                  opacity: animation, child: child);
            }));
  }
}
