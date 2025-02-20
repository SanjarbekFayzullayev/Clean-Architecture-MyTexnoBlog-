import 'package:fpdart/fpdart.dart';
import 'package:texno_blog/core/error/failures.dart';
import 'package:texno_blog/core/usecase/usecase.dart';
import 'package:texno_blog/features/auth/domain/entites/user.dart';
import 'package:texno_blog/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;

  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failures, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
        email: params.email, password: params.password, name: params.name);
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({required this.email, required this.password, required this.name});
}
