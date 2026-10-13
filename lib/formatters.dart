/// =============================
/// HELPER FORMAT (UI-ONLY)
/// =============================
/// Helper format teks untuk tampilan. Tidak mengandung logika bisnis.
/// Digunakan untuk menampilkan angka dalam format rupiah.
class Fmt {
  /// Format angka menjadi string ribuan: "1.250.000"
  static String rupiah(num value) {
    final s = value.round().toString();
    final buffer = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      // Tambahkan titik pemisah ribuan dari kanan ke kiri
      if (i > 0 && (s.length - i) % 3 == 0) buffer.write('.');
      buffer.write(s[i]);
    }
    return buffer.toString();
  }

  /// Format lengkap dengan prefix Rp: "Rp 1.250.000"
  static String rp(num value) => 'Rp ${rupiah(value)}';
}

/// =============================
/// DATA DUMMY (WIREFRAME)
/// =============================
/// Data statis hardcoded yang dipakai berulang di berbagai layar.
/// Hanya untuk keperluan tampilan UI (bukan sumber data nyata).
class Dummy {
  static const List<Map<String, String>> barang = [
    {'nama': 'Beras Premium 5kg', 'kategori': 'Sembako', 'stok': '42', 'harga': '65.000'},
    {'nama': 'Minyak Goreng 2L', 'kategori': 'Sembako', 'stok': '18', 'harga': '34.500'},
    {'nama': 'Gula Pasir 1kg', 'kategori': 'Sembako', 'stok': '9', 'harga': '15.000'},
    {'nama': 'Mie Instan Goreng', 'kategori': 'Makanan', 'stok': '120', 'harga': '3.500'},
    {'nama': 'Teh Celup 25s', 'kategori': 'Minuman', 'stok': '31', 'harga': '7.500'},
    {'nama': 'Sabun Cuci 800ml', 'kategori': 'Kebersihan', 'stok': '4', 'harga': '22.000'},
    {'nama': 'Kopi Bubuk 250g', 'kategori': 'Minuman', 'stok': '27', 'harga': '18.500'},
    {'nama': 'Roti Tawar', 'kategori': 'Makanan', 'stok': '11', 'harga': '16.000'},
  ];

  static const List<Map<String, String>> supplier = [
    {'nama': 'CV Sumber Rejeki', 'kontak': '0812-3456-7890', 'alamat': 'Karawang Kota'},
    {'nama': 'PT Pangan Nusantara', 'kontak': '0813-9988-7766', 'alamat': 'Bekasi'},
    {'nama': 'UD Berkah Jaya', 'kontak': '0857-1122-3344', 'alamat': 'Karawang Barat'},
    {'nama': 'Toko Grosir Sentosa', 'kontak': '0821-5566-7788', 'alamat': 'Purwakarta'},
  ];

  static const List<Map<String, String>> pelanggan = [
    {'nama': 'Budi Santoso', 'hp': '0812-1111-2222', 'poin': '240', 'alamat': 'Klari'},
    {'nama': 'Siti Aminah', 'hp': '0813-3333-4444', 'poin': '90', 'alamat': 'Cikampek'},
    {'nama': 'Rudi Hartono', 'hp': '0857-5555-6666', 'poin': '15', 'alamat': 'Telukjambe'},
    {'nama': 'Dewi Lestari', 'hp': '0821-7777-8888', 'poin': '135', 'alamat': 'Karawang'},
    {'nama': 'Agus Setiawan', 'hp': '0878-9999-0000', 'poin': '0', 'alamat': '- '},
  ];

  static const List<Map<String, String>> user = [
    {'nama': 'admin', 'email': 'admin@groceria.id', 'role': 'Admin'},
    {'nama': 'razan', 'email': 'razan@groceria.id', 'role': 'Admin'},
    {'nama': 'kasir1', 'email': 'kasir1@groceria.id', 'role': 'Kasir'},
    {'nama': 'hanna', 'email': 'hanna@groceria.id', 'role': 'Kasir'},
  ];
}
