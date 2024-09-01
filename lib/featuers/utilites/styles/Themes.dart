import 'dart:ui';

import 'package:flutter/material.dart';

import 'colors.dart';


//colors :



class MyTheme {

  static ThemeData lightThemData = ThemeData(

      // appBarTheme: AppBarTheme(elevation: 0, backgroundColor: colWhiteColor),

      primarySwatch: Colors.blue,
      textTheme: TextTheme(
        displayMedium: TextStyle(color: colHaubtBlue,
          fontWeight: FontWeight.w500,
          fontSize:18.0,),
        titleLarge: TextStyle(color: colWhiteBlueColor, fontWeight: FontWeight.w500, fontSize: 30.0,),
        titleSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 30.0,),

      )
  );

  static ThemeData darkThemData = ThemeData(
      // appBarTheme: AppBarTheme(elevation: 0, backgroundColor: colPrimary),
      // bottomAppBarTheme: BottomAppBarTheme(color: colPrimary,elevation: 0,),
      // primaryColor: colPrimary,
      // cardColor: colorDarkYellowColor,
      // scaffoldBackgroundColor: colPrimary,
      primarySwatch: Colors.blue,
      textTheme: TextTheme(
      )
  );
}
