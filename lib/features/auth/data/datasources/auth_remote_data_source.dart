import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:texno_blog/core/error/exceptions.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginUpWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Supabase supBaseClient;

  AuthRemoteDataSourceImpl(this.supBaseClient);

  @override
  Future<String> loginUpWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginUpWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
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
      return response.user!.id;
    } catch (e) {
      throw ServerExceptions(e.toString());

    }
  }
}
