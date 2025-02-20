import 'package:fpdart/fpdart.dart';
import 'package:texno_blog/core/error/exceptions.dart';
import 'package:texno_blog/core/error/failures.dart';
import 'package:texno_blog/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:texno_blog/features/auth/domain/entites/user.dart';
import 'package:texno_blog/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failures, User>> loginUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return _getUser(
      () async => await remoteDataSource.loginUpWithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failures, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.signUpWithEmailPassword(
          name: name, email: email, password: password);
      return right(user);
    } on ServerExceptions catch (e) {
      return left(Failures(e.message));
    }
  }

  Future<Either<Failures, User>> _getUser(Future<User> Function() fn) async {
    try {
      final user = await fn();
      return right(user);
    } on ServerExceptions catch (e) {
      return left(Failures(e.message));
    }
  }
}
