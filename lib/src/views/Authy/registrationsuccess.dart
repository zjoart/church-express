import 'package:churchexpress/src/helpers/enummode.dart';
import 'package:churchexpress/src/helpers/images.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/viewmodels/shared.dart';
import 'package:churchexpress/src/views/welcome/home.dart';
import 'package:churchexpress/src/widgets/AuthyWidgets/button.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width; 
    Style style = Style(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: width,
                  //height: height * 0.5,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                     boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 5,
                              offset: Offset(0, 1))
                        ],
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      style.ySpace(5),
                      CircleAvatar(
                        backgroundColor: Colors.green,
                        minRadius: 40,
                        child: Image.asset(done)
                      ),
                       style.ySpace(2),
                      Text(
                        'Submitted',
                        style: nstyle.copyWith(
                            fontSize: SizeConfig.textSize(context, 6.5),
                            fontWeight: FontWeight.w700),
                      ),
                       style.ySpace(2),
                      Container(
                        width: SizeConfig.xMargin(context, 75),
                        child: Text(
                          'Thanks for submitting your details. We are working on creating your profile and will get back to you soon. Thank you!',
                          style: nstyle.copyWith(
                              fontSize: SizeConfig.textSize(context, 5),
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ),
                       style.ySpace(5),
                    ],
                  ),
                ),
                
              ),
              style.ySpace(7),
              Button(width: width, press: goTo, text: 'Continue')
            ],
          ),
        ),
      ),
    );
  }
  goTo(){
   Shared().setmode(true).then((value) => {
       Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen(mode: AuthyMode.SINGUP,)))
   });
   
  }
}
