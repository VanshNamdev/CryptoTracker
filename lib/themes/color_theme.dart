import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontFamily: GoogleFonts.roboto(fontWeight: FontWeight.w600).fontFamily,
    ),
    bodyMedium: const TextStyle(color: Colors.black54),
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontFamily: GoogleFonts.roboto(fontWeight: FontWeight.w900).fontFamily,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[200],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
      borderSide: BorderSide.none,
    ),
    hintStyle: const TextStyle(color: Colors.grey),
  ),
  cardColor: Colors.white,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.grey,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: GoogleFonts.roboto(fontWeight: FontWeight.w600).fontFamily,
    ),
    bodyMedium: TextStyle(
      color: Colors.white70,
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: GoogleFonts.roboto(fontWeight: FontWeight.w900).fontFamily,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Colors.grey[500],
    ),
    filled: true,
    fillColor: Color.fromARGB(255, 40, 40, 40),
    contentPadding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 50),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: BorderSide.none,
    ),
  ),
  cardColor: Colors.black
);
