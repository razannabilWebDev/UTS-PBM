import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/app_scaffold.dart';

/// Form Pembelian Barang dari Supplier (murni tampilan).
class PembelianScreen extends StatelessWidget {
  const PembelianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Pembelian Barang',
      subtitle: 'Input pembelian stok dari supplier',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _card(
            'Data Pembelian',
            [
              _dropdown('Pilih Supplier',
                  ['CV Sumber Rejeki', 'PT Pangan Nusantara', 'UD Berkah Jaya']),
              _field('Tanggal Pembelian', '08/10/2026', readOnly: true),
              _field('No. Nota', 'Contoh: INV-2026-001'),
            ],
          ),
          const SizedBox(height: 14),
          _card(
            'Daftar Item',
            [
              Row(
                children: [
                  Expanded(
                    child: _dropdown('Pilih Barang',
                        ['Beras Premium 5kg', 'Minyak Goreng 2L', 'Gula Pasir 1kg']),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    width: 70,
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Qty'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Tambah Item'),
                ),
              ),
              const SizedBox(height: 14),
              const Divider(height: 1),
              const SizedBox(height: 10),
              _itemRow('Beras Premium 5kg', '2 x Rp 58.000', 'Rp 116.000'),
              _itemRow('Minyak Goreng 2L', '3 x Rp 30.000', 'Rp 90.000'),
              const SizedBox(height: 6),
              const Divider(height: 1),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Pembelian',
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  Text('Rp 206.000',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryGreen,
                          fontSize: 16)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.save, size: 18),
              label: const Text('Simpan Pembelian'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(String title, List<Widget> children) {
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
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
          const SizedBox(height: 14),
          ...children,
        ],
      ),
    );
  }

  Widget _field(String label, String hint, {bool readOnly = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          TextField(
            readOnly: readOnly,
            decoration: InputDecoration(hintText: hint),
          ),
        ],
      ),
    );
  }

  Widget _dropdown(String label, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          hint: Text(label),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: null,
        ),
      ],
    );
  }

  Widget _itemRow(String nama, String qty, String total) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                Text(qty,
                    style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
              ],
            ),
          ),
          Text(total,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
