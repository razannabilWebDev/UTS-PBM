import 'package:flutter/material.dart';
import '../theme.dart';

/// =============================
/// KARTU STATISTIK
/// =============================
/// Kartu ringkasan angka untuk dashboard (mirip komponen .stats-card web).
class StatCard extends StatelessWidget {
  /// Label statistik (contoh: "Total Barang")
  final String label;

  /// Nilai statistik (bisa berupa angka atau teks berformat Rp)
  final String value;

  /// Ikon representatif
  final IconData icon;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textMuted)),
                const SizedBox(height: 6),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(value,
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textMain)),
                ),
              ],
            ),
          ),
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primaryGreen),
          ),
        ],
      ),
    );
  }
}

/// =============================
/// KARTU BAGIAN (SECTION CARD)
/// =============================
/// Kartu putih berjudul, digunakan untuk mengelompokkan konten
/// pada dashboard & halaman lain (mirip .card Bootstrap).
class SectionCard extends StatelessWidget {
  /// Judul kartu (opsional)
  final String? title;

  /// Ikon judul (opsional)
  final IconData? titleIcon;

  /// Konten di dalam kartu
  final Widget child;

  /// Padding internal kartu
  final EdgeInsets padding;

  const SectionCard({
    super.key,
    this.title,
    this.titleIcon,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                children: [
                  if (titleIcon != null) ...[
                    Icon(titleIcon, size: 18, color: AppColors.primaryGreen),
                    const SizedBox(width: 8),
                  ],
                  Text(title!,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15)),
                ],
              ),
            ),
          Padding(padding: padding, child: child),
        ],
      ),
    );
  }
}
