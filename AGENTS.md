# AGENTS.md

## What this repo is

- Flutter (Dart) **UI-only wireframe**: "Groceria" grocery-store app. **No backend, no database, no state management, no business logic** — all data is hardcoded dummy data and buttons only navigate.
- Port of a PHP web project (`../Final-Project-PBW`). Do not add networking, persistence, or auth logic unless explicitly asked; this is a coursework wireframe (`UTS PBM`).
- Docs and code comments are in **Indonesian**; keep new ones consistent.

## Commands

Flutter SDK is **not currently on PATH on this machine** (README §"Instalasi Flutter" has setup steps). Once installed:

```powershell
flutter create .      # one-time: generates android/, ios/, etc. — safe, does not touch lib/
flutter pub get       # dependencies (fl_chart ^0.68.0)
flutter analyze       # lint — flutter_lints via analysis_options.yaml
flutter test          # test/smoke_test.dart is an empty placeholder; there are no real tests
flutter run -d chrome # fastest way to preview UI
```

Verification order: `flutter analyze` → `flutter test`.

## Structure & entrypoints

- Entry: `lib/main.dart` → `MaterialApp(home: LoginScreen)`.
- `lib/screens/` in three groups: `auth/` (5), `admin/` (8), `transaksi/` (3). The authoritative screen inventory with file paths is the table in `README.md`.
- Shared chrome lives in `lib/widgets/`: `app_scaffold.dart` (Drawer + AppBar — **the drawer menu items that wire screens together are here**), `stat_card.dart`, `badge.dart`.
- `lib/formatters.dart` holds `Fmt` (rupiah formatting) and `Dummy` (shared dummy data).
- `lib/theme.dart` holds the full color palette (greens `#10201D`/`#556D4F`, bg `#F4F6F3`) and text styles.

## Conventions & gotchas

- Navigation is plain `Navigator.push(MaterialPageRoute(...))` everywhere — **no named routes, no router package**. Logout uses `pushAndRemoveUntil` back to Login.
- Reuse `AppTheme` colors and the existing widgets instead of introducing new colors/styles or a new design system.
- `fl_chart` is used only by `lib/screens/admin/laporan_screen.dart`.
- Platform folders (`android/`, `ios/`, ...) are not committed; run `flutter create .` before any build/run on a fresh checkout.
- Adding/editing a screen usually means also adding its Drawer entry in `lib/widgets/app_scaffold.dart`.
