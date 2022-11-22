import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  static Future<void> configure() async {
    var status1 = await Permission.storage.status;
    if (!status1.isGranted) {
      await Permission.storage.request();
    }
    var status2 = await Permission.manageExternalStorage.status;
    if (!status2.isGranted) {
      await Permission.manageExternalStorage.request();
    }
    var status3 = await Geolocator.checkPermission();
    if (status3 != LocationPermission.always) {
      await Geolocator.requestPermission();
    }
  }
}
