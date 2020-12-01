import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';

class BodyTile extends StatelessWidget {
  const BodyTile({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        bodyTiles(
            'A musical concert connecting people to God',
            'December 6,2019',
            '6.00pm - Till Dawn',
            () {},
            'Assets/images/experience.png',context),
        bodyTiles(
            'A musical concert connecting people to God',
            'December 6,2019',
            '6.00pm - Till Dawn',
            () {},
            'Assets/images/anomaly.png',context),
        bodyTiles(
            'A musical concert connecting people to God',
            'December 6,2019',
            '6.00pm - Till Dawn',
            () {},
            'Assets/images/experience.png',context),
        bodyTiles(
            'A musical concert connecting people to God',
            'December 6,2019',
            '6.00pm - Till Dawn',
            () {},
            'Assets/images/anomaly.png',context),
        SizedBox(height: 20)
      ],
    );
  }

  Widget bodyTiles(
    String head,
    String body,
    String time,
    Function press,
    String image,
    BuildContext context
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          // color: Colors.grey.withOpacity(0.2),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                blurRadius: 4,
                spreadRadius: 0,
                offset: Offset(0, 4)),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 90.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        head,
                        style: nstyle.copyWith(
                             fontSize: SizeConfig.textSize(context, 3.5),
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 3.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                body,
                                style: nstyle.copyWith(
                                   fontSize: SizeConfig.textSize(context, 3.5),
                                    color: Color(0xFF000000).withOpacity(0.7),
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                time,
                                style: nstyle.copyWith(
                                  fontSize: SizeConfig.textSize(context, 3),
                                    color: Color(0xFF000000).withOpacity(0.4),
                                    fontWeight: FontWeight.w300,letterSpacing: 0.2),
                                    
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: press,
                            child: Container(
                              height: 25.0,
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3.0, horizontal: 15.0),
                                child: Text("Add to calendar",
                                    style: nstyle.copyWith(
                                        fontSize: 10, color: yellow)),
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xFF262F3A),
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 160.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
