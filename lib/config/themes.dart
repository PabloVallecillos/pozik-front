import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/custom_material_color.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: CustomMaterialColor(primary.red, primary.green, primary.blue).mdColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.black,
    actionsIconTheme: IconThemeData(
      color: Colors.black
    ),
    iconTheme: IconThemeData(
      color: Colors.black
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: GoogleFonts.comfortaa(
      fontWeight: FontWeight.bold
    ),
    unselectedLabelStyle: GoogleFonts.comfortaa(
      fontWeight: FontWeight.normal
    ),
    labelColor: Colors.black,
  ),
  brightness: Brightness.light,
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.all(15),
    border: OutlineInputBorder(),
    floatingLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        color: primary
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        width: 2,
        color: red
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        width: 3,
        color: red
      ),
    ),
    errorStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: red
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        width: 2,
        color: primary,
      ),
    ),
    labelStyle: TextStyle(color: Colors.white),
  ),
  colorScheme: const ColorScheme(
    error: red,
    onError: red,
    brightness: Brightness.light,
    primary: primary,
    secondary: secondary,
    onPrimary: primary,
    onSecondary: secondary,
    background: Color(0xfff7f7f7),
    onBackground: Color(0xfff7f7f7),
    surface: Color(0xfff7f7f7),
    onSurface: Color(0xfff7f7f7),
  ),
  textTheme: GoogleFonts.comfortaaTextTheme(
    const TextTheme(
      subtitle1: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.white12),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        )
      )
    )
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: CustomMaterialColor(primary.red, primary.green, primary.blue).mdColor,
  brightness: Brightness.dark,
  tabBarTheme: TabBarTheme(
    labelStyle: GoogleFonts.comfortaa(
      fontWeight: FontWeight.bold
    ),
    unselectedLabelStyle: GoogleFonts.comfortaa(
      fontWeight: FontWeight.normal
    ),
    labelColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.white,
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.all(15),
    isDense: true,
    border: OutlineInputBorder(),
    floatingLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        color: primary
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        width: 2,
        color: red
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        width: 3,
        color: red
      ),
    ),
    errorStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: red
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      borderSide: BorderSide(
        width: 2,
        color: primary
      ),
    ),
    focusColor: Color(0xfff7f7f7),
    labelStyle: TextStyle(
      color: Colors.white
    ),
  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  colorScheme: const ColorScheme(
    error: red,
    onError: red,
    brightness: Brightness.dark,
    primary: primary,
    secondary: secondary,
    onPrimary: primary,
    onSecondary: secondary,
    background: Color(0xfff7f7f7),
    onBackground: Color(0xfff7f7f7),
    surface: Color(0xfff7f7f7),
    onSurface: Color(0xfff7f7f7),
  ),
  textTheme: GoogleFonts.comfortaaTextTheme(
    const TextTheme(
      subtitle1: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.white12),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        )
      )
    )
  ),
);