import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../formatters.dart';
import '../../widgets/app_scaffold.dart';
import '../../widgets/badge.dart';
import 'user_form_screen.dart';

/// Manajemen User & Role (murni tampilan statis).
class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Data User',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UserFormScreen()),
              ),
              icon: const Icon(Icons.person_add_alt_1, size: 18),
              label: const Text('Tambah User'),
            ),
          ),
          const SizedBox(height: 16),
          ...Dummy.user.map((u) => Container(
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
                    Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.person,
                          color: AppColors.primaryGreen),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(u['nama']!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 14)),
                          const SizedBox(height: 4),
                          Text(u['email']!,
                              style: const TextStyle(
                                  fontSize: 11, color: AppColors.textMuted)),
                        ],
                      ),
                    ),
                    AppBadge(
                      u['role']!,
                      color: u['role'] == 'Admin'
                          ? AppColors.primaryGreen
                          : AppColors.info,
                    ),
                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const UserFormScreen(edit: true)),
                      ),
                      icon: const Icon(Icons.edit, size: 18, color: AppColors.info),
                      visualDensity: VisualDensity.compact,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete,
                          size: 18, color: AppColors.danger),
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
