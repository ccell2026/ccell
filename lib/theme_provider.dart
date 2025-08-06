import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _prefs;
  bool _isDarkMode;

  bool get isDarkMode => _isDarkMode;

  ThemeNotifier() : _isDarkMode = true {
    _loadFromPrefs().then((_) {
      notifyListeners();
    });
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _saveToPrefs();
    notifyListeners();
  }

  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> _loadFromPrefs() async {
    await _initPrefs();
    _isDarkMode = _prefs?.getBool(key) ?? true;
  }

  Future<void> _saveToPrefs() async {
    await _initPrefs();
    await _prefs?.setBool(key, _isDarkMode);
  }

  ThemeData get themeData {
    return _isDarkMode ? darkTheme : lightTheme;
  }

  static Color withAlpha(Color color, int alpha) {
    return color.withAlpha(alpha);
  }

  // ======================== DARK THEME ========================
  static final darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFF001219),
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF001219),
      secondary: const Color(0xFF64B6FF),
      tertiary: const Color(0xFFA0A0A0),
      surface: const Color(0xFF1E1E1E),
      surfaceContainerHighest: const Color(0xFF2D2D2D),
      background: const Color(0xFF001219),
      error: const Color(0xFFCF6679),
      onPrimary: Colors.white,
      onSecondary: const Color(0xFF001219),
      onSurface: Color(0xFF001219),
      onSurfaceVariant: Colors.white.withOpacity(0.6),
      outline: Colors.white.withOpacity(0.1),
      brightness: Brightness.dark,
    ),
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFFA0A0A0),
      ),
    ),
    // cardTheme: CardTheme(
    //   color: const Color(0xFF1E1E1E),
    //   elevation: 0,
    //   margin: EdgeInsets.zero,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    // ),
    dividerTheme: DividerThemeData(
      color: Colors.white.withOpacity(0.1),
      thickness: 0.5,
      space: 24,
    ),
    extensions: <ThemeExtension<dynamic>>[
      DarkThemeExtension(
        textColorWhite: Colors.white,
        subtleText: const Color(0xFFA0A0A0),
        accentBlue: const Color(0xFF4E7DFF),
        cardBackground: const Color(0xFF1E1E1E),
      ),
    ],
  );

  // ======================== LIGHT THEME ========================
  static final lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF2563EB),
      secondary: Color(0xFF00B4A6),
      tertiary: Color(0xFF7C4DFF),
      surface: Color(0xFFFFFBFE),
      surfaceContainerHigh: Color(0xFFF5F5F5),
      surfaceContainerHighest: Color(0xFFE7E0EC),
      background: Color(0xFFF5F5F5),
      error: Color(0xFFBA1A1A),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Color(0xFF1C1B1F),
      onSurfaceVariant: Color(0xFF49454F),
      outline: Color(0xFFB0B0B0),
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Color(0xFF1C1B1F),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xFF1C1B1F),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFF757575),
      ),
    ),
    // cardTheme: CardTheme(
    //   color: Colors.white,
    //   elevation: 0,
    //   margin: EdgeInsets.zero,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    // ),
    dividerTheme: const DividerThemeData(
      color: Color(0xFFEEEEEE),
      thickness: 0.5,
      space: 24,
    ),
    extensions: <ThemeExtension<dynamic>>[
      LightThemeExtension(
        textColorBlack: const Color(0xFF1C1B1F),
        subtleText: const Color(0xFF757575),
        accentBlue: const Color(0xFF2563EB),
        cardBackground: Colors.white,
      ),
    ],
  );
}

// ======================== DARK THEME EXTENSION ========================
@immutable
class DarkThemeExtension extends ThemeExtension<DarkThemeExtension> {
  final Color textColorWhite;
  final Color subtleText;
  final Color accentBlue;
  final Color cardBackground;

  const DarkThemeExtension({
    required this.textColorWhite,
    required this.subtleText,
    required this.accentBlue,
    required this.cardBackground,
  });

  @override
  DarkThemeExtension copyWith({
    Color? textColorWhite,
    Color? subtleText,
    Color? accentBlue,
    Color? cardBackground,
  }) {
    return DarkThemeExtension(
      textColorWhite: textColorWhite ?? this.textColorWhite,
      subtleText: subtleText ?? this.subtleText,
      accentBlue: accentBlue ?? this.accentBlue,
      cardBackground: cardBackground ?? this.cardBackground,
    );
  }

  @override
  DarkThemeExtension lerp(ThemeExtension<DarkThemeExtension>? other, double t) {
    if (other is! DarkThemeExtension) {
      return this;
    }
    return DarkThemeExtension(
      textColorWhite: Color.lerp(textColorWhite, other.textColorWhite, t) ?? textColorWhite,
      subtleText: Color.lerp(subtleText, other.subtleText, t) ?? subtleText,
      accentBlue: Color.lerp(accentBlue, other.accentBlue, t) ?? accentBlue,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t) ?? cardBackground,
    );
  }
}

// ======================== LIGHT THEME EXTENSION ========================
@immutable
class LightThemeExtension extends ThemeExtension<LightThemeExtension> {
  final Color textColorBlack;
  final Color subtleText;
  final Color accentBlue;
  final Color cardBackground;

  const LightThemeExtension({
    required this.textColorBlack,
    required this.subtleText,
    required this.accentBlue,
    required this.cardBackground,
  });

  @override
  LightThemeExtension copyWith({
    Color? textColorBlack,
    Color? subtleText,
    Color? accentBlue,
    Color? cardBackground,
  }) {
    return LightThemeExtension(
      textColorBlack: textColorBlack ?? this.textColorBlack,
      subtleText: subtleText ?? this.subtleText,
      accentBlue: accentBlue ?? this.accentBlue,
      cardBackground: cardBackground ?? this.cardBackground,
    );
  }

  @override
  LightThemeExtension lerp(ThemeExtension<LightThemeExtension>? other, double t) {
    if (other is! LightThemeExtension) {
      return this;
    }
    return LightThemeExtension(
      textColorBlack: Color.lerp(textColorBlack, other.textColorBlack, t) ?? textColorBlack,
      subtleText: Color.lerp(subtleText, other.subtleText, t) ?? subtleText,
      accentBlue: Color.lerp(accentBlue, other.accentBlue, t) ?? accentBlue,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t) ?? cardBackground,
    );
  }
}