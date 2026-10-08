import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../formatters.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/badge.dart';
import 'pelanggan_form_screen.dart';

/// Kelola Pelanggan + poin member (murni tampilan statis).
class PelangganScreen extends StatelessWidget {
  const PelangganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Kelola Pelanggan',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PelangganFormScreen()),
              ),
              icon: const Icon(Icons.person_add, size: 18),
              label: const Text('Tambah Pelanggan'),
            ),
          ),
          const SizedBox(height: 16),
          ...Dummy.pelanggan.map((p) => Container(
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
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          AppColors.primaryGreen.withValues(alpha: 0.15),
                      child: Text(
                        p['nama']!.substring(0, 1),
                        style: const TextStyle(
                            color: AppColors.primaryGreen,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p['nama']!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14)),
                          const SizedBox(height: 4),
                          Text('${p['hp']} • ${p['alamat']}',
                              style: const TextStyle(
                                  fontSize: 11, color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                    AppBadge('${p['poin']} poin'),
                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PelangganFormScreen(edit: true)),
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
              )),
        ],
      ),
    );
  }
}
