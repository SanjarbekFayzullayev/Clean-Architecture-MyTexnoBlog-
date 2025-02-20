import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:texno_blog/core/secrets/app_secrets.dart';
import 'package:get_it/get_it.dart';
import 'package:texno_blog/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:texno_blog/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:texno_blog/features/auth/domain/repository/auth_repository.dart';
import 'package:texno_blog/features/auth/domain/usecases/user_sign_up.dart';

final sericeLoacator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  final supBase = await Supabase.initialize(
      url: AppSecrets.sBaseUrl, anonKey: AppSecrets.sBaseAnonKey);
  sericeLoacator.registerLazySingleton(
    () => supBase.client,
  );
}

void _initAuth() {
  sericeLoacator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      sericeLoacator(),
    ),
  );

  sericeLoacator.registerFactory(
    () => AuthRepositoryImpl(
      sericeLoacator(),
    ),
  );

  sericeLoacator.registerFactory(
    () => UserSignUp(
      sericeLoacator(),
    ),
  );
}
