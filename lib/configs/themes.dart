import 'package:flutter/material.dart';
import 'package:flutter_flashcard/configs/constants.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  primaryColor: kCyanBlue,

  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: GoogleFonts.notoSans().fontFamily
    ),
    displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 58,
        fontFamily: GoogleFonts.notoSans().fontFamily,
        fontWeight: FontWeight.bold,
    ),
  ),

  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.notoSans().fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: kCyanBlue,
  ),
scaffoldBackgroundColor: kGray
);