import 'package:digicard/app/services/contacts_service.dart';

extension ContactsServiceExtension on ContactsService {
  bool isExist({required int? id}) {
    final temp = contacts.indexWhere((e) => e.id == id);
    return temp != -1 ? true : false;
  }
}
