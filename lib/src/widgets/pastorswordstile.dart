
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/widgets/appbar.dart';

import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';
import 'package:churchexpress/src/helpers/images.dart';

class PastorsWordsTile extends StatelessWidget {
  const PastorsWordsTile({
    Key key, this.press
  }) : super(key: key);
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: GestureDetector(
        onTap: press,
              child: Container(
          padding:const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
               borderRadius: BorderRadius.circular(10),
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                width: SizeConfig.xMargin(context, 15),
                height: 100,
                child: bannerImage(message)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Get Ready for Greatness', style: nstyle.copyWith(
                         fontSize: SizeConfig.textSize(context, 5))),
                       SizedBox(width: 10),
                         Icon(Icons.tv)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
         text: "Upload Date: ",
         style: nstyle.copyWith(
             color: Colors.green,
             fontSize: SizeConfig.textSize(context, 2.6)),
         children: [
           TextSpan(
             text: "14-10-19",
             style: nstyle.copyWith(
                 color: Colors.black.withOpacity(0.6),
                 fontSize: SizeConfig.textSize(context, 2.6)),
           )
         ]),
        ),
         SizedBox(width: 10),
        Container(
          height:  30,
          width: SizeConfig.xMargin(context, 0.8),
          color: Colors.black,
        ),
         SizedBox(width: 10),
         RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
         text: "Expire Date: ",
         style: nstyle.copyWith(
             color: Colors.red,
             fontSize: SizeConfig.textSize(context, 2.6)),
         children: [
           TextSpan(
             text: "14-10-19",
             style: nstyle.copyWith(
                 color: Colors.black.withOpacity(0.6),
                 fontSize: SizeConfig.textSize(context, 2.6)),
           )
         ]),
        ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
