import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../formatters.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/badge.dart';

/// =============================
/// DASHBOARD ADMIN
/// =============================
/// Halaman dashboard untuk role Admin (UI-only wireframe).
/// Menampilkan statistik, barang terbaru, aktivitas & stok menipis.
class DashboardAdminScreen extends StatelessWidget {
  /// Flag konteks kasir (opsional, dipertahankan untuk kompatibilitas)
  final bool isKasir;
  const DashboardAdminScreen({super.key, this.isKasir = false});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: isKasir ? 'Dashboard Kasir' : 'Dashboard Warung',
      subtitle: 'Selamat datang di sistem informasi warung kelontong',
      isKasir: isKasir,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // GRID STATISTIK ADMIN
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.9,
            children: const [
              StatCard(label: 'Total Barang', value: '128', icon: Icons.inventory_2),
              StatCard(label: 'Total Stok', value: '1.840', icon: Icons.warehouse),
              StatCard(label: 'Total Transaksi', value: '312', icon: Icons.shopping_cart),
              StatCard(label: 'Total User', value: '4', icon: Icons.groups),
              StatCard(label: 'Pendapatan Hari Ini', value: 'Rp 1.245.000', icon: Icons.account_balance_wallet),
              StatCard(label: 'Total Pendapatan', value: 'Rp 48.720.000', icon: Icons.trending_up),
              StatCard(label: 'Total Pembelian', value: 'Rp 21.300.000', icon: Icons.local_shipping),
            ],
          ),
          const SizedBox(height: 16),

          // BARANG TERBARU
          SectionCard(
            title: 'Barang Terbaru',
            titleIcon: Icons.inventory_2,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: Dummy.barang.take(4).map((b) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.inventory_2,
                            size: 20, color: AppColors.primaryGreen),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(b['nama']!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 13)),
                            const SizedBox(height: 2),
                            Text('Stok ${b['stok']} • Rp ${b['harga']}',
                                style: const TextStyle(
                                    fontSize: 11, color: AppColors.textMuted)),
                          ],
                        ),
                      ),
                      AppBadge(b['kategori']!),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),

          // AKTIVITAS TERBARU
          const SectionCard(
            title: 'Aktivitas Terbaru',
            titleIcon: Icons.history,
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                _AktivitasItem(id: '312', nama: 'Budi Santoso', kasir: 'kasir1', total: 'Rp 87.500', waktu: '08 Okt 2026 14:20'),
                _AktivitasItem(id: '311', nama: 'Umum', kasir: 'kasir1', total: 'Rp 23.000', waktu: '08 Okt 2026 12:05'),
                _AktivitasItem(id: '310', nama: 'Siti Aminah', kasir: 'hanna', total: 'Rp 156.000', waktu: '08 Okt 2026 10:42'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // STOK MENIPIS
          const SectionCard(
            title: 'Stok Menipis',
            titleIcon: Icons.warning_amber_rounded,
            padding: EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              children: [
                _StokMenipis(nama: 'Sabun Cuci 800ml', stok: '4', min: '10'),
                _StokMenipis(nama: 'Gula Pasir 1kg', stok: '9', min: '15'),
                _StokMenipis(nama: 'Roti Tawar', stok: '11', min: '20'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Item aktivitas transaksi terbaru (private)
class _AktivitasItem extends StatelessWidget {
  final String id;
  final String nama;
  final String kasir;
  final String total;
  final String waktu;
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
          Container(
            width: 42,
            height: 42,
            decoration: const BoxDecoration(
              color: AppColors.primaryGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.shopping_cart, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Transaksi #$id',
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                Text('$nama • Kasir: $kasir',
                    style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(total,
                  style: const TextStyle(
                      color: AppColors.success,
                      fontWeight: FontWeight.w700,
                      fontSize: 13)),
              Text(waktu,
                  style: const TextStyle(fontSize: 10, color: AppColors.textMuted)),
            ],
          ),
        ],
      ),
    );
  }
}

/// Item stok menipis (private)
class _StokMenipis extends StatelessWidget {
  final String nama;
  final String stok;
  final String min;
  const _StokMenipis({required this.nama, required this.stok, required this.min});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(nama,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
          ),
          AppBadge(stok, color: AppColors.danger),
          const SizedBox(width: 8),
          Text('min. $min',
              style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
        ],
      ),
    );
  }
}
