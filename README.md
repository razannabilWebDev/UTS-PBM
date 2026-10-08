# 🛒 Groceria Mobile (UI / Wireframe)

Versi **murni tampilan** dari *Groceria - Sistem Informasi Warung Kelontong*, dibangun dengan
**Flutter (Dart)** untuk kebutuhan mobile. Project ini **tidak memiliki backend / database / logika bisnis** —
semua data bersifat statis (dummy) dan tombol aksi hanya untuk navigasi antar layar.

> Porting tampilan dari project web PHP di `../Final-Project-PBW`.

---

## 📱 Daftar Layar

| Kelompok | Layar | File |
|---|---|---|
| **Auth** | Login | `lib/screens/auth/login_screen.dart` |
| | Register | `lib/screens/auth/register_screen.dart` |
| | Lupa Password | `lib/screens/auth/forgot_password_screen.dart` |
| | Verifikasi OTP | `lib/screens/auth/verify_otp_screen.dart` |
| | Reset Password | `lib/screens/auth/reset_password_screen.dart` |
| **Admin** | Dashboard | `lib/screens/admin/dashboard_admin_screen.dart` |
| | Data Barang | `lib/screens/admin/barang_screen.dart` |
| | Tambah/Edit Barang | `lib/screens/admin/barang_form_screen.dart` |
| | Pembelian | `lib/screens/admin/pembelian_screen.dart` |
| | Supplier | `lib/screens/admin/supplier_screen.dart` |
| | Tambah/Edit Supplier | `lib/screens/admin/supplier_form_screen.dart` |
| | Pelanggan | `lib/screens/admin/pelanggan_screen.dart` |
| | Tambah/Edit Pelanggan | `lib/screens/admin/pelanggan_form_screen.dart` |
| | Data User | `lib/screens/admin/user_screen.dart` |
| | Tambah/Edit User | `lib/screens/admin/user_form_screen.dart` |
| | Laporan | `lib/screens/admin/laporan_screen.dart` |
| **Transaksi** | POS Penjualan | `lib/screens/transaksi/pos_screen.dart` |
| | Riwayat | `lib/screens/transaksi/riwayat_screen.dart` |
| | Struk | `lib/screens/transaksi/struk_screen.dart` |

Peta layout web → mobile: **sidebar** menjadi **Drawer**, **navbar** menjadi **AppBar**,
tabel lebar menjadi **kartu/list**, dan layout login 2 kolom menjadi **branding atas + form bawah**.

---

## ⚙️ Instalasi Flutter (✅ SUDAH terpasang di komputer ini)

Flutter **3.47.6 stable** sudah terpasang di:

```text
C:\src\flutter          (SDK)
C:\src\flutter\bin      (sudah ditambahkan ke PATH user)
```

Buka terminal **baru**, lalu verifikasi:

```powershell
flutter --version
flutter doctor
```

> Catatan `flutter doctor`: peringatan kuning tentang *Android toolchain* dan
> *Visual Studio* bisa **diabaikan** — keduanya hanya dibutuhkan untuk build
> APK Android / aplikasi Windows. Untuk melihat hasil di Chrome, keduanya tidak diperlukan.

### Instalasi manual (jika suatu saat perlu di komputer lain)

1. Unduh zip dari https://docs.flutter.dev/get-started/install/windows
   (winget **tidak** menyediakan paket Flutter SDK).
2. Ekstrak ke `C:\src\flutter`.
3. Tambahkan `C:\src\flutter\bin` ke **PATH** user.
4. Jalankan `flutter doctor`.

---

## 🚀 Menjalankan Project

Masuk ke folder ini, lalu:

```powershell
cd "D:\RAZAN\PBM\UTS PBM\groceria_mobile"

# 1) Folder platform (android/web) sudah digenerate — tidak perlu diulang
flutter pub get

# 2) Jalankan di Chrome
flutter run -d web-server --web-port=8080
#    lalu buka http://localhost:8080 di browser

# 3) (opsional) jalankan unit test
flutter test
```

---

## 📂 Struktur

```
groceria_mobile/
├── pubspec.yaml            # dependensi: fl_chart (grafik laporan)
├── analysis_options.yaml
├── README.md
└── lib/
    ├── main.dart           # entry point + tema
    ├── theme.dart          # warna & gaya (hijau #10201D / #556D4F, bg #F4F6F3)
    ├── formatters.dart     # helper format rupiah + data dummy
    ├── widgets/
    │   ├── app_scaffold.dart   # Drawer menu + AppBar
    │   ├── stat_card.dart      # kartu statistik & section card
    │   └── badge.dart          # badge status & info row
    └── screens/
        ├── auth/       (5 layar)
        ├── admin/      (11 layar)
        └── transaksi/  (3 layar)
```

---

## 🎨 Palet Warna

| Warna | Hex | Penggunaan |
|---|---|---|
| Dark Green | `#10201D` | sidebar / gradient atas |
| Deep Green | `#2E4332` | gradient sidebar |
| Primary Green | `#556D4F` | tombol, aksen, ikon |
| Light Green | `#6D8667` | gradient tombol |
| Background | `#F4F6F3` | latar halaman |
| Text Muted | `#7D8178` | teks sekunder |

Ikon menggunakan Material Icons (pengganti Font Awesome), font default android
(pengganti Poppins) agar tidak perlu aset eksternal.

---

## 📌 Catatan

- Semua data **hardcoded** di `formatters.dart` (`Dummy`) dan di dalam tiap layar.
- Tombol **Tambah/Edit/Hapus/Simpan** hanya navigasi atau tidak melakukan aksi (wireframe).
- Logout pada Drawer kembali ke layar Login.
- Diperuntukkan sebagai **tugas/wireframe UI**, bukan aplikasi produksi.
