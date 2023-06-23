# Digicard
 

Known Bugs

Supabase "copy" async method
  - this method always returns an error even if the operation is succcessful

 "type 'Null' is not a subtype of type 'String' in type cast"

 as a workaround, we wrap it inside a try catch and if the error contains the said error,
 we will just assume that the method is successful and proceed to execute next codes



Supabase Password Reset Flow
 https://github.com/orgs/supabase/discussions/3360#discussioncomment-3947228


 flutter pub run build_runner build --delete-conflicting-outputs --build-filter="lib/app/routes/app_router.dart"

 flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs


 flutter clean && flutter pub get &&  flutter pub run build_runner build --delete-conflicting-outputs && flutter build web --release

 https://supabase.com/docs/guides/auth/auth-password-reset


 OFFICIAL DOCS:
https://pub.dev/packages/freezed

Gawa ng mabilisan base freezed class
1. https://marketplace.visualstudio.com/items?itemName=blaxou.freezed
2. Ctrl + Shift + P > Freezed: generate a new...



YOU CAN FOLLOWING

1. Asserts
https://pub.dev/packages/freezed#asserts
     - ung may custom message ka sa red screen error like "User id must not be null".
2. Default value
https://pub.dev/packages/freezed#default-values
2. Custom Deprecate Messages + Dev Comments
https://pub.dev/packages/freezed#decorators-and-comments
     - ipaalam sa other devs na deprecated na ung property ng model, parang may bago na.
     - ung sa vscode na "____ is deprecated" 