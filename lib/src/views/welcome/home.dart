import 'package:churchexpress/src/helpers/enummode.dart';
import 'package:churchexpress/src/views/welcome/homeviews.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.mode});
  final AuthyMode mode;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: widget.mode == AuthyMode.SINGUP ? SignUpView() : LoginHome()
    );
  }
}