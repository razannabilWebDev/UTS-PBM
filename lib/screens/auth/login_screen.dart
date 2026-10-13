import 'package:flutter/material.dart';
import '../../theme.dart';
import '../admin/dashboard_admin_screen.dart';
import '../kasir/dashboard_kasir_screen.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';

/// =============================
/// HALAMAN LOGIN
/// =============================
/// Halaman masuk aplikasi (murni UI wireframe).
/// Layout vertikal untuk mobile (adaptasi dari layout 2 kolom web).
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// Role terpilih untuk login
  String _selectedRole = 'Admin';

  /// Toggle visibilitas password
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ---- BAGIAN BRAND (LEFT SIDE - WEB) DIADAPTASI VERTIKAL ----
              // Menampilkan logo, nama sistem, tagline & fitur
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 36),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.darkGreen, AppColors.deepGreen],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28),
                    bottomRight: Radius.circular(28),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 54,
                          height: 54,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [AppColors.primaryGreen, AppColors.lightGreen],
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.storefront,
                              color: Colors.white, size: 28),
                        ),
                        const SizedBox(width: 14),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Groceria',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700)),
                            Text('Sistem Informasi Warung Kelontong',
                                style: TextStyle(
                                    color: Color(0xFFC7C3BB), fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Kelola Warung Jadi Lebih\nModern & Efisien',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          height: 1.3),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Mengelola barang, transaksi, supplier, pelanggan, dan laporan penjualan dalam satu aplikasi.',
                      style: TextStyle(color: Color(0xFFC7C3BB), fontSize: 13, height: 1.5),
                    ),
                    const SizedBox(height: 20),
                    _feature(Icons.inventory_2, 'Manajemen Barang & Stok'),
                    _feature(Icons.point_of_sale, 'Transaksi Cepat & Praktis'),
                    _feature(Icons.show_chart, 'Laporan Penjualan Interaktif'),
                  ],
                ),
              ),

              // ---- BAGIAN FORM LOGIN (RIGHT SIDE - WEB) ----
              // Form input username/password & aksi login
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Selamat Datang',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 6),
                    const Text('Silakan login untuk masuk ke dashboard.',
                        style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
                    const SizedBox(height: 24),

                    const Text('Username / Email',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Masukkan username/email',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Text('Password',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    TextField(
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        hintText: 'Masukkan password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                              _obscure ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => setState(() => _obscure = !_obscure),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            SizedBox(
                              width: 22,
                              height: 22,
                              child: Checkbox(value: false, onChanged: null),
                            ),
                            SizedBox(width: 6),
                            Text('Ingat saya', style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ForgotPasswordScreen()),
                          ),
                          child: const Text('Lupa password?',
                              style: TextStyle(fontSize: 12)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // PILIHAN ROLE UNTUK LOGIN (UI-ONLY WIREFRAME)
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Role',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedRole,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.badge_outlined)),
                      items: const [
                        DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                        DropdownMenuItem(value: 'Kasir', child: Text('Kasir')),
                      ],
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() => _selectedRole = value);
                      },
                    ),
                    const SizedBox(height: 16),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (_selectedRole == 'Kasir') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const DashboardKasirScreen()),
                            );
                            return;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const DashboardAdminScreen()),
                          );
                        },
                        icon: const Icon(Icons.login),
                        label: const Text('Masuk Dashboard'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Belum punya akun? ',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.textMuted)),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const RegisterScreen()),
                            ),
                            child: const Text('Daftar',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primaryGreen,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Center(
                      child: Text('© 2026 Warung Kelontong Management System',
                          style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Item fitur pada bagian brand
  Widget _feature(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, color: AppColors.lightGreen, size: 18),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }
}
