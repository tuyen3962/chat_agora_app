import 'package:flutter/material.dart';
import 'package:mobileapp/common/component/component.dart';

final ThemeData lightThemeData = ThemeData(
  fontFamily: 'Manrope',
  primaryColor: Component.color.primaryColor,
  colorScheme: ColorScheme.light(primary: Component.color.primaryColor, background: Component.color.background),
  scaffoldBackgroundColor: Component.color.background,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Component.color.background),
  dialogBackgroundColor: Component.color.background,
  inputDecorationTheme: InputDecorationTheme(fillColor: Component.color.grey100),
);

final ThemeData darkThemeData = ThemeData(
  fontFamily: 'Manrope',
  primaryColor: Component.color.primaryColor,
  colorScheme: ColorScheme.dark(primary: Component.color.primaryColor, background: Component.color.darkBackground),
  scaffoldBackgroundColor: Component.color.darkBackground,
  textTheme: TextTheme().apply(bodyColor: Component.color.grey300),
  primaryTextTheme: TextTheme().apply(bodyColor: Component.color.grey300),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Component.color.darkBackground),
  dialogBackgroundColor: Component.color.darkBackground,
  inputDecorationTheme: InputDecorationTheme(fillColor: Component.color.grey900),
);
