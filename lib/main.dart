import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:texno_blog/core/secrets/app_secrets.dart';
import 'package:texno_blog/core/theme/theme.dart';
import 'package:texno_blog/features/auth/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supBase= await Supabase.initialize(
      url: AppSecrets.sBaseUrl, anonKey: AppSecrets.sBaseAnonKey);
  runApp(const MyApp(),);
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
