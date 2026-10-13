import 'package:flutter/material.dart';
import '../../theme.dart';

/// =============================
/// HALAMAN LUPA PASSWORD
/// =============================
/// Form permintaan pengiriman kode OTP (UI-only wireframe).
class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Lupa Password')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppColors.primaryGreen.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.lock_reset,
                    size: 44, color: AppColors.primaryGreen),
              ),
              const SizedBox(height: 24),
              const Text('Lupa Password?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text(
                'Masukkan email terdaftar, kami akan mengirimkan kode OTP untuk reset password.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textMuted, fontSize: 13, height: 1.5),
              ),
              const SizedBox(height: 28),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Email',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
              ),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                    hintText: 'Masukkan email',
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.send),
                  label: const Text('Kirim Kode OTP'),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali ke Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
