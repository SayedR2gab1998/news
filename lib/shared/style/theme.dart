import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontFamily: 'Jannah',
        ),
        iconTheme: IconThemeData(
            color: Colors.black
        )
    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
        backgroundColor: Colors.white,
        elevation: 20.0
    ),
  iconTheme: const IconThemeData(color: Colors.deepOrange),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme:  AppBarTheme(
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: HexColor('333739'),
        elevation: 0.0,
        titleTextStyle: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontFamily: 'Jannah',
        ),
        iconTheme: const IconThemeData(
            color: Colors.white
        )
    ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  bottomNavigationBarTheme:  BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
  ),
    iconTheme: const IconThemeData(color: Colors.deepOrange)
);