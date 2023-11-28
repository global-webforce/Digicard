import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerService {
  static Future<bool> checkAndRequestPermission(Permission permission) async {
    // Check if the permission is already granted
    if (await permission.isGranted) {
      return true;
    } else {
      // Request the permission if it hasn't been granted
      final status = await permission.request();
      return status == PermissionStatus.granted;
    }
  }
}
