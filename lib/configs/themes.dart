import 'package:flutter/material.dart';
import 'package:flutter_flashcard/configs/constants.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
  primaryColor: kCyanBlue,

  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: GoogleFonts.notoSans().fontFamily,
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
  scaffoldBackgroundColor: kGray,
  dialogTheme: DialogThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kCircularBorderRadius),
    ),
    backgroundColor: kCyanBlue,
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.notoSans().fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCircularBorderRadius),
        side: BorderSide(color: Colors.white),
      ),
      backgroundColor: kCyanBlue,
      textStyle: TextStyle(
        fontFamily: GoogleFonts.notoSans().fontFamily,
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: kCyanBlue,
    linearTrackColor: Colors.grey,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.all<Color>(Colors.white),
  ),
  listTileTheme: ListTileThemeData(
    tileColor: kCyanBlue,
    textColor: Colors.white,
    iconColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kCircularBorderRadius),
      side: BorderSide(
        color: Colors.white,
        width: 2,
      )
    )
  )
);
