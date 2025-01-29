import 'package:fpdart/fpdart.dart';
import 'package:texno_blog/core/error/exceptions.dart';
import 'package:texno_blog/core/error/failures.dart';
import 'package:texno_blog/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:texno_blog/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, String>> loginUpWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginUpWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailPassword(
          name: name, email: email, password: password);
      return right(userId);
    } on ServerExceptions catch (e) {
      return left(Failures(e.message));
    }
  }
}
