
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:techblog/color_Manager.dart';
import 'dart:ui';

class TextStyleManager {
  TextStyleManager._();

  static TextStyle posterTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: SolidColors.posterTitle,
  );

  static TextStyle posterSubTitle = TextStyle(
    fontFamily: "dana",
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: SolidColors.posterSubTitle,
  ) ;

  static TextStyle tagTextStyle = TextStyle(
    fontFamily: "dana",
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: SolidColors.hashTag,
  ) ;
  static TextStyle viewHotestBlog = TextStyle(
    fontFamily: "dana",
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: SolidColors.seeMore,
  ) ;
  static TextStyle blogListtitle= TextStyle(
    fontFamily: "dana",
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: const Color.fromARGB(255, 7, 7, 7),
  ) ;

  static TextStyle profilename= TextStyle(
    fontFamily: "dana",
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: const Color.fromARGB(255, 7, 7, 7),
  ) ;

  static TextStyle profileBotton= TextStyle(
    fontFamily: "dana",
    fontSize: 15,
    fontWeight: FontWeight.w900,
    color: const Color.fromARGB(255, 7, 7, 7),
  ) ;
  static TextStyle logOutButtonstyle= TextStyle(
    fontFamily: "dana",
    fontSize: 15,
    fontWeight: FontWeight.w900,
    color: Color.fromARGB(255, 219, 9, 9),
  ) ;


}
