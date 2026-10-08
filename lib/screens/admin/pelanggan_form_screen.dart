import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/app_scaffold.dart';

/// Form Tambah / Edit Pelanggan (murni tampilan).
class PelangganFormScreen extends StatelessWidget {
  final bool edit;
  const PelangganFormScreen({super.key, this.edit = false});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: edit ? 'Edit Pelanggan' : 'Tambah Pelanggan Baru',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _card(
            'Informasi Pelanggan',
            Icons.person,
            [
              _field('Nama Lengkap', 'Contoh: Budi Santoso'),
              _field('No. HP', 'Contoh: 0812-1111-2222'),
              _field('Alamat', 'Contoh: Klari'),
            ],
          ),
          const SizedBox(height: 14),
          _card(
            'Poin Member',
            Icons.loyalty,
            [
              _field('Jumlah Poin', '0', number: true),
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
