import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true, path: '.env.dev')
abstract class Env {
  @EnviedField(varName: 'SITE_URL')
  static final String siteUrl = _Env.siteUrl;

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
