
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/views/welcome/home.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'add_hustle.dart';

class HustleList extends StatefulWidget {
  @override
  _HustleListState createState() => _HustleListState();
}

class _HustleListState extends State<HustleList> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _globalKey,
        appBar: appBar('Hustles', () {
                _globalKey.currentState.openDrawer();
              }, context),
        drawer: LoginDrawer(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 1.0, color: Colors.grey)
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage: AssetImage("Assets/images/hustleimage.png"),
                                  ),
                                  SizedBox(width: 15.0,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Sims Designs", style: hustleOwnerNameStyle,),
                                      SizedBox(height: 1.0,),
                                      Text("Jackie Simons", style: hustleBusinessNameStyle,),
                                      SizedBox(height: 1.0,),
                                      Text("Fashion Designer", style: hustleOwnerNameStyle,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color(0xFF262F3A),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.home, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("39, Adeola Hopewell, Victoria Island, Lagos", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.phone, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("08065773423, 09023436537", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.email, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("renee.hughes@example.com", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.globeAfrica, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("http://www.warephase.com", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1.0, color: Colors.grey)
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage: AssetImage("Assets/images/hustleimage.png"),
                                  ),
                                  SizedBox(width: 15.0,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Sims Designs", style: hustleOwnerNameStyle,),
                                      SizedBox(height: 1.0,),
                                      Text("Jackie Simons", style: hustleBusinessNameStyle,),
                                      SizedBox(height: 1.0,),
                                      Text("Fashion Designer", style: hustleOwnerNameStyle,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color(0xFF262F3A),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.home, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("39, Adeola Hopewell, Victoria Island, Lagos", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.phone, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("08065773423, 09023436537", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.email, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("renee.hughes@example.com", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.globeAfrica, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("http://www.warephase.com", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1.0, color: Colors.grey)
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage: AssetImage("Assets/images/hustleimage.png"),
                                  ),
                                  SizedBox(width: 15.0,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Sims Designs", style: hustleOwnerNameStyle,),
                                      SizedBox(height: 1.0,),
                                      Text("Jackie Simons", style: hustleBusinessNameStyle,),
                                      SizedBox(height: 1.0,),
                                      Text("Fashion Designer", style: hustleOwnerNameStyle,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color(0xFF262F3A),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.home, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("39, Adeola Hopewell, Victoria Island, Lagos", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.phone, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("08065773423, 09023436537", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.email, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("renee.hughes@example.com", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.globeAfrica, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("http://www.warephase.com", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1.0, color: Colors.grey)
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage: AssetImage("Assets/images/hustleimage.png"),
                                  ),
                                  SizedBox(width: 15.0,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Sims Designs", style: hustleOwnerNameStyle,),
                                      SizedBox(height: 1.0,),
                                      Text("Jackie Simons", style: hustleBusinessNameStyle,),
                                      SizedBox(height: 1.0,),
                                      Text("Fashion Designer", style: hustleOwnerNameStyle,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                      Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                                color: Color(0xFF262F3A),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.home, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("39, Adeola Hopewell, Victoria Island, Lagos", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.phone, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("08065773423, 09023436537", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.email, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("renee.hughes@example.com", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                  SizedBox(height: 8.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.globeAfrica, color: Color(0xFFFFFFFF), size: 20,),
                                      SizedBox(width: 15.0,),
                                      Text("http://www.warephase.com", style: hustlsDetailsStyle,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: Color(0xFFFFDA1A), onPressed: (){
          Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (BuildContext context, _, __) => AddHustle(),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget child) {
                    return new FadeTransition(
                        opacity: animation, child: child);
                  }));
        }, child: Icon(FontAwesomeIcons.plus, size: 15.0, color: Color(0xFF262F3A),),),
      ),

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
