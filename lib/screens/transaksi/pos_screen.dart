import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/app_scaffold.dart';
import 'struk_screen.dart';

/// =============================
/// HALAMAN POS (TRANSAKSI PENJUALAN)
/// =============================
/// Layar kasir untuk input transaksi (UI-only wireframe).
/// Disusun bertahap: Input Barang, Daftar Belanja, Pelanggan, Pembayaran.
class PosScreen extends StatelessWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Transaksi Penjualan',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. INPUT BARANG
          _stepCard(
            1,
            'Input Barang',
            Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Ketik nama produk atau scan barcode...',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 12),
                // Hasil pencarian (dummy)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mie Instan Goreng',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 13)),
                            SizedBox(height: 2),
                            Text('Stok: 120 | Rp 3.500',
                                style: TextStyle(
                                    fontSize: 11, color: AppColors.textMuted)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 4),
                          minimumSize: const Size(0, 34),
                        ),
                        child: const Text('+'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // 2. DAFTAR BELANJAAN
          _stepCard(
            2,
            'Daftar Belanjaan',
            const Column(
              children: [
                _CartItem(nama: 'Mie Instan Goreng', harga: 'Rp 3.500', subtotal: 'Rp 10.500'),
                _CartItem(nama: 'Teh Celup 25s', harga: 'Rp 7.500', subtotal: 'Rp 15.000'),
                _CartItem(nama: 'Beras Premium 5kg', harga: 'Rp 65.000', subtotal: 'Rp 65.000'),
                SizedBox(height: 8),
                Divider(height: 1),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sub Total',
                        style: TextStyle(fontWeight: FontWeight.w700)),
                    Text('Rp 90.500',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryGreen)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // 3. DATA PELANGGAN
          _stepCard(
            3,
            'Data Pelanggan',
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Cari Pelanggan / No. HP',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  hint: const Text('-- Pelanggan Umum (Bukan Member) --'),
                  items: const [
                    DropdownMenuItem(value: 'umum', child: Text('Pelanggan Umum')),
                    DropdownMenuItem(value: 'budi', child: Text('Budi Santoso - 0812-1111-2222')),
                    DropdownMenuItem(value: 'siti', child: Text('Siti Aminah - 0813-3333-4444')),
                  ],
                  onChanged: null,
                ),
                const SizedBox(height: 12),
                // Info member (dummy tampil)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nama: Budi Santoso',
                          style: TextStyle(fontSize: 13)),
                      SizedBox(height: 4),
                      Text('Poin Anda: 240 Poin',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryGreen)),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 22,
                            height: 22,
                            child: Checkbox(value: false, onChanged: null),
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text('Tukar 100 Poin (Diskon 10%)',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // 4. PEMBAYARAN
          _stepCard(
            4,
            'Pembayaran',
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('TOTAL BELANJA',
                    style: TextStyle(fontSize: 11, color: AppColors.textMuted)),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.darkGreen, AppColors.deepGreen],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('Rp 81.450',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700)),
                ),
                const SizedBox(height: 6),
                const Text('*Termasuk Potongan Diskon 10%',
                    style: TextStyle(fontSize: 11, color: AppColors.danger)),
                const SizedBox(height: 14),
                const Text('Uang Pembayaran',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                const TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Masukkan nominal uang...'),
                ),
                const SizedBox(height: 14),
                const Text('Kembalian',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('Rp 18.550',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700)),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.save, size: 18),
                        label: const Text('Simpan'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const StrukScreen()),
                        ),
                        icon: const Icon(Icons.print, size: 18),
                        label: const Text('Cetak'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Kartu langkah transaksi
  static Widget _stepCard(int step, String title, Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.primaryGreen,
                  shape: BoxShape.circle,
                ),
                child: Text('$step',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(width: 10),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

/// Item barang pada keranjang belanja (private)
class _CartItem extends StatelessWidget {
  final String nama;
  final String harga;
  final String subtotal;
  const _CartItem({
    required this.nama,
    required this.harga,
    required this.subtotal,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600)),
                Text(harga,
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.textMuted)),
              ],
            ),
          ),
          // Kontrol qty (dummy)
          Container(
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove, size: 16),
                  visualDensity: VisualDensity.compact,
                ),
                const Text('3',
                    style: TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600)),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 16),
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 76,
            child: Text(subtotal,
                textAlign: TextAlign.end,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w700)),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete, size: 18, color: AppColors.danger),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}
