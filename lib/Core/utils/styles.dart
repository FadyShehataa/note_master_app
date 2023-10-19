import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_master_app/Core/utils/my_colors.dart';

abstract class Styles {
  static final textStyle16 = TextStyle(
    fontSize: 16,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    // color: MyColors.myWhite,
    fontWeight: FontWeight.w500,
  );

  static final textStyle20 = TextStyle(
    fontSize: 20,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    // color: MyColors.myWhite,
    fontWeight: FontWeight.w400,
  );

  static final textStyle26 = TextStyle(
    fontSize: 26,
    fontFamily: GoogleFonts.bebasNeue().fontFamily,
    // color: MyColors.myWhite,
    fontWeight: FontWeight.w400,
  );

  static final textStyle14 = TextStyle(
    fontSize: 14,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    // color: MyColors.myWhite,
    fontWeight: FontWeight.w400,
  );

  static final textStyle11 = TextStyle(
    fontSize: 11,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    // color: MyColors.myWhite,
    fontWeight: FontWeight.w400,
  );

  static final textStyle36 = TextStyle(
    fontSize: 36,
    fontFamily: GoogleFonts.robotoSlab().fontFamily,
    color: MyColors.myOrange,
    fontWeight: FontWeight.w400,
  );

  static final textStyle48 = TextStyle(
    fontSize: 48,
    fontFamily: GoogleFonts.robotoSlab().fontFamily,
    color: MyColors.myOrange,
    fontWeight: FontWeight.w500,
  );
}
