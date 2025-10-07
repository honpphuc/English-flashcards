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
  ),

  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.notoSans().fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: kCyanBlue,
  ),
scaffoldBackgroundColor: kGray
);