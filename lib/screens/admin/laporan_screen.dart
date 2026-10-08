import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../theme.dart';
import '../../widgets/app_scaffold.dart';

/// Laporan Penjualan (murni tampilan statis).
class LaporanScreen extends StatelessWidget {
  const LaporanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Laporan Penjualan',
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Filter periode
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Filter Periode',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: '01/10/2026',
                          prefixIcon: Icon(Icons.calendar_today, size: 18),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: '08/10/2026',
                          prefixIcon: Icon(Icons.calendar_today, size: 18),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_alt, size: 18),
                    label: const Text('Tampilkan'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Ringkasan
          const Row(
            children: [
              Expanded(
                child: _Ringkasan(
                    label: 'Total Pendapatan',
                    value: 'Rp 12.480.000',
                    color: AppColors.primaryGreen),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _Ringkasan(
                    label: 'Keuntungan',
                    value: 'Rp 3.920.000',
                    color: AppColors.success),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            children: [
              Expanded(
                child: _Ringkasan(
                    label: 'Total Transaksi',
                    value: '86',
                    color: AppColors.info),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _Ringkasan(
                    label: 'Item Terjual',
                    value: '412',
                    color: AppColors.warning),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Grafik pendapatan
          _cardWrapper(
            'Grafik Pendapatan',
            Icons.show_chart,
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 2500,
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 500,
                    getDrawingHorizontalLine: (_) => const FlLine(
                      color: AppColors.border,
                      strokeWidth: 1,
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const hari = ['02', '03', '04', '05', '06', '07', '08'];
                          final i = value.toInt();
                          if (i < 0 || i >= hari.length) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(hari[i],
                                style: const TextStyle(
                                    fontSize: 10, color: AppColors.textMuted)),
                          );
                        },
                      ),
                    ),
                  ),
                  barGroups: [
                    _bar(0, 1200),
                    _bar(1, 1800),
                    _bar(2, 900),
                    _bar(3, 2200),
                    _bar(4, 1600),
                    _bar(5, 2400),
                    _bar(6, 2000),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Produk terlaris
          _cardWrapper(
            'Produk Terlaris',
            Icons.local_fire_department,
            const Column(
              children: [
                _ProdukTerlaris(no: '1', nama: 'Mie Instan Goreng', jumlah: '96 terjual'),
                _ProdukTerlaris(no: '2', nama: 'Beras Premium 5kg', jumlah: '74 terjual'),
                _ProdukTerlaris(no: '3', nama: 'Minyak Goreng 2L', jumlah: '68 terjual'),
                _ProdukTerlaris(no: '4', nama: 'Teh Celup 25s', jumlah: '52 terjual'),
                _ProdukTerlaris(no: '5', nama: 'Kopi Bubuk 250g', jumlah: '41 terjual'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Tabel transaksi ringkas
          _cardWrapper(
            'Rincian Transaksi',
            Icons.receipt_long,
            const Column(
              children: [
                _TrxRow(id: 'TRX-086', tanggal: '08/10/2026', pelanggan: 'Budi Santoso', total: 'Rp 87.500'),
                _TrxRow(id: 'TRX-085', tanggal: '08/10/2026', pelanggan: 'Umum', total: 'Rp 23.000'),
                _TrxRow(id: 'TRX-084', tanggal: '07/10/2026', pelanggan: 'Siti Aminah', total: 'Rp 156.000'),
                _TrxRow(id: 'TRX-083', tanggal: '07/10/2026', pelanggan: 'Umum', total: 'Rp 42.000'),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  static BarChartGroupData _bar(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: AppColors.primaryGreen,
          width: 16,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }

  static Widget _cardWrapper(String title, IconData icon, Widget child) {
    return Container(
      width: double.infinity,
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
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _Ringkasan extends StatelessWidget {
  final String label, value;
  final Color color;
  const _Ringkasan({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
          const SizedBox(height: 6),
          Text(value,
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w700, color: color)),
        ],
      ),
    );
  }
}

class _ProdukTerlaris extends StatelessWidget {
  final String no, nama, jumlah;
  const _ProdukTerlaris({
    required this.no,
    required this.nama,
    required this.jumlah,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(no,
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(nama,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
          ),
          Text(jumlah,
              style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
        ],
      ),
    );
  }
}

class _TrxRow extends StatelessWidget {
  final String id, tanggal, pelanggan, total;
  const _TrxRow({
    required this.id,
    required this.tanggal,
    required this.pelanggan,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(id,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600)),
                Text('$tanggal • $pelanggan',
                    style: const TextStyle(
                        fontSize: 10, color: AppColors.textMuted)),
              ],
            ),
          ),
          Text(total,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
