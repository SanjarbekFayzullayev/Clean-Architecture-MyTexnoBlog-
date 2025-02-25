

import 'package:fpdart/fpdart.dart';
import 'package:texno_blog/core/error/failures.dart';
import 'package:texno_blog/core/usecase/usecase.dart';
import 'package:texno_blog/features/auth/domain/entites/user.dart';
import 'package:texno_blog/features/auth/domain/repository/auth_repository.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository authRepository;
  const UserLogin(this.authRepository);

  @override
  Future<Either<Failures, User>> call(UserLoginParams params) async {
    return await authRepository.loginUpWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}



class UserLoginParams {
  final String email;
  final String password;
  UserLoginParams({required this.email, required this.password});
}