import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const GroceriaApp());
}

class GroceriaApp extends StatelessWidget {
  const GroceriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groceria Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const LoginScreen(),
    );
  }
}
