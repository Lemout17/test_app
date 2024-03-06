import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const lightThemeName = 'light_theme';
const darkThemeName = 'dark_theme';

final themes = {
  lightThemeName: _generateTheme(
    const ColorScheme(
      onPrimary: Color(0xFF000000),
      outline: Color(0xFF383838),
      primary: Color(0xFFFFFFFF),
      secondary: Color(0xFF0CBA70),
      onSecondary: Color(0xFF292929),
      background: Color(0xFF1E1E1E),
      onBackground: Color(0xFF999999),
      error: Color(0xFFCB1010),
      onError: Color(0xFF6CB2E5),
      surface: Color(0xFF6E6E6E),
      onSurface: Color(0xFF43C641),
      brightness: Brightness.light,
    ),
  ),
  darkThemeName: _generateTheme(
    const ColorScheme(
      onPrimary: Color(0xFF53575C),
      outline: Color(0xFF3B3B3B),
      primary: Color(0xFFE1E1E1),
      secondary: Color(0xFFF7FBFE),
      onSecondary: Color(0xFF8A8A8A),
      background: Color(0xFF00101C),
      onBackground: Color(0xFFE2D035),
      error: Color(0xFFCB1010),
      onError: Color(0xFF6CB2E5),
      surface: Color(0xFFA1C9E6),
      onSurface: Color(0xFF43C641),
      brightness: Brightness.dark,
    ),
  ),
};

ThemeData _generateTheme(ColorScheme colorScheme) {
  final splashColor = colorScheme.primary.withOpacity(0.2);

  final bool isDark = colorScheme.brightness == Brightness.dark;

  return ThemeData(
    useMaterial3: true,
    primaryColor: colorScheme.primary,
    primaryColorLight: colorScheme.primaryContainer,
    fontFamily: 'RF Dewi',
    disabledColor: colorScheme.background,
    scaffoldBackgroundColor: colorScheme.background,
    hintColor: colorScheme.primary.withOpacity(0.8),

    // ColorScheme
    colorScheme: colorScheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    splashFactory: InkRipple.splashFactory,
    splashColor: splashColor,
    highlightColor: Colors.transparent,

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.onBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: colorScheme.primary),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
    ),

    // BottomNavigationBar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorScheme.background,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
    ),

    // ElevatedButton theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(splashColor),
        backgroundColor: MaterialStateProperty.all(
          colorScheme.secondary,
        ),
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            vertical: 15.5,
          ),
        ),
      ),
    ),

    // Text theme
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: colorScheme.primary,
        fontSize: 19,
        fontWeight: FontWeight.w700,
        height: 1.2,
      ),
      bodyLarge: TextStyle(
        color: colorScheme.primary,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1,
      ),
      bodyMedium: TextStyle(
        color: colorScheme.primary,
        fontFamily: 'SF Pro Display',
        fontSize: 15,
        fontWeight: FontWeight.w500,
        height: 1.2,
      ),
      displayMedium: TextStyle(
        color: colorScheme.primary,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1,
      ),
      titleMedium: TextStyle(
        color: colorScheme.primary,
        fontFamily: 'SF Pro Display',
        fontSize: 13,
        fontWeight: FontWeight.w500,
        height: 1.25,
      ),
      titleSmall: TextStyle(
        color: colorScheme.primary,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.25,
      ),
      bodySmall: TextStyle(
        color: colorScheme.primary,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        height: 1.2,
      ),
      displaySmall: TextStyle(
        fontFamily: 'SF Pro Display',
        color: colorScheme.secondary,
        fontSize: 10,
        fontWeight: FontWeight.w500,
        height: 1.2,
      ),
      headlineMedium: TextStyle(
        color: colorScheme.secondary,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.2,
      ),
      headlineSmall: TextStyle(
        color: colorScheme.onBackground,
        fontSize: 8,
        fontWeight: FontWeight.w400,
        height: 1.25,
      ),
    ),

    // Input theme
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorScheme.secondary),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 17.5,
        horizontal: 15,
      ),
      filled: true,
      fillColor: colorScheme.onSecondary,
    ),
  );
}
