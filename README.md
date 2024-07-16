# Welcome to Digicard!!!

# SETUP

## **Managing .env File**

Located at project root, contains credentials in key-value format for services used by the app.

Project uses https://pub.dev/packages/envied to implement .env file
Implementation guide: https://codewithandrea.com/articles/flutter-api-keys-dart-define-env-files/
Troubleshooting guide: https://github.com/petercinibulk/envied/issues/28

1. Project root > .env ( manage the key-value pairs here )
2. Go to lib > app > env > env.dart

For Local:
@Envied(obfuscate: true, path: '.env.dev')

For production:

    @Envied(obfuscate:  true, path:  '.env')

3.  Run `flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs && flutter run -d chrome --web-hostname localhost --web-port 8000`

# Supabase Flutter

**Note:** Supabase doesn't support hash-based url as of July 2023
e.g `http://localhost:8000/#/` and must only be `http://localhost:8000/`

On Dashboard > Authentication > URL Configuration > set Site URL e.g `http://localhost:8000/`

Registration confirmation link example:

    https://kbetklswsjdfouluglbr.supabase.co/auth/v1/verify?redirect_to=http://localhost:8000/&token=c3fb&type=signup

Reset password flow guide:
https://github.com/orgs/supabase/discussions/3360#discussioncomment-3947228

Reset password confirmation link example:

    https://kbetklswsjdfouluglbr.supabase.co/auth/v1/verify?redirect_to=http://localhost:8000/&token=dfb5&type=recovery

**Important:** If you're app is already running on a custom domain, make sure you add it on Dashboard > Authentication > URL Configuration > Redirect URLs add url e.g `https://myownwebsite.com/` , or else redirection will not work.

**Known Bug(s):**

The `copy` method returns an exception _~~type 'Null' is not a subtype of type 'String' in type cast~~_ even if the operation executed successfully, so we have to wrap it with try catch in dart and prevent to propagate the specific exception.

    await _supabase.storage.from("images").copy(
                    "$originalFilePath",
                    "$destionationFilePath",
                  );

## Freezed

Project uses https://pub.dev/packages/freezed to generate models easily

1. On VSCode `Ctrl + Shift + P > Freezed: generate a new...`

Implementing _Uint8List_ on models: https://github.com/rrousselGit/freezed/issues/457#issuecomment-850445723

## Quick commands:

Building web for deployment:

    flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs && flutter build web --release
