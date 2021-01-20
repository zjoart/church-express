import 'package:churchexpress/src/helpers/images.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/views/Authy/authyhome.dart';
import 'package:churchexpress/src/widgets/AuthyWidgets/button.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _message = TextEditingController(); 
  final _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _sKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    Style style = Style(context);
    return Scaffold(
      key: _sKey,
          appBar: appBar('Contact us', (){_sKey.currentState.openDrawer();}, context),
      drawer: LoginDrawer(),
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(children: [
            Image.asset(
              contact,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 0,
              left: 20,
              child: Text('Leave a Message', style:nstyle.copyWith(fontSize: SizeConfig.textSize(context, 6))))
          ]),
          style.ySpace(6),
          form(),
          style.ySpace(6),
          Button(
            width: MediaQuery.of(context).size.width,
            text: 'Send',
            press: () {
              print(_name.text);
              print(_email.text);
              print(_phone.text);
              print(_message.text);
            },
          ),
        style.ySpace(6),
        ],
      ),
    ));
  }

  Widget form() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          customField(
            'Name',
            _name,
            '',
            null,
            TextInputType.text,
          ),
          SizedBox(height: 10),
          customField(
            'Email',
            _email,
            '',
            null,
            TextInputType.text,
          ),
          SizedBox(height: 10),
          customField(
            'Phone Number',
            _phone,
            '',
            null,
            TextInputType.phone,
          ),
          SizedBox(height: 10),
          customField(
            'Message',
            _message,
            '',
            10,
            TextInputType.multiline,
          ),
         
        ],
      ),
    );
  }
}
