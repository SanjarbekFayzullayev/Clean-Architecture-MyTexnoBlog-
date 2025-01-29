import 'package:fpdart/fpdart.dart';
import 'package:texno_blog/core/error/failures.dart';

abstract interface class AuthRepository {
 Future <Either<Failures, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
 Future <Either<Failures, String>> loginUpWithEmailPassword({
   required String email,
   required String password,
 });
}
