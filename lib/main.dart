import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:texno_blog/core/secrets/app_secrets.dart';
import 'package:texno_blog/core/theme/theme.dart';
import 'package:texno_blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:texno_blog/features/auth/presentation/pages/login_page.dart';
import 'package:texno_blog/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sericeLoacator<AuthBloc>(),
        )
      ],
      child: const MyApp(),
    ),
  );
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
