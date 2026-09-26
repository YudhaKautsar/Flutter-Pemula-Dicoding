import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    const ink = Color(0xFF202124);

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF5F7F6),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF287A65),
        surface: const Color(0xFFF5F7F6),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: ink,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          height: 1.1,
        ),
        titleMedium: TextStyle(
          color: ink,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(color: Color(0xFF5F6368), fontSize: 14),
      ),
    );
  }
}