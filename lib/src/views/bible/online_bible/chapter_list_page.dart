import 'dart:math';


import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/models/bible/online/chapter_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'chapter_page.dart';

class ChapterListPage extends StatefulWidget {
  final String bookName;
  final String bookId;

  const ChapterListPage({Key key, this.bookName, this.bookId}) : super(key: key);

  @override
  _ChapterListPageState createState() => _ChapterListPageState();
}

class _ChapterListPageState extends State<ChapterListPage> {
  Future<ChapterList> fetchTheChapters() async {
    http.Response response = await http.get(
        'https://api.scripture.api.bible/v1/bibles/de4e12af7f28f599-02/books/${widget.bookId}/chapters',
        headers: {'api-key': 'dad5f80c56fea90e6a36e481cf1c4ddd'});

    if (response.statusCode == 200) {
      return ChapterList.fromJson(json.decode(response.body));
    } else {
      throw Exception("Error getting books");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Bible - King James Version",
            style: appBarTextStyle,
          ),
          backgroundColor: blueblack,
          ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0), child: Text(widget.bookName, style: bibleChapterStyle,),
              ),
            Expanded(
              child: FutureBuilder(
                future: theChapters,
                  builder: (BuildContext context, AsyncSnapshot<ChapterList> snapshot) {
                if (snapshot.hasData) {
                  return GridView.count(crossAxisCount: 7,
                    padding: EdgeInsets.all(8.0),
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 20.0,
                    children: List.generate(snapshot.data.data.length, (index) {
                      Data single = snapshot.data.data[index];
                      return GestureDetector(
                        onTap: () {
                          print(single.reference);
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (BuildContext context, _, __) => ChapterPage(id: single.id, reference: single.reference,),
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
                          child: Center(child: Text("${single.number}", style: bibleTitleStyle,)),
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

  Future<ChapterList> theChapters;
  
  @override
  void initState() {
    theChapters = fetchTheChapters();
  }
}
