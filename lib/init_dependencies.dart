import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:texno_blog/core/secrets/app_secrets.dart';
import 'package:get_it/get_it.dart';
final sericeLoacator=GetIt.instance;
Future<void>initDependencies()async{
  final supBase = await Supabase.initialize(
      url: AppSecrets.sBaseUrl, anonKey: AppSecrets.sBaseAnonKey);
}