import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/app_scaffold.dart';
import 'struk_screen.dart';

/// =============================
/// HALAMAN RIWAYAT TRANSAKSI
/// =============================
/// Daftar riwayat transaksi (UI-only wireframe).
class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({super.key});

  static const List<Map<String, String>> _data = [
    {'id': 'TRX-086', 'tanggal': '08/10/2026 14:20', 'kasir': 'kasir1', 'pelanggan': 'Budi Santoso', 'total': 'Rp 87.500', 'bayar': 'Rp 100.000', 'kembali': 'Rp 12.500'},
    {'id': 'TRX-085', 'tanggal': '08/10/2026 12:05', 'kasir': 'kasir1', 'pelanggan': 'Umum', 'total': 'Rp 23.000', 'bayar': 'Rp 25.000', 'kembali': 'Rp 2.000'},
    {'id': 'TRX-084', 'tanggal': '07/10/2026 17:42', 'kasir': 'hanna', 'pelanggan': 'Siti Aminah', 'total': 'Rp 156.000', 'bayar': 'Rp 200.000', 'kembali': 'Rp 44.000'},
    {'id': 'TRX-083', 'tanggal': '07/10/2026 09:15', 'kasir': 'hanna', 'pelanggan': 'Umum', 'total': 'Rp 42.000', 'bayar': 'Rp 50.000', 'kembali': 'Rp 8.000'},
    {'id': 'TRX-082', 'tanggal': '06/10/2026 18:30', 'kasir': 'kasir1', 'pelanggan': 'Rudi Hartono', 'total': 'Rp 31.500', 'bayar': 'Rp 50.000', 'kembali': 'Rp 18.500'},
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Riwayat Transaksi',
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _data.length,
        itemBuilder: (context, i) {
          final t = _data[i];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.receipt_long,
                          color: AppColors.primaryGreen),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(t['id']!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 14)),
                          const SizedBox(height: 3),
                          Text('${t['tanggal']} • Kasir: ${t['kasir']}',
                              style: const TextStyle(
                                  fontSize: 11, color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                    Text(t['total']!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppColors.success)),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(height: 1),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text('Pelanggan: ${t['pelanggan']}',
                          style: const TextStyle(
                              fontSize: 11, color: AppColors.textMuted)),
                    ),
                    TextButton.icon(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const StrukScreen()),
                      ),
                      icon: const Icon(Icons.receipt, size: 16),
                      label: const Text('Lihat Struk',
                          style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
