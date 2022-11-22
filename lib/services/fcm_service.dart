import 'package:cocuisinage_app_mobile_pro_mobile_pro/services/auth_api.dart';
import 'package:cocuisinage_app_mobile_pro_mobile_pro/utils/globals.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class FCMService {
  static Future<void> configure({required BuildContext context}) async {
    await Firebase.initializeApp();
    final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

    firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.instance.getToken().then((String? token) {
      if (token != null) {
        updateProfileWS(professionalID: Globals.profile.id, fcmToken: token);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      Globals.profile = await getUserWS();

      print('Message data: ${message.data}');
      showTopSnackBar(
        context,
        CustomSnackBar.info(
          message:
              '${message.notification?.title}\n${message.notification?.body}',
          maxLines: 3,
        ),
        dismissType: DismissType.onSwipe,
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      Globals.profile = await getUserWS();

      print('Message opened!');
      print('Message data: ${message.data}');
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();

    Globals.profile = await getUserWS();

    print('Handling a background message ${message.data}');
  }
}
