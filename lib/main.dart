import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/auth/login_screen.dart';

/// =========================
/// ENTRY POINT APLIKASI
/// =========================
/// Titik masuk utama aplikasi Groceria Mobile (UI-only wireframe).
void main() {
  // Menjalankan aplikasi Flutter
  runApp(const GroceriaApp());
}

/// =========================
/// ROOT WIDGET APLIKASI
/// =========================
/// Konfigurasi MaterialApp: tema, judul, layar awal (Login).
class GroceriaApp extends StatelessWidget {
  const GroceriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Konfigurasi umum aplikasi
      title: 'Groceria Mobile',
      debugShowCheckedModeBanner: false,
      // Tema aplikasi (Material 3)
      theme: AppTheme.light,
      // Layar awal aplikasi
      home: const LoginScreen(),
    );
  }
}
