import 'package:fpdart/fpdart.dart';
import 'package:texno_blog/core/error/failures.dart';
import 'package:texno_blog/features/auth/domain/entites/user.dart';

abstract interface class AuthRepository {
 Future <Either<Failures, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
 Future <Either<Failures, User>> loginUpWithEmailPassword({
   required String email,
   required String password,
 });
}
