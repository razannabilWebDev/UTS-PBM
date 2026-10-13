import 'package:flutter/material.dart';

/// =============================
/// PALET WARNA APLIKASI
/// =============================
/// Palet warna & gaya bersama untuk seluruh layar Groceria Mobile.
/// Mengacu pada tampilan web asli (referensi CSS proyek).
class AppColors {
  // Warna hijau utama
  static const Color darkGreen = Color(0xFF10201D);
  static const Color deepGreen = Color(0xFF2E4332);
  static const Color primaryGreen = Color(0xFF556D4F);
  static const Color lightGreen = Color(0xFF6D8667);

  // Warna latar & komponen
  static const Color background = Color(0xFFF4F6F3);
  static const Color card = Colors.white;
  static const Color border = Color(0xFFE9ECEF);

  // Warna teks
  static const Color textMain = Color(0xFF10201D);
  static const Color textMuted = Color(0xFF7D8178);

  // Warna status
  static const Color danger = Color(0xFFDC3545);
  static const Color success = Color(0xFF198754);
  static const Color warning = Color(0xFFFFC107);
  static const Color info = Color(0xFF0D6EFD);
}

/// =============================
/// TEMA MATERIAL 3 APLIKASI
/// =============================
/// Konfigurasi ThemeData global untuk konsistensi UI di seluruh layar.
class AppTheme {
  /// Tema terang aplikasi Groceria
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        // Latar belakang global
        scaffoldBackgroundColor: AppColors.background,
        // Color scheme berbasis warna utama
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryGreen,
          primary: AppColors.primaryGreen,
        ),
        // Font default
        fontFamily: 'Poppins',
        // Styling AppBar
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.textMain,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: AppColors.textMain,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        // Styling Input (TextField, Dropdown)
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFF8F9FA),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primaryGreen),
          ),
        ),
        // Styling ElevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryGreen,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      );
}
