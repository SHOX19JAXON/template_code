import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'app/app.dart';
import 'data/local/storage_repository.dart';
//
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   debugPrint(
//       "BACKGROUND MODE DA PUSH NOTIFICATION KELDI:${message.notification!.title}");
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  await StorageRepository.init();
  bool isOnNotification = StorageRepository.getBool(key: "is_valid_notification");
  if (isOnNotification) {
    StorageRepository.setBool(key: "is_valid_notification", value: true);
  }
  runApp(MyApp());
}