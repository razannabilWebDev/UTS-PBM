import 'package:flutter/material.dart';
import '../theme.dart';
import '../screens/admin/dashboard_admin_screen.dart';
import '../screens/admin/barang_screen.dart';
import '../screens/admin/supplier_screen.dart';
import '../screens/admin/pelanggan_screen.dart';
import '../screens/admin/user_screen.dart';
import '../screens/admin/laporan_screen.dart';
import '../screens/transaksi/pos_screen.dart';
import '../screens/transaksi/riwayat_screen.dart';
import '../screens/auth/login_screen.dart';

/// Shell halaman dashboard: Drawer (pengganti sidebar web) + AppBar (navbar web).
/// Murni tampilan: menu hanya melakukan navigasi.
class AppScaffold extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget body;
  final bool isKasir;

  const AppScaffold({
    super.key,
    required this.title,
    this.subtitle = 'Sistem Informasi Warung Kelontong',
    required this.body,
    this.isKasir = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textMuted,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.background,
                  child: Icon(Icons.person, color: AppColors.primaryGreen),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isKasir ? 'Hanna' : 'Razan',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      isKasir ? 'KASIR' : 'ADMIN',
                      style: const TextStyle(fontSize: 10, color: AppColors.textMuted),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: DrawerMenu(isKasir: isKasir),
      body: SafeArea(child: body),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  final bool isKasir;
  const DrawerMenu({super.key, this.isKasir = false});

  void _go(BuildContext context, Widget screen) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkGreen,
      child: Column(
        children: [
          // Header brand
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 48, 20, 24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.darkGreen, AppColors.deepGreen],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border(bottom: BorderSide(color: Colors.white12)),
            ),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primaryGreen, AppColors.lightGreen],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.storefront, color: Colors.white, size: 26),
                ),
                const SizedBox(width: 14),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Groceria',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18)),
                    Text('Management System',
                        style: TextStyle(color: Color(0xFFC7C3BB), fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),

          // Menu
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              children: isKasir ? _kasirMenu(context) : _adminMenu(context),
            ),
          ),

          // Logout
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text('Logout', style: TextStyle(color: Colors.white)),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white12,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _adminMenu(BuildContext context) => [
        _item(context, Icons.pie_chart, 'Dashboard', const DashboardAdminScreen()),
        _item(context, Icons.inventory_2, 'Barang', const BarangScreen()),
        _item(context, Icons.local_shipping, 'Supplier', const SupplierScreen()),
        _item(context, Icons.groups, 'Pelanggan', const PelangganScreen()),
        _item(context, Icons.shopping_cart, 'Transaksi', const PosScreen()),
        _item(context, Icons.receipt_long, 'Riwayat Transaksi', const RiwayatScreen()),
        _item(context, Icons.show_chart, 'Laporan', const LaporanScreen()),
        _item(context, Icons.admin_panel_settings, 'User', const UserScreen()),
      ];

  List<Widget> _kasirMenu(BuildContext context) => [
        _item(context, Icons.pie_chart, 'Dashboard', const DashboardAdminScreen(isKasir: true)),
        _item(context, Icons.point_of_sale, 'Transaksi', const PosScreen()),
        _item(context, Icons.groups, 'Pelanggan', const PelangganScreen()),
        _item(context, Icons.receipt_long, 'Riwayat Transaksi', const RiwayatScreen()),
      ];

  Widget _item(BuildContext context, IconData icon, String label, Widget screen) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFD9D5CE)),
        title: Text(label,
            style: const TextStyle(color: Color(0xFFD9D5CE), fontWeight: FontWeight.w500)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        hoverColor: Colors.white10,
        onTap: () => _go(context, screen),
      ),
    );
  }
}
