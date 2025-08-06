import 'dart:ui';

import 'package:flutter/material.dart';

class LightAppColors {
  static const primary = Color(0xFF0066CC);
  static const onPrimary = Colors.white;
  static const secondary = Color(0xFF00A896);
  static const background = Color(0xFFF9FAFB);
  static const surface = Color(0xFFFFFFFF);
  static const onBackground = Color(0xFF1F2937);
  static const onSurface = Color(0xFF374151);
  static const error = Color(0xFFDC2626);
  static const divider = Color(0xFFE5E7EB);
  static const icon = Color(0xFF6B7280);
}

final ThemeData lightTheme = ThemeData(
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
