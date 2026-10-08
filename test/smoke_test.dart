import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:groceria_mobile/main.dart';
import 'package:groceria_mobile/screens/auth/login_screen.dart';
import 'package:groceria_mobile/screens/admin/dashboard_admin_screen.dart';
import 'package:groceria_mobile/screens/admin/barang_screen.dart';
import 'package:groceria_mobile/screens/admin/laporan_screen.dart';
import 'package:groceria_mobile/screens/transaksi/pos_screen.dart';
import 'package:groceria_mobile/screens/transaksi/riwayat_screen.dart';
import 'package:groceria_mobile/screens/transaksi/struk_screen.dart';

/// Viewport tinggi agar seluruh isi ListView (lazy) ikut ter-build di test.
void useTallScreen(WidgetTester tester) {
  tester.view.physicalSize = const Size(412, 6000);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
}

void main() {
  testWidgets('App start & menampilkan layar Login', (tester) async {
    await tester.pumpWidget(const GroceriaApp());
    expect(find.byType(LoginScreen), findsOneWidget);
    expect(find.text('Selamat Datang'), findsOneWidget);
    expect(find.text('Masuk Dashboard'), findsOneWidget);
  });

  testWidgets('Dashboard admin menampilkan statistik', (tester) async {
    useTallScreen(tester);
    await tester.pumpWidget(
      const MaterialApp(home: DashboardAdminScreen()),
    );
    expect(find.text('Total Barang'), findsOneWidget);
    expect(find.text('Pendapatan Hari Ini'), findsOneWidget);
    expect(find.text('Stok Menipis'), findsOneWidget);
    expect(find.text('Aktivitas Terbaru'), findsOneWidget);
  });

  testWidgets('Laporan menampilkan ringkasan & grafik', (tester) async {
    useTallScreen(tester);
    await tester.pumpWidget(const MaterialApp(home: LaporanScreen()));
    expect(find.text('Filter Periode'), findsOneWidget);
    expect(find.text('Total Pendapatan'), findsOneWidget);
    expect(find.text('Grafik Pendapatan'), findsOneWidget);
    expect(find.text('Produk Terlaris'), findsOneWidget);
  });

  testWidgets('Transaksi POS menampilkan 4 langkah', (tester) async {
    useTallScreen(tester);
    await tester.pumpWidget(const MaterialApp(home: PosScreen()));
    expect(find.text('Input Barang'), findsOneWidget);
    expect(find.text('Daftar Belanjaan'), findsOneWidget);
    expect(find.text('Data Pelanggan'), findsOneWidget);
    expect(find.text('Pembayaran'), findsOneWidget);
    expect(find.text('TOTAL BELANJA'), findsOneWidget);
  });

  testWidgets('Barang, Riwayat, dan Struk dirender', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: BarangScreen()));
    expect(find.text('Data Inventory'), findsOneWidget);
    expect(find.text('Beras Premium 5kg'), findsWidgets);

    await tester.pumpWidget(const MaterialApp(home: RiwayatScreen()));
    expect(find.text('Riwayat Transaksi'), findsOneWidget);
    expect(find.text('TRX-086'), findsOneWidget);

    await tester.pumpWidget(const MaterialApp(home: StrukScreen()));
    expect(find.text('WARUNG KELONTONG'), findsOneWidget);
    expect(find.text('Rp 81.450'), findsOneWidget);
  });
}
