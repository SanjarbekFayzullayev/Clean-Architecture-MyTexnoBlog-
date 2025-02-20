import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:texno_blog/core/error/exceptions.dart';
import 'package:texno_blog/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<UserModel> loginUpWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Supabase supBaseClient;

  AuthRemoteDataSourceImpl(this.supBaseClient);

  @override
  Future<UserModel> loginUpWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supBaseClient.client.auth.signInWithPassword(
        password: password,
        email: email,

      );
      if (response.user == null) {
        throw ServerExceptions("User is null");
      }
      return UserModel.formJson(response.user!.toJson());
    } catch (e) {
      throw ServerExceptions(e.toString());
    }

    // // TODO: implement loginUpWithEmailPassword
    // throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supBaseClient.client.auth
          .signUp(password: password, email: email, data: {
        "name": name,
      });
      if (response.user == null) {
        throw ServerExceptions("User is null");
      }
      return UserModel.formJson(response.user!.toJson());
    } catch (e) {
      throw ServerExceptions(e.toString());
    }
  }
}
