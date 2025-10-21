
import 'package:flutter/material.dart';
import 'package:login_page/core/theme/light_app_colours.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightAppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: LightAppColors.primary,
      foregroundColor: LightAppColors.onPrimary,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light(
      primary: LightAppColors.primary,
      secondary: LightAppColors.secondary,
      background: LightAppColors.background,
      surface: LightAppColors.surface,
      error: LightAppColors.error,
      onPrimary: LightAppColors.onPrimary,
      onSecondary: LightAppColors.onPrimary,
      onBackground: LightAppColors.onBackground,
      onSurface: LightAppColors.onSurface,
      onError: Colors.white,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: LightAppColors.onBackground),
      titleLarge: TextStyle(color: LightAppColors.primary),
      labelLarge: TextStyle(color: LightAppColors.secondary),
    ),
    cardTheme: const CardThemeData(
      color: LightAppColors.surface,
      elevation: 1,
      margin: EdgeInsets.all(8),
    ),
    dividerColor: LightAppColors.divider,
    iconTheme: const IconThemeData(color: LightAppColors.icon),
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1F1F1F),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFBB86FC),
      secondary: Color(0xFF03DAC6),
      background: Color(0xFF121212),
      surface: Color(0xFF1F1F1F),
      error: Color(0xFFCF6679),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onBackground: Colors.white,
      onSurface: Colors.white,
      onError: Colors.black,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Color(0xFFBB86FC)),
      labelLarge: TextStyle(color: Color(0xFF03DAC6)),
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFF1F1F1F),
      elevation: 1,
      margin: EdgeInsets.all(8),
    ),
    dividerColor: Colors.grey,
    iconTheme: const IconThemeData(color: Colors.white),
    useMaterial3: true,
  );
}
