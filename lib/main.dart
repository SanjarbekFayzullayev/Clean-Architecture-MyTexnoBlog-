import 'package:flutter/material.dart';
import 'package:texno_blog/core/theme/theme.dart';
import 'package:texno_blog/features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Texno Blog',
      theme: AppTheme.dartThemeMode,
      home: const LoginPage(),
    );
  }
}
