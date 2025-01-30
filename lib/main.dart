import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:texno_blog/core/secrets/app_secrets.dart';
import 'package:texno_blog/core/theme/theme.dart';
import 'package:texno_blog/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:texno_blog/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:texno_blog/features/auth/domain/usecases/user_sign_up.dart';
import 'package:texno_blog/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:texno_blog/features/auth/presentation/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supBase = await Supabase.initialize(
      url: AppSecrets.sBaseUrl, anonKey: AppSecrets.sBaseAnonKey);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            userSignUp: UserSignUp(
              AuthRepositoryImpl(
                AuthRemoteDataSourceImpl(supBase.client as Supabase),
              ),
            ),
          ),
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
