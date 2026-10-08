import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/app_scaffold.dart';

/// Form Tambah / Edit Barang (murni tampilan).
class BarangFormScreen extends StatelessWidget {
  final bool edit;
  const BarangFormScreen({super.key, this.edit = false});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: edit ? 'Edit Barang' : 'Tambah Barang Baru',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _card(
            'Informasi Barang',
            Icons.inventory_2,
            [
              _field('Nama Barang', 'Contoh: Beras Premium 5kg'),
              _field('Kategori', 'Contoh: Sembako'),
              _field('Satuan', 'Contoh: Pcs / Kg / Dus'),
            ],
          ),
          const SizedBox(height: 14),
          _card(
            'Harga & Stok',
            Icons.attach_money,
            [
              _field('Harga Beli', 'Rp 0', number: true),
              _field('Harga Jual', 'Rp 0', number: true),
              _field('Jumlah Stok', '0', number: true),
              _field('Stok Minimum', '0', number: true),
            ],
          ),
          const SizedBox(height: 14),
          _card(
            'Status Barang',
            Icons.toggle_on,
            [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status Aktif', style: TextStyle(fontSize: 13)),
                    Switch(value: true, onChanged: null),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Batal'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.save, size: 18),
                  label: Text(edit ? 'Update' : 'Simpan'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _card(String title, IconData icon, List<Widget> children) {
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
              Icon(icon, size: 18, color: AppColors.primaryGreen),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }

  Widget _field(String label, String hint, {bool number = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          TextField(
            keyboardType: number ? TextInputType.number : TextInputType.text,
            decoration: InputDecoration(hintText: hint),
          ),
        ],
      ),
    );
  }
}
