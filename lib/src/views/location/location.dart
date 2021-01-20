import 'package:churchexpress/src/widgets/customswitch.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:churchexpress/src/helpers/images.dart';
import 'package:churchexpress/src/views/Authy/authyhome.dart';
import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/widgets/AuthyWidgets/button.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/helpers/responsive.dart';

class LocationHome extends StatefulWidget {
  @override
  _LocationHomeState createState() => _LocationHomeState();
}

class _LocationHomeState extends State<LocationHome> {
  final TextEditingController _address = TextEditingController();
  final TextEditingController _town = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final GlobalKey<ScaffoldState> _sKey = new GlobalKey();
  final _formKey = GlobalKey<FormState>();
  bool enable = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Style style = Style(context);
    return Scaffold(
      key: _sKey,
      appBar: appBar('location', () {
        _sKey.currentState.openDrawer();
      }, context),
      drawer: LoginDrawer(),
      body: SingleChildScrollView(
              child: Column(
          children: [
            bannerImage(location),
            style.ySpace(5),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all(color: border)),
                  child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      alignment: Alignment.center,
                      decoration:
                          BoxDecoration(border: Border.all(color: border), borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pick my current location',
                            style: nstyle.copyWith(
                                color: Colors.black45,
                                fontSize: SizeConfig.textSize(context, 4)),
                          ),
                          CustomSwitch(
                            value: enable,
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                enable = value;
                              });
                              print(enable);
                            },
                          ),
                        ],
                      ))),
            ),
            style.ySpace(5),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(border: Border.all(color: border)),
                child: form(),
              ),
            ),
            style.ySpace(4),
            Button(
              width: width,
              text: 'Search',
              press: () {
                print(_address.text);
              },
            ),
              style.ySpace(3),
          ],
        ),
      ),
    );
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          customField(
            'Address',
            _address,
            '',
            null,
            TextInputType.text,
          ),
          SizedBox(height: 10),
          customField(
            'Town',
            _town,
            '',
            null,
            TextInputType.text,
          ),
          SizedBox(height: 10),
          customField(
            'State',
            _state,
            '',
            null,
            TextInputType.phone,
          ),
        ],
      ),
    );
  }
}
