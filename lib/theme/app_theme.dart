import 'package:flutter/material.dart';

/// Industrial Minimalist Theme Configuration
/// Color palette: Black, Gray, White with subtle accent
class AppTheme {
  AppTheme._();

  // Primary Colors - Industrial Palette
  static const Color primaryBlack = Color(0xFF1A1A1A);
  static const Color primaryDark = Color(0xFF2D2D2D);
  static const Color primaryGray = Color(0xFF4A4A4A);
  static const Color secondaryGray = Color(0xFF6B6B6B);
  static const Color lightGray = Color(0xFFB0B0B0);
  static const Color backgroundLight = Color(0xFFF5F5F5);
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  
  // Accent Color - Subtle Industrial Blue
  static const Color accentColor = Color(0xFF3D5A80);
  static const Color accentLight = Color(0xFF5C7A9E);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF4A4A4A);
  static const Color textMuted = Color(0xFF6B6B6B);
  static const Color textLight = Color(0xFFFFFFFF);
  
  // Functional Colors
  static const Color divider = Color(0xFFE0E0E0);
  static const Color cardShadow = Color(0x1A000000);

  // Spacing
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;
  static const double spacingSection = 80.0;

  // Border Radius
  static const double radiusSm = 4.0;
  static const double radiusMd = 8.0;
  static const double radiusLg = 12.0;
  static const double radiusXl = 16.0;

  // Content Width
  static const double maxContentWidth = 1200.0;
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 900.0;

  // Theme Data
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryBlack,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: primaryBlack,
        secondary: accentColor,
        surface: surfaceWhite,
        onPrimary: textLight,
        onSecondary: textLight,
        onSurface: textPrimary,
      ),
      fontFamily: 'Inter',
      textTheme: _textTheme,
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceWhite,
        foregroundColor: textPrimary,
        elevation: 0,
        scrolledUnderElevation: 1,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
      ),
      cardTheme: CardThemeData(
        color: surfaceWhite,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          side: const BorderSide(color: divider, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlack,
          foregroundColor: textLight,
          padding: const EdgeInsets.symmetric(
            horizontal: spacingLg,
            vertical: spacingMd,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryBlack,
          padding: const EdgeInsets.symmetric(
            horizontal: spacingLg,
            vertical: spacingMd,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd),
          ),
          side: const BorderSide(color: primaryBlack, width: 1.5),
          textStyle: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: primaryBlack,
        size: 24,
      ),
      dividerTheme: const DividerThemeData(
        color: divider,
        thickness: 1,
        space: spacingLg,
      ),
    );
  }

  static const TextTheme _textTheme = TextTheme(
    // Display
    displayLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 56,
      fontWeight: FontWeight.w700,
      color: textPrimary,
      height: 1.1,
      letterSpacing: -1.5,
    ),
    displayMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 44,
      fontWeight: FontWeight.w700,
      color: textPrimary,
      height: 1.15,
      letterSpacing: -1,
    ),
    displaySmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: textPrimary,
      height: 1.2,
      letterSpacing: -0.5,
    ),
    // Headlines
    headlineLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 32,
      fontWeight: FontWeight.w600,
      color: textPrimary,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: textPrimary,
      height: 1.3,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: textPrimary,
      height: 1.35,
    ),
    // Titles
    titleLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: textPrimary,
      height: 1.4,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: textPrimary,
      height: 1.4,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: textPrimary,
      height: 1.4,
    ),
    // Body
    bodyLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: textSecondary,
      height: 1.6,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: textSecondary,
      height: 1.6,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: textMuted,
      height: 1.5,
    ),
    // Labels
    labelLarge: TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: textPrimary,
      height: 1.4,
      letterSpacing: 0.5,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Inter',
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: textSecondary,
      height: 1.4,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Inter',
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: textMuted,
      height: 1.4,
      letterSpacing: 0.5,
    ),
  );
}
