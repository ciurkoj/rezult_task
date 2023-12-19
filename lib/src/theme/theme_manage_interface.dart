import 'package:flutter/material.dart';

abstract class ThemeManagerInterface {
  ThemeData get lightTheme;

  ThemeData get darkTheme;

  ThemeData get wcagTheme;
}
