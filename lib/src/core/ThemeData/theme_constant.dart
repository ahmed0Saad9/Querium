import 'package:flutter/material.dart';
import 'package:querium/src/core/constants/color_constants.dart';

ThemeData mainTheme(Color mainColor) => ThemeData(
// brightness: Brightness.light,
      useMaterial3: false,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: mainColor,
        primaryContainer: AppColors.wight,
        secondary: mainColor,
      ),
      // textTheme:
      // TextTheme(
      //   headline1: TextStyle(color: Colors.deepPurpleAccent),
      //   headline2: TextStyle(color: Colors.deepPurpleAccent),
      //   bodyText2: TextStyle(color: Colors.deepPurpleAccent),
      //   subtitle1: TextStyle(color: AppColors.titleGray,fontSize: 16.sp,fontFamily: "Regular",),
      // ),
    );

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);
