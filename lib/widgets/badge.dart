import 'package:flutter/material.dart';
import '../theme.dart';

/// Badge kecil berwarna (pengganti .badge Bootstrap).
/// Dinamai `AppBadge` agar tidak bentrok dengan widget `Badge` dari Material.
class AppBadge extends StatelessWidget {
  final String text;
  final Color color;

  const AppBadge(this.text, {super.key, this.color = AppColors.primaryGreen});

  /// Badge status Aktif/Nonaktif.
  factory AppBadge.status(String status, {Key? key}) {
    final aktif = status.toLowerCase() == 'aktif';
    return AppBadge(status, key: key, color: aktif ? AppColors.info : AppColors.danger);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}

/// Baris label + nilai sederhana untuk daftar info.
class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(label,
                style: const TextStyle(
                    fontSize: 13, color: AppColors.textMuted)),
          ),
          Expanded(
            child: Text(value,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textMain)),
          ),
        ],
      ),
    );
  }
}
