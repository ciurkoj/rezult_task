import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rezult_test/generated/l10n.dart';

import '../theme/theme_manager_impl.dart';

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ThemeData get lightTheme => watch<ThemeManagerImpl>().lightTheme;

  ThemeData get darkTheme => read<ThemeManagerImpl>().darkTheme;

  ThemeData get wcagTheme => read<ThemeManagerImpl>().wcagTheme;
  TestLocalization get localizations => TestLocalization.of(this)!;


}
