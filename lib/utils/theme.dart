import 'package:flutter/material.dart';
import 'package:get_it_done/utils/colors.dart';

final theme = ThemeData(
  fontFamily: 'Nunito',
  textTheme: const TextTheme(
    displaySmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  ),
  primaryColor: pink,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(pink),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000.0),
        ),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(Colors.grey.shade900),
      overlayColor: MaterialStateProperty.all(pink.withOpacity(0.1)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1000.0),
        ),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    toolbarHeight: 70.0,
    centerTitle: true,
    color: Colors.white,
    foregroundColor: Colors.grey.shade900,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20.0),
      ),
    ),
    titleTextStyle: TextStyle(
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w500,
      color: Colors.grey.shade900,
      fontSize: 20.0,
    ),
    elevation: 2.0,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    fillColor: pink,
    focusColor: pink,
  ),
);
