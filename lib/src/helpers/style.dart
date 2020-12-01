import 'package:churchexpress/src/helpers/colorfonts.dart';
import 'package:flutter/cupertino.dart';
import './responsive.dart';

TextStyle splashhead = TextStyle(
    fontSize: 18.0,
    color: Color(0xFF262F3A),
    fontWeight: FontWeight.w600,
    fontFamily: nfont);
TextStyle splashbody = TextStyle(
    fontSize: 14.0,
    color: Color(0xFF262F3A),
    fontWeight: FontWeight.w400,
    fontFamily: nfont);
TextStyle nstyle = TextStyle(
  fontFamily: nfont,
  color: Color(0xFF262F3A),
);


class Style {
  Style(this.context);
  final BuildContext context;
  
  Widget ySpace(double i) {
    return SizedBox(height: SizeConfig.yMargin(context, i));
  }

  Widget xSpace(double i) {
    return SizedBox(width: SizeConfig.xMargin(context, i));
  }
}


TextStyle appBarTextStyle = nstyle.copyWith(fontSize: 18.0, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w600);

TextStyle bottomNavBarTextStyle = nstyle.copyWith();

TextStyle drawerHeaderStyle = nstyle.copyWith(fontSize: 18.0, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w700, letterSpacing: 1.2,);
TextStyle drawerItemsStyle = nstyle.copyWith(fontSize: 14.0, color: Color(0xFF000000), fontWeight: FontWeight.w500, letterSpacing: 1.2);
TextStyle drawerSignOutItemsStyle = nstyle.copyWith(fontSize: 12.0, color: Color(0xFF000000), fontWeight: FontWeight.w500, letterSpacing: 1.0);

TextStyle noteTitleStyle = nstyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w700, color: Color(0xFF000000));
TextStyle noteTextStyle = nstyle.copyWith(fontSize: 16.0, fontWeight: FontWeight.w400, color: Color(0xFF000000), letterSpacing: 1.5);

TextStyle noteButtonStyle = nstyle.copyWith(fontSize: 12.0, fontWeight: FontWeight.w800, color: Color(0xFFFFFFFF), letterSpacing: 1.5);

TextStyle welcomeListTitle = nstyle.copyWith(fontSize: 12.0, color: Color(0xFF000000).withOpacity(0.6), fontWeight: FontWeight.w600);
TextStyle welcomeDateTitle = nstyle.copyWith(fontSize: 12.0, color: Color(0xFF000000).withOpacity(0.7), fontWeight: FontWeight.w700);
TextStyle welcomeTimeTitle = nstyle.copyWith(fontSize: 10.0, color: Color(0xFF000000).withOpacity(0.3), fontWeight: FontWeight.w500);

TextStyle welcomeTitle = nstyle.copyWith(fontSize: 23.0, color: Color(0xFF000000), fontWeight: FontWeight.w500);
TextStyle welcomeSubTitle = nstyle.copyWith(fontSize: 12.0, color: Color(0xFF000000), fontWeight: FontWeight.w400);
TextStyle welcomeTextField = nstyle.copyWith(fontSize: 13.0, color: Color(0xFF000000), fontWeight: FontWeight.w300);
TextStyle welcomeSubmitButton = nstyle.copyWith(fontSize: 14.0, color: Color(0xFF262F3A), fontWeight: FontWeight.w500);
TextStyle welcomeNewTitle = nstyle.copyWith(fontSize: 12.0, color: Color(0xFF000000), fontWeight: FontWeight.w400);

TextStyle welcomeArticlesTextStyle = nstyle.copyWith(fontSize: 15.0, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w500, letterSpacing: 1.0);

TextStyle videoTitleStyle = nstyle.copyWith(fontSize: 11.0, color: Color(0xFF000000), fontWeight: FontWeight.w700, letterSpacing: 1.3);
TextStyle videoDescriptionStyle = nstyle.copyWith(fontSize: 10.0, color: Color(0xFF000000), fontWeight: FontWeight.w400);
TextStyle videoDateStyle = nstyle.copyWith(fontSize: 10.0, color: Color(0xFF000000).withOpacity(0.4), fontWeight: FontWeight.w400);

TextStyle splashHeaderStyle = nstyle.copyWith(fontSize: 18.0, color: Color(0xFF262F3A), fontWeight: FontWeight.w600);
TextStyle splashDescrStyle = nstyle.copyWith(fontSize: 14.0, color: Color(0xFF262F3A), fontWeight: FontWeight.w400);

TextStyle bibleTitleStyle = nstyle.copyWith(fontSize: 13.0, color: Color(0xFF262F3A), fontWeight: FontWeight.w500);
TextStyle bibleChapterStyle = nstyle.copyWith(fontSize: 18.0, color: Color(0xFF262F3A), fontWeight: FontWeight.w500);
TextStyle bibleContentStyle = nstyle.copyWith(fontSize: 14.0, color: Color(0xFF262F3A), fontWeight: FontWeight.w400, height: 2.0);

TextStyle donateTtitleStyle = nstyle.copyWith(fontSize: 14.0, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w500);

TextStyle hustleOwnerNameStyle = nstyle.copyWith(fontSize: 12.0, color: Color(0xFF000000), fontWeight: FontWeight.w500, letterSpacing: 1.0);
TextStyle hustleBusinessNameStyle = nstyle.copyWith(fontSize: 14.0, color: Color(0xFF000000), fontWeight: FontWeight.w500, letterSpacing: 1.0);
TextStyle hustlsDetailsStyle = nstyle.copyWith(fontSize: 14.0, color: Color(0xFFFFFFFF), fontWeight: FontWeight.w500, letterSpacing: 1.0);

TextStyle articleHeaderStyle = nstyle.copyWith(fontSize: 30.0, color: Color(0xFF000000), fontWeight: FontWeight.w700, letterSpacing: 1.2);
TextStyle articleSubTextStyle = nstyle.copyWith(fontSize: 11.0, color: Color(0xFF000000), fontWeight: FontWeight.w500);
TextStyle articlePhotoByStyle = nstyle.copyWith(fontSize: 11.0, color: Color(0xFF000000), fontWeight: FontWeight.w500, letterSpacing: 1.2);
TextStyle articleTextStyle = nstyle.copyWith(fontSize: 14.0, color: Color(0xFF000000), fontWeight: FontWeight.w400, letterSpacing: 1.2, height: 1.5);

