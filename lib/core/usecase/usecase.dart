import 'package:fpdart/fpdart.dart';
import 'package:texno_blog/core/error/failures.dart';

abstract interface class UseCase<SuccessType,Params>{
  Future<Either<Failures,SuccessType>> call(Params params);

}