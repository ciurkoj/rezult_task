import 'package:flutter/material.dart';
import 'package:rezult_test/src/theme/application/theme_application.dart';

class ThemeDark extends ApplicationTheme {
  static ThemeDark? _instance;

  static ThemeDark get instance {
    _instance ??= ThemeDark._init();
    return _instance!;
  }

  static const _primary = Colors.blue;

  ThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _primary,
          brightness: Brightness.dark,
          primary: _primary,
          background: Color(0xff2E2F34)
        ),
      );
}
