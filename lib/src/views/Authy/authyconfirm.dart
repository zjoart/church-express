import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/enummode.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/views/Authy/registrationsuccess.dart';
import 'package:churchexpress/src/views/welcome/home.dart';
import 'package:churchexpress/src/widgets/AuthyWidgets/authyhead.dart';
import 'package:churchexpress/src/widgets/AuthyWidgets/button.dart';
import 'package:churchexpress/src/widgets/AuthyWidgets/skip.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_box/verification_box.dart';
import 'package:churchexpress/src/helpers/responsive.dart';

class AuthyModeScreen extends StatefulWidget {
  AuthyModeScreen({this.mode});
  final AuthyMode mode;
  @override
  _AuthyModeScreenState createState() => _AuthyModeScreenState();
}

class _AuthyModeScreenState extends State<AuthyModeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.mode == AuthyMode.LOGIN ? AuthyConfirm() : Register(),
      ),
    );
  }
}

class AuthyConfirm extends StatefulWidget {
  @override
  _AuthyConfirmState createState() => _AuthyConfirmState();
}

class _AuthyConfirmState extends State<AuthyConfirm> {
  dynamic pin;

  @override
  Widget build(BuildContext context) {
    Style style = Style(context);

    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              style.ySpace(7),
              Skip(),
              AuthyHead(
                  head: 'Welcome',
                  body: 'Kindly enter the otp sent to your phone.'),
              style.ySpace(7),
              //formm(),
              customField(),
              style.ySpace(8),
              Button(
                width: width,
                press: () {
                  _validateAndSubmit();
                },
                text: 'Login',
              ),
              style.ySpace(3),
              receieveIf(),
            ],
          ),
    );
  }

  Widget receieveIf() {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: "Didn't get OTP? ",
            style: nstyle.copyWith(
                color: Colors.black54,
                fontSize: SizeConfig.textSize(context, 4)),
            children: [
              TextSpan(
                text: "Resend OTP",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('worked');
                    Navigator.pop(context);
                  },
                style: nstyle.copyWith(
                    color: blueblack,
                    fontSize: SizeConfig.textSize(context, 4)),
              )
            ]),
      ),
    );
  }

  Widget customField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        // width: MediaQuery.of(context).size.width,
        child: VerificationBox(
          count: 4,
          borderColor: blueblack,
          borderWidth: 1,
          borderRadius: 10,
          textStyle: nstyle.copyWith(color: blueblack),
          showCursor: true,
          cursorWidth: 2,
          cursorColor: Colors.red,
          cursorIndent: 10,
          cursorEndIndent: 10,
          onSubmitted: (value) {
            print('$value');
            pin = value;
            print('$pin');
          },
        ),
      ),
    );
  }

  _validateAndSubmit() {
    if (pin != null) {
      print(pin);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    } else {
      print('not working');
    }
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Style style = Style(context);
    return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              style.ySpace(5),
              Skip(),
              style.ySpace(4),
              AuthyHead(
                  head: 'Welcome',
                  body:
                      'We dont have you on our database kindly fill out the form below'),
              style.ySpace(7),
              formm(),
              style.ySpace(6),
              Button(
                width: width,
                press: () {
                  _validateAndSubmit();
                },
                text: 'Submit',
              )
            ],
          ),
       
    );
  }

  Widget formm() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customField('Phone Number', _phone, 'Enter your phone number',
                TextInputType.phone),
            SizedBox(height: 20),
            customField('Name', _name, 'Enter your name', TextInputType.text),
            SizedBox(height: 20),
            customField('Location', _location, 'Enter your location',
                TextInputType.text),
          ],
        ));
  }

  Widget customField(String head, TextEditingController controller, String hint,
      TextInputType type) {
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
            validator: (value) =>
                value.isEmpty ? 'Field can not be empty' : null,
            keyboardType: type,
            autofocus: false,
            decoration: InputDecoration(
                labelText: hint,
                contentPadding: EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                )),
            style: nstyle,
          ),
        ],
      ),
    );
  }

  _validateAndSubmit() {
    if (_validateAndSave()) {
      print(_phone.text);
      print(_name.text);
      print(_location.text);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Success()));
    }
  }

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
