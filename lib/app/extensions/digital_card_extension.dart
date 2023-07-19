import 'package:digicard/app/env/env.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/models/digital_card.dart';

extension DigitalCardExtension on DigitalCard {
  String fullName() {
    return "${accreditations ?? ''} ${prefix ?? ''} ${firstName ?? ''} ${middleName ?? ''} ${lastName ?? ''} ${suffix ?? ''}"
        .clean();
  }

  String get avatarHttpUrl {
    return "${Env.supabaseAvatarUrl}$avatarUrl";
  }

  String get logoHttpUrl {
    return "${Env.supabaseLogoUrl}$logoUrl";
  }

  bool isOwnedBy(val) {
    return userId == val;
  }

  bool isInContacts(List<DigitalCard> contactList) {
    return false;
  }

  static Map<String?, dynamic> toMapCreate(Map<String, dynamic> value) {
    value.remove("id");
    value.remove("uuid");
    value.remove("added_at");
    value.remove("created_at");
    value.remove("updated_at");
    value.remove("custom_links");
    value.remove("full_name");
    value.remove("avatar_file");
    value.remove("logo_file");
    return value;
  }

  static Map<String?, dynamic> toMapUpdate(Map<String, dynamic> value) {
    value.remove("id");
    value.remove("avatar_file");
    value.remove("logo_file");
    value.remove("added_at");
    value.remove("created_at");
    value.remove("updated_at");
    return value;
  }

  DigitalCard sanitize() {
    return DigitalCard(
        id: id,
        accreditations: accreditations.clean().toTitleCase(),
        firstName: firstName.clean().toTitleCase(),
        middleName: middleName.clean().toTitleCase(),
        lastName: lastName.clean().toTitleCase(),
        maidenName: maidenName.clean().toTitleCase(),
        preferredName: preferredName.clean().toTitleCase(),
        suffix: suffix.clean().toTitleCase(),
        title: suffix.clean().toTitleCase(),
        company: company.clean().toTitleCase(),
        department: department.clean().toTitleCase(),
        headline: headline.clean().toTitleCase(),
        pronouns: pronouns.clean().toTitleCase(),
        uuid: uuid,
        color: color,
        userId: userId,
        prefix: prefix.clean().toTitleCase(),
        customLinks: customLinks);
  }
}
