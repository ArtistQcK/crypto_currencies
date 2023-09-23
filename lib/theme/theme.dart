import 'package:flutter/material.dart';

final darkTheme = ThemeData(
scaffoldBackgroundColor: Colors.grey[900],
primarySwatch: Colors.yellow,
dividerColor: Colors.white12,
listTileTheme: ListTileThemeData(iconColor: Colors.white54),
appBarTheme: AppBarTheme(
  elevation: 5,
centerTitle: true,
backgroundColor: Colors.grey[900],
titleTextStyle: TextStyle(
color: Colors.white,
fontSize: 20,
fontWeight: FontWeight.w700)),
textTheme: TextTheme(
bodyMedium: TextStyle(
color: Colors.white,
fontSize: 20,
fontWeight: FontWeight.w700),
bodySmall: TextStyle(
color: Colors.white.withOpacity(0.6),
fontSize: 14,
fontWeight: FontWeight.w700)));