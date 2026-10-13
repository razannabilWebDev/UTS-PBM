import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../formatters.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/badge.dart';

/// ==============================
/// DASHBOARD KASIR (UI-ONLY WIREFRAME)
/// ==============================
/// File ini berisi halaman dashboard khusus untuk role Kasir.
/// Dibuat terpisah dari dashboard admin agar isi & menu yang ditampilkan
/// lebih relevan untuk kebutuhan kasir (murni tampilan, tanpa backend/state).
class DashboardKasirScreen extends StatelessWidget {
  /// Konstruktor
  const DashboardKasirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // Judul & subjudul AppBar
      title: 'Dashboard Kasir',
      subtitle: 'Selamat datang di sistem informasi warung kelontong',
      // Tanda bahwa ini ditampilkan dalam konteks kasir
      isKasir: true,
      // Isi body
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // -------------------------
          // 1. GRID STATISTIK KASIR
          // -------------------------
          // Menampilkan ringkasan data yang relevan untuk kasir
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.9,
            children: const [
              StatCard(
                label: 'Transaksi Hari Ini',
                value: '12',
                icon: Icons.point_of_sale,
              ),
              StatCard(
                label: 'Penjualan Hari Ini',
                value: 'Rp 1.245.000',
                icon: Icons.account_balance_wallet,
              ),
              StatCard(
                label: 'Total Pelanggan',
                value: '5',
                icon: Icons.groups,
              ),
              StatCard(
                label: 'Transaksi Bulan Ini',
                value: 'Rp 5.820.000',
                icon: Icons.trending_up,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // -------------------------
          // 2. AKTIVITAS TERBARU
          // -------------------------
          const SectionCard(
            title: 'Aktivitas Terbaru',
            titleIcon: Icons.history,
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                _AktivitasItem(
                  id: '312',
                  nama: 'Budi Santoso',
                  kasir: 'hanna',
                  total: 'Rp 87.500',
                  waktu: '08 Okt 2026 14:20',
                ),
                _AktivitasItem(
                  id: '311',
                  nama: 'Umum',
                  kasir: 'hanna',
                  total: 'Rp 23.000',
                  waktu: '08 Okt 2026 12:05',
                ),
                _AktivitasItem(
                  id: '310',
                  nama: 'Siti Aminah',
                  kasir: 'hanna',
                  total: 'Rp 156.000',
                  waktu: '08 Okt 2026 10:42',
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // -------------------------
          // 3. STOK MENIPIS
          // -------------------------
          const SectionCard(
            title: 'Stok Menipis',
            titleIcon: Icons.warning_amber_rounded,
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                _StokMenipis(
                  nama: 'Sabun Cuci 800ml',
                  stok: '4',
                  min: '10',
                ),
                _StokMenipis(
                  nama: 'Gula Pasir 1kg',
                  stok: '9',
                  min: '15',
                ),
                _StokMenipis(
                  nama: 'Roti Tawar',
                  stok: '11',
                  min: '20',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ===========================================================
/// WIDGET ITEM: AKTIVITAS TERBARU PADA DASHBOARD KASIR
/// ===========================================================
/// Menampilkan ringkasan transaksi terbaru (dummy) dalam bentuk
/// list item ringkas untuk tampilan kasir.
class _AktivitasItem extends StatelessWidget {
  // Data item aktivitas
  final String id;
  final String nama;
  final String kasir;
  final String total;
  final String waktu;

  /// Konstruktor
  const _AktivitasItem({
    required this.id,
    required this.nama,
    required this.kasir,
    required this.total,
    required this.waktu,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Ikon transaksi
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: AppColors.primaryGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          // Info transaksi (ID, Pelanggan, Kasir)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaksi #$id',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$nama • Kasir: $kasir',
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          // Total & waktu
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                total,
                style: const TextStyle(
                  color: AppColors.success,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                waktu,
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// ==========================================
/// WIDGET ITEM: STOK MENIPIS PADA DASHBOARD
/// ==========================================
/// Menampilkan daftar barang dengan stok di bawah minimal (dummy).
class _StokMenipis extends StatelessWidget {
  // Data stok menipis
  final String nama;
  final String stok;
  final String min;

  /// Konstruktor
  const _StokMenipis({
    required this.nama,
    required this.stok,
    required this.min,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Nama barang
          Expanded(
            child: Text(
              nama,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // Badge stok (warna danger menandakan menipis)
          AppBadge(
            stok,
            color: AppColors.danger,
          ),
          const SizedBox(width: 8),
          // Label minimal stok
          Text(
            'min. $min',
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
