import 'package:flutter/material.dart';
import 'package:rezult_test/src/theme/application/theme_application.dart';

class ThemeLight implements ApplicationTheme {
  static ThemeLight? _instance;

  static ThemeLight get instance {
    _instance ??= ThemeLight._init();
    return _instance!;
  }

  static const _primary = Color(0xff42a5f5);

  ThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          background: Colors.teal.shade50,
          seedColor: _primary,
          brightness: Brightness.light,
          primary: _primary,
        ),
      );
}
