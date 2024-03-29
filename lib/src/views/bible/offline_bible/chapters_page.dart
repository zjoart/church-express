import 'dart:math';


import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/views/bible/offline_bible/verses_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:churchexpress/src/models/bible/offline/bible_model.dart';

class NewChapterPage extends StatefulWidget {
  final String bookName;

  const NewChapterPage({Key key, this.bookName}) : super(key: key);

  @override
  _NewChapterPageState createState() => _NewChapterPageState();
}

class _NewChapterPageState extends State<NewChapterPage> {
  Future<BibleModel> loadChapters() async {
    String bookString = await DefaultAssetBundle.of(context).loadString("Assets/bible/${widget.bookName.toString()}.json");
    var jsonR = json.decode(bookString);
    return BibleModel.fromJson(jsonR);
  }

  Future<BibleModel> theChapters;

  @override
  void initState() {
    theChapters = loadChapters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Book of " + widget.bookName,
            style: appBarTextStyle,
          ),
          backgroundColor: blueblack,
          ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
//            Padding(padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0), child: Text(widget.bookName, style: bibleChapterStyle,),
//              ),
            Expanded(
              child: FutureBuilder(
                future: theChapters,
                  builder: (BuildContext context, AsyncSnapshot<BibleModel> snapshot) {
                if (snapshot.hasData) {
                  return GridView.count(crossAxisCount: 7,
                    padding: EdgeInsets.all(8.0),
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 20.0,
                    children: List.generate(snapshot.data.chapters.length, (index) {
                      String single = snapshot.data.chapters[index].chapter;
                      return GestureDetector(
                        onTap: () {
                          print(single.length);
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (BuildContext context, _, __) => VersePage(book_name: widget.bookName.toString(), chapter: single, index: index,),
                                  transitionsBuilder:
                                      (_, Animation<double> animation, __, Widget child) {
                                    return new FadeTransition(
                                        opacity: animation, child: child);
                                  }));
                        },
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 1.0)
                          ),
                          child: Center(child: Text("${single.toString()}", style: bibleTitleStyle,)),
                        ),
                      );
                    }),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(blueblack),),
                  );
                }
              }),
            )
          ],
        ),
      ),
    );
  }
}
