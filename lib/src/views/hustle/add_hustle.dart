import 'dart:io';


import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';


class AddHustle extends StatefulWidget {
  @override
  _AddHustleState createState() => _AddHustleState();
}

class _AddHustleState extends State<AddHustle> {

  File file;
  String fileType = '';
  String fileName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          "New Hustle Registration",
          style: appBarTextStyle,
        ),
        backgroundColor: blueblack,
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              FontAwesomeIcons.search,
//              color: Color(0xFFFFFFFF),
//              size: 14.0,
//            ),
//          )
//        ],
      ),
      body: Container(
//        color: Color(0xFFf8ed62).withOpacity(0.1),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Form(
//                      key: formKey,
                          child: Flex(
                        direction: Axis.vertical,
                        children: <Widget>[
                          ListTile(
                            title: TextFormField(
                              style: welcomeTextField,
                              decoration: InputDecoration(
                                  hintText: "Business Name",
                                  hintStyle: welcomeTextField,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                      color: Colors.black.withOpacity(0.6),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.8),
                                        width: 1.5),
                                  ),
                                  labelText: 'Business Name',
                                  labelStyle: welcomeTextField),
                              initialValue: "",
//                              onSaved: (val) => _name = val,
                              validator: (val) => val == ""
                                  ? "Business Name is required"
                                  : null,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          ListTile(
                            title: TextFormField(
                              style: welcomeTextField,
                              decoration: InputDecoration(
                                  hintText: "Name",
                                  hintStyle: welcomeTextField,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.8),
                                        width: 1.5),
                                  ),
                                  labelText: 'Name',
                                  labelStyle: welcomeTextField),
                              initialValue: "",
//                              onSaved: (val) => _email = val.trim(),
                              validator: (val) =>
                                  val == "" ? "Name is required" : null,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          ListTile(
                            title: TextFormField(
                              style: welcomeTextField,
                              decoration: InputDecoration(
                                  hintText: "Address",
                                  hintStyle: welcomeTextField,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.8),
                                        width: 1.5),
                                  ),
                                  labelText: 'Address',
                                  labelStyle: welcomeTextField),
                              initialValue: "",
//                              onSaved: (val) => _email = val.trim(),
                              validator: (val) =>
                                  val == "" ? "Address is required" : null,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          ListTile(
                            title: TextFormField(
                              style: welcomeTextField,
                              decoration: InputDecoration(
                                  hintText: "08000000000",
                                  hintStyle: welcomeTextField,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.8),
                                        width: 1.5),
                                  ),
                                  labelText: 'Phone',
                                  labelStyle: welcomeTextField),
                              initialValue: "",
//                              onSaved: (val) => _email = val.trim(),
                              validator: (val) =>
                                  val == "" ? "Phone is required" : null,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          ListTile(
                            title: TextFormField(
                              style: welcomeTextField,
                              decoration: InputDecoration(
                                  hintText: "email@churchexpress.com",
                                  hintStyle: welcomeTextField,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.8),
                                        width: 1.5),
                                  ),
                                  labelText: 'Email',
                                  labelStyle: welcomeTextField),
                              initialValue: "",
//                              onSaved: (val) => _email = val.trim(),
                              validator: (val) =>
                                  val == "" ? "Email is required" : null,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          ListTile(
                            title: TextFormField(
                              style: welcomeTextField,
                              decoration: InputDecoration(
                                  hintText: "http://www.churchexpress.com",
                                  hintStyle: welcomeTextField,
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.black.withOpacity(0.8),
                                        width: 1.5),
                                  ),
                                  labelText: 'Website',
                                  labelStyle: welcomeTextField),
                              initialValue: "",
//                              onSaved: (val) => _email = val.trim(),
                              validator: (val) =>
                                  val == "" ? "Website is required" : null,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(15.0),
                              padding: EdgeInsets.all(6),
                              color: Colors.grey,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      fileType = 'image';
                                    });
                                   
                                  },
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                        color: yellow,
                                        borderRadius: BorderRadius.circular(15.0)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(fileName != "" ? fileName : "Tap to Select Business Image", style: welcomeSubmitButton,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: <Widget>[
//                                Expanded(
//                                  child: FlatButton(
////                                    onPressed: _loading ? null : _startHandlingButton,
////                                    padding: EdgeInsets.symmetric(vertical: 17.0),
////                                    color: floatButtonColor,
////                                    child: setupButtonChild(),
//                                    shape: RoundedRectangleBorder(
//                                      borderRadius: new BorderRadius.circular(18.0),
//                                    ),
//                                  ),
//                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 17.0),
                          color: yellow,
                          child: Text("Submit", style: welcomeSubmitButton,),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
