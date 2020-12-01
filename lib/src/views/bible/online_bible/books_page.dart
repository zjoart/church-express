import 'dart:async';
import 'dart:convert';

import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/models/bible/online/books_model.dart';
import 'package:churchexpress/src/views/welcome/home.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'chapter_list_page.dart';

class BookPage extends StatefulWidget {
  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  Future<Books> fetchTheBooks() async {
    http.Response response = await http.get(
        'https://api.scripture.api.bible/v1/bibles/de4e12af7f28f599-02/books',
        headers: {'api-key': 'dad5f80c56fea90e6a36e481cf1c4ddd'});

    if (response.statusCode == 200) {
      return Books.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting books");
    }
  }

  Future<Books> theBooks;
  Widget buildBooks(AsyncSnapshot<Books> snapshot) {
    var bookList = snapshot.data.data;
    return ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(bookList[index].name);
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
          key: _globalKey,
          appBar: AppBar(
              title: Text(
                "Bible - King James Version",
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
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: FutureBuilder<Books>(
                  future: theBooks,
                  builder: (BuildContext context, AsyncSnapshot<Books> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data.data.length,
                          itemBuilder: (context, index) {
                            Data singleBook = snapshot.data.data[index];
                            return GestureDetector(
                              onTap: () {
                                print(singleBook.name);
                                print(singleBook.id);
                                Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                        pageBuilder: (BuildContext context, _, __) => ChapterListPage(bookId: singleBook.id, bookName: singleBook.name,),
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
                                      children: <Widget>[Text(singleBook.name, style: bibleTitleStyle,)],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return Center(
                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(blueblack),),
                      );
                    }
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

  @override
  void initState() {
    theBooks = fetchTheBooks();
    theBooks.then((books) {
//      print(books.data[0].name);
//      print(books.data.length);
    });
  }
}
