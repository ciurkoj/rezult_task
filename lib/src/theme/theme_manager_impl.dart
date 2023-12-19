
import 'package:flutter/material.dart';
import 'package:rezult_test/src/theme/application/types/theme_dark.dart';
import 'package:rezult_test/src/theme/application/types/theme_light.dart';
import 'package:rezult_test/src/theme/application/types/theme_wcag.dart';
import 'package:rezult_test/src/theme/theme_manage_interface.dart';

class ThemeManagerImpl extends ChangeNotifier implements ThemeManagerInterface {
  static ThemeManagerImpl? _instance;

  static ThemeManagerImpl get instance {
    _instance ??= ThemeManagerImpl._init();
    return _instance!;
  }

  ThemeManagerImpl._init();

  @override
  ThemeData get lightTheme => ThemeLight.instance.theme;

  @override
  ThemeData get darkTheme => ThemeDark.instance.theme;

  @override
  ThemeData get wcagTheme => ThemeWcag.instance.theme;
}
