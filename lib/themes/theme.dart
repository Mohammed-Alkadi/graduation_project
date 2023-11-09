import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData().copyWith(
  textTheme: GoogleFonts.latoTextTheme().copyWith(
      titleLarge: const TextStyle(
    color: Color.fromARGB(255, 247, 248, 253),
  )),
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 8, 14, 32),
    primary: Color.fromARGB(255, 28, 46, 109), // button color
    onPrimary: Color.fromARGB(255, 247, 248, 253), //text color
    secondary: Color.fromARGB(255, 13, 20, 49), // meta's containers
    onSecondary: Color.fromARGB(255, 14, 71, 210), //pressed tab bar item
    onSecondaryContainer:
        Color.fromARGB(255, 150, 181, 255), //unselected tab bar item
    //unselected tab bar item
    primaryContainer: Color.fromARGB(255, 16, 22, 39), //nawaf's containers
    secondaryContainer: Color.fromARGB(255, 60, 92, 205), //accent
    onBackground: const Color.fromRGBO(80, 80, 174, 1.0), //card bacground color
  ),
);
