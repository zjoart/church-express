
import 'package:churchexpress/src/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';
class AuthyHead extends StatelessWidget {
  const AuthyHead({
    Key key,
    @required this.head,
    @required this.body,
  }) : super(key: key);

  final String head;
  final String body;

  @override
  Widget build(BuildContext context) {
Style style = Style(context);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            head,
            style: nstyle.copyWith(
                fontSize: SizeConfig.textSize(context, 6.5),
                fontWeight: FontWeight.w700),
          ),
          style.ySpace(2),
          Text(
            body,
            style: nstyle.copyWith(
                fontSize: SizeConfig.textSize(context, 4),
                fontWeight: FontWeight.w500,
                color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
