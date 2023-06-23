import 'package:envied/envied.dart';

part 'env.g.dart';
/*
https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/
https://github.com/petercinibulk/envied/issues/28
*/

@Envied(obfuscate: true, path: '.env.dev')
abstract class Env {
  @EnviedField(varName: 'SITE_URL')
  static final String siteUrl = _Env.siteUrl;

  @EnviedField(varName: 'SITE_URL_NO_HASH')
  static final String siteUrlNoHash = _Env.siteUrlNoHash;

  @EnviedField(varName: 'CARD_URL')
  static final String cardUrl = _Env.cardUrl;

  @EnviedField(varName: 'SUPABASE_URL')
  static final String supabaseUrl = _Env.supabaseUrl;

  @EnviedField(varName: 'SUPABASE_ANON_KEY')
  static final String supabaseAnonKey = _Env.supabaseAnonKey;

  @EnviedField(varName: 'SUPABASE_AVATAR_URL')
  static final String supabaseAvatarUrl = _Env.supabaseAvatarUrl;

  @EnviedField(varName: 'SUPABASE_LOGO_URL')
  static final String supabaseLogoUrl = _Env.supabaseLogoUrl;
}
