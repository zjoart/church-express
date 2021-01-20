import 'dart:io';

import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Give extends StatefulWidget {
  @override
  _GiveState createState() => _GiveState();
}

class _GiveState extends State<Give> {
  var publicKey = 'pk_test_b80c8aeef509570aaf0654e8e768d1a3ec0e605c';

  final GlobalKey<ScaffoldState> _scaffoldlKey = new GlobalKey();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _donateformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _offeringformKey = GlobalKey<FormState>();

  String _cardNumber;
  String _cvv;
  int _expiryMonth = 0;
  int _expiryYear = 0;
  int _amountToDonate = 500000;
  String _email;

  bool _inProgress = false;

  bool isDonateVisible = false;
  bool isTitheVisible = false;
  bool isOfferingVisible = false;

  @override
  void initState() {
    PaystackPlugin.initialize(publicKey: publicKey);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldlKey,
      appBar: AppBar(
          title: Text(
            "Giving",
            style: appBarTextStyle,
          ),
          backgroundColor: blueblack,
          leading: IconButton(
              icon: Image.asset("Assets/icons/drawer.png"),
              onPressed: () {
                _scaffoldlKey.currentState.openDrawer();
              })),
      drawer: SignDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("Assets/images/giving.png"), fit: BoxFit.fill)
              ),
            ),

            //Donate Button
            GestureDetector(
              onTap: () {
                setState(() {
                  isDonateVisible = !isDonateVisible;
                  if (isTitheVisible == true) {
                    isTitheVisible = !isTitheVisible;
                  }
                  if (isOfferingVisible == true) {
                    isOfferingVisible = !isOfferingVisible;
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.donate, color: yellow,),
                        SizedBox(width: 20.0,),
                        Text("Donate", style: donateTtitleStyle,)
                      ],
                    ),
                  ),
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: blueblack,
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
              ),
            ),

            isDonateVisible ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                  key: _donateformKey,
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      ListTile(
                        title: TextFormField(
                          style: welcomeTextField,
                          decoration: InputDecoration(
                              hintText: "Enter Amount",
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
                              labelText: 'Enter Amount',
                              labelStyle: welcomeTextField),
                          initialValue: "",
                          onSaved: (val) => _amountToDonate = int.tryParse(val) * 100,
                          validator: (val) =>
                          val == "" ? "Enter Amount" : null,
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  _handleDonateCheckout(context);
                                },
                                padding: EdgeInsets.symmetric(vertical: 13.0),
                                color: yellow,
                                child: Text(
                                  "Donate",
                                  style: welcomeSubmitButton,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  )),
            ) : SizedBox.shrink(),

            GestureDetector(
              onTap: () {
                setState(() {
                  isTitheVisible = !isTitheVisible;
                  if (isDonateVisible == true) {
                    isDonateVisible = !isDonateVisible;
                  }
                  if (isOfferingVisible == true) {
                    isOfferingVisible = !isOfferingVisible;
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.moneyBill, color: yellow,),
                        SizedBox(width: 20.0,),
                        Text("Tithe", style: donateTtitleStyle,)
                      ],
                    ),
                  ),
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: blueblack,
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
              ),
            ),

            isTitheVisible ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                  key: _formKey,
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      ListTile(
                        title: TextFormField(
                          style: welcomeTextField,
                          decoration: InputDecoration(
                              hintText: "Enter Amount",
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
                              labelText: 'Enter Amount',
                              labelStyle: welcomeTextField),
                          initialValue: "",
                          onSaved: (val) => _amountToDonate = int.tryParse(val) * 100,
                          validator: (val) =>
                          val == "" ? "Enter Amount" : null,
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  _handleCheckout(context);
                                },
                                padding: EdgeInsets.symmetric(vertical: 13.0),
                                color: yellow,
                                child: Text(
                                  "Donate",
                                  style: welcomeSubmitButton,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  )),
            ) : SizedBox.shrink(),

            GestureDetector(
              onTap: () {
                setState(() {
                  isOfferingVisible = !isOfferingVisible;
                  if (isDonateVisible == true) {
                    isDonateVisible = !isDonateVisible;
                  }
                  if (isTitheVisible == true) {
                    isTitheVisible = !isTitheVisible;
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.moneyBill, color: yellow,),
                        SizedBox(width: 20.0,),
                        Text("Offering", style: donateTtitleStyle,)
                      ],
                    ),
                  ),
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: blueblack,
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                ),
              ),
            ),

            isOfferingVisible ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Form(
                  key: _offeringformKey,
                  child: Flex(
                    direction: Axis.vertical,
                    children: <Widget>[
                      ListTile(
                        title: TextFormField(
                          style: welcomeTextField,
                          decoration: InputDecoration(
                              hintText: "Enter Amount",
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
                              labelText: 'Enter Amount',
                              labelStyle: welcomeTextField),
                          initialValue: "",
                          onSaved: (val) => _amountToDonate = int.tryParse(val) * 100,
                          validator: (val) =>
                          val == "" ? "Enter Amount" : null,
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                onPressed: () {
                                  _handleCheckout(context);
                                },
                                padding: EdgeInsets.symmetric(vertical: 13.0),
                                color: yellow,
                                child: Text(
                                  "Donate",
                                  style: welcomeSubmitButton,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  )),
            ) : SizedBox.shrink()


          ],
        ),
      )
    );
  }



  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: _cardNumber,
      cvc: _cvv,
      expiryMonth: _expiryMonth,
      expiryYear: _expiryYear,
    );
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  _showTheMessage(String message,
      [Duration duration = const Duration(seconds: 4)]) {
    print(message);
  }

  _updateStatus(String reference, String message) {
    _showTheMessage('Reference: $reference \n\ Response: $message',
        const Duration(seconds: 7));
  }

  _handleCheckout(BuildContext context) async   {
    final FormState formState = _formKey.currentState;
    print("Start validation");
    if (formState.validate()) {

      print("Validated");
      formState.save();
      Charge charge = Charge()
        ..amount = _amountToDonate // In base currency
        ..email = 'jjjjjjj@gmail.com'
        ..card = _getCardFromUI();

      print(_email);
      charge.reference = _getReference();

      try {
        CheckoutResponse response = await PaystackPlugin.checkout(
          context,
          method: CheckoutMethod.card,
          charge: charge,
          fullscreen: false,
          logo: MyLogo(),
        );
        print('Response = $response');
        setState(() => _inProgress = false);
        _updateStatus(response.reference, '$response');
      } catch (e) {
        setState(() => _inProgress = false);
        _showTheMessage("Check console for error");
//        _showMessage("Check console for error");
        rethrow;
      }
    }
  }

  _handleDonateCheckout(BuildContext context) async   {
    final FormState formState = _donateformKey.currentState;
    print("Start validation");
    if (formState.validate()) {

      print("Validated");
      formState.save();
      Charge charge = Charge()
        ..amount = _amountToDonate // In base currency
        ..email = _email
        ..card = _getCardFromUI();

      print(_email);
      charge.reference = _getReference();

      try {
        CheckoutResponse response = await PaystackPlugin.checkout(
          context,
          method: CheckoutMethod.card,
          charge: charge,
          fullscreen: false,
          logo: MyLogo(),
        );
        print('Response = $response');
        setState(() => _inProgress = false);
        _updateStatus(response.reference, '$response');
      } catch (e) {
        setState(() => _inProgress = false);
        _showTheMessage("Check console for error");
//        _showMessage("Check console for error");
        rethrow;
      }
    }
  }
}
class MyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: blueblack,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Text(
        "AT",
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
