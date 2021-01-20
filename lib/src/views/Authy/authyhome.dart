import 'package:churchexpress/src/helpers/enummode.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/widgets/AuthyWidgets/authyhead.dart';
import 'package:churchexpress/src/widgets/AuthyWidgets/button.dart';
import 'package:churchexpress/src/widgets/AuthyWidgets/skip.dart';
import 'package:flutter/material.dart';

import 'authyconfirm.dart';

class AuthHome extends StatefulWidget {
  AuthHome({this.mode});
  final AuthyMode mode;
  @override
  _AuthHomeState createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  final TextEditingController _phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String head = 'Welcome';
    String body =
        'Welcome to the new app church, enter your phone number to get Started';

    Style style = Style(context);
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        //  physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            style.ySpace(5),
            Skip(),
            style.ySpace(4),
            AuthyHead(head: head, body: body),
            style.ySpace(7),
            formm(),
            style.ySpace(6),
            Button(
              width: width,
              press: () {
                _validateAndSubmit();
              },
              text: widget.mode == AuthyMode.SINGUP ?  'Continue' : 'Submit',
            )
          ],
        ),
      ),
    ));
  }

  Widget formm() {
    return Form(
        key: _formKey,
        child: customField(
          'Phone Number',
          _phone,
          'Enter your phone number',
          null,
          TextInputType.phone,
        ));
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  _validateAndSubmit() {
    if (_validateAndSave()) {
      print(_phone.text);
      widget.mode == AuthyMode.SINGUP
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      AuthyModeScreen(mode: AuthyMode.SINGUP)))
          : Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      AuthyModeScreen(mode: AuthyMode.LOGIN)));
    }
  }
}

Widget customField(
  String head,
  TextEditingController controller,
  String hint,
  int maxline,
  TextInputType type,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          head,
          style: nstyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15),
        TextFormField(
          controller: controller,
          validator: (value) => value.isEmpty ? 'Field can not be empty' : null,
          keyboardType: type,
          autofocus: false,
          decoration: InputDecoration(
              labelText: hint,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              )),
          style: nstyle,
          maxLines: maxline,
        ),
      ],
    ),
  );
}
