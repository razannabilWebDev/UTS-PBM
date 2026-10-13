import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/app_scaffold.dart';

/// =============================
/// HALAMAN STRUK TRANSAKSI
/// =============================
/// Preview struk pembayaran (UI-only wireframe), meniru layout cetak struk.
class StrukScreen extends StatelessWidget {
  const StrukScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Struk Transaksi',
      subtitle: 'Preview struk pembayaran',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                const Icon(Icons.storefront, size: 36, color: AppColors.primaryGreen),
                const SizedBox(height: 8),
                const Text('WARUNG KELONTONG',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 1)),
                const Text('Groceria Management System',
                    style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
                const Text('Jl. Ronggo Waluyo, Karawang',
                    style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
                const SizedBox(height: 16),
                const _Dashed(),
                const SizedBox(height: 12),

                _row('No. Transaksi', 'TRX-086'),
                _row('Tanggal', '08/10/2026 14:20'),
                _row('Kasir', 'kasir1'),
                _row('Pelanggan', 'Budi Santoso'),

                const SizedBox(height: 12),
                const _Dashed(),
                const SizedBox(height: 12),

                _item('Mie Instan Goreng', '3 x Rp 3.500', 'Rp 10.500'),
                _item('Teh Celup 25s', '2 x Rp 7.500', 'Rp 15.000'),
                _item('Beras Premium 5kg', '1 x Rp 65.000', 'Rp 65.000'),

                const SizedBox(height: 12),
                const _Dashed(),
                const SizedBox(height: 12),

                _row('Sub Total', 'Rp 90.500'),
                _row('Diskon (10%)', '- Rp 9.050'),
                const SizedBox(height: 6),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TOTAL',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15)),
                    Text('Rp 81.450',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: AppColors.primaryGreen)),
                  ],
                ),
                const SizedBox(height: 8),
                _row('Bayar', 'Rp 100.000'),
                _row('Kembalian', 'Rp 18.550'),

                const SizedBox(height: 16),
                const _Dashed(),
                const SizedBox(height: 14),

                const Text('Terima kasih telah berbelanja!',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                const Text('Barang yang sudah dibeli tidak dapat ditukar',
                    style: TextStyle(fontSize: 10, color: AppColors.textMuted)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, size: 18),
                  label: const Text('Kembali'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.print, size: 18),
                  label: const Text('Cetak'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Baris label-nilai pada struk
  static Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 12, color: AppColors.textMuted)),
          Text(value,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  /// Baris detail item pada struk
  static Widget _item(String nama, String qty, String total) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nama,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(qty,
                  style: const TextStyle(
                      fontSize: 11, color: AppColors.textMuted)),
              Text(total, style: const TextStyle(fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}

/// Garis putus-putus pemisah
class _Dashed extends StatelessWidget {
  const _Dashed();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashWidth = 5.0;
        const dashSpace = 4.0;
        final count = (constraints.maxWidth / (dashWidth + dashSpace)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            count,
            (_) => Container(
              width: dashWidth,
              height: 1,
              color: AppColors.border,
            ),
          ),
        );
      },
    );
  }
}
