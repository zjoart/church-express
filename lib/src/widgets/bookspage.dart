
import 'package:churchexpress/src/helpers/images.dart';
import 'package:churchexpress/src/helpers/style.dart';
import 'package:churchexpress/src/views/books/booksview.dart';
import 'package:churchexpress/src/widgets/appbar.dart';
import 'package:churchexpress/src/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:churchexpress/src/helpers/responsive.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({
    Key key,
    @required this.style,
  }) : super(key: key);

  final Style style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: (){
           goTo(context, BooksView());
        },
              child: Container(
          padding:
              const EdgeInsets.only(left: 10, right: 20, top:10, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: SizeConfig.xMargin(context, 26),
                  height: SizeConfig.yMargin(context, 20),
                  child: bannerImage(book)),
                  SizedBox(width:  SizeConfig.xMargin(context, 3),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Knowing God Pt 1',
                    style: nstyle.copyWith(
                        fontSize: SizeConfig.textSize(context, 5.5)),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bishop T.D jakes',
                    style: nstyle.copyWith(
                        fontSize: SizeConfig.textSize(context, 4.5)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Libero cursus Lorem ipsum dolor sit amet, ',
                        softWrap: true,
                        maxLines: 3,
                        
                        style: nstyle.copyWith(
                            fontSize: SizeConfig.textSize(context, 3.5), color: Colors.black54),
                  ),),
                  SizedBox(height: 10),
                  Text(
                    '#1,500.00',
                    style: nstyle.copyWith(
                        fontSize: SizeConfig.textSize(context, 4.5), fontWeight: FontWeight.w700),
                  ),
                    SizedBox(height: 5),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(' ⭐⭐⭐⭐⭐'),
                       style.xSpace(4),
                       Text(
                        '580 reviews',
                        style: nstyle.copyWith(
                            fontSize: SizeConfig.textSize(context, 4), color: Colors.black54),
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
