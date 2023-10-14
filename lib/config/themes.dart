import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/material/custom_material_color.dart';
import 'colors.dart';
import 'layout.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primarySwatch: CustomMaterialColor(primary.red, primary.green, primary.blue).mdColor,
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radiusCircular)
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(primary),
  ),
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
  navigationBarTheme: NavigationBarThemeData(
    indicatorColor: primary, // Color of the selected tab indicator
    iconTheme: MaterialStateProperty.all(const IconThemeData(color: Colors.white)), // Color of navigation bar icons
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold
    ),
    unselectedLabelStyle: GoogleFonts.montserrat(
      fontWeight: FontWeight.normal
    ),
    labelColor: Colors.black,
  ),
  brightness: Brightness.light,
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.all(15),
    floatingLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: primary
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radiusCircular)),
      borderSide: BorderSide(
        width: 2,
        color: primary,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radiusCircular)),
      borderSide: BorderSide(
        width: 2,
        color: red
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radiusCircular)),
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
      borderRadius: BorderRadius.all(Radius.circular(radiusCircular)),
      borderSide: BorderSide(
        width: 2,
        color: primary,
      ),
    ),
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: primary
    )
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
  textTheme: GoogleFonts.montserratTextTheme(
    TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w900
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500
      ),
    )
  ),
  pageTransitionsTheme: const PageTransitionsTheme(builders: <TargetPlatform, PageTransitionsBuilder>{
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  }),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radiusCircular)
      ),
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radiusCircular),
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  primarySwatch: CustomMaterialColor(primary.red, primary.green, primary.blue).mdColor,
  brightness: Brightness.dark,
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.all(primary),
  ),
  listTileTheme: ListTileThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radiusCircular)
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelStyle: GoogleFonts.montserrat(
      fontWeight: FontWeight.bold
    ),
    unselectedLabelStyle: GoogleFonts.montserrat(
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
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    contentPadding: EdgeInsets.all(15),
    isDense: true,
    floatingLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radiusCircular)),
      borderSide: BorderSide(
        color: primary
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radiusCircular)),
      borderSide: BorderSide(
        width: 2,
        color: red
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radiusCircular)),
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
      borderRadius: BorderRadius.all(Radius.circular(radiusCircular)),
      borderSide: BorderSide(
        width: 2,
        color: primary
      ),
    ),
    focusColor: Color(0xfff7f7f7),
    labelStyle: TextStyle(
      color: primary
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
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  textTheme: GoogleFonts.montserratTextTheme(
    TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w900
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500
      )
    )
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
