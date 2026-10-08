import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../formatters.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/badge.dart';
import 'barang_form_screen.dart';
import 'pembelian_screen.dart';

/// Data Inventory / Barang (murni tampilan statis).
class BarangScreen extends StatelessWidget {
  const BarangScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Data Inventory',
      body: Column(
        children: [
          // Toolbar: pencarian & tombol aksi
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari nama barang...',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PembelianScreen()),
                        ),
                        icon: const Icon(Icons.add_shopping_cart, size: 18),
                        label: const Text('Pembelian'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BarangFormScreen()),
                        ),
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('Tambah'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Daftar barang
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              itemCount: Dummy.barang.length,
              itemBuilder: (context, i) {
                final b = Dummy.barang[i];
                return _BarangTile(
                  nama: b['nama']!,
                  kategori: b['kategori']!,
                  stok: b['stok']!,
                  harga: b['harga']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BarangTile extends StatelessWidget {
  final String nama, kategori, stok, harga;
  const _BarangTile({
    required this.nama,
    required this.kategori,
    required this.stok,
    required this.harga,
  });

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                child: const Icon(Icons.inventory_2, color: AppColors.primaryGreen),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nama,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(harga,
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.primaryGreen, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              AppBadge(kategori),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 10),
          Row(
            children: [
              _meta('Stok', stok),
              _meta('Satuan', 'Pcs'),
              _meta('Status', 'Aktif'),
              const Spacer(),
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BarangFormScreen(edit: true)),
                ),
                icon: const Icon(Icons.edit, size: 18, color: AppColors.info),
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, size: 18, color: AppColors.danger),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _meta(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 10, color: AppColors.textMuted)),
          const SizedBox(height: 2),
          Text(value,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
