import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifs {



  void androidFCM() async {

  final notificationSettings = await FirebaseMessaging.instance.requestPermission(provisional: true );
  }

  void webFCM() async {
    final fcmToken = await FirebaseMessaging.instance.getToken(vapidKey: "BO1lGHgcWJXK1vANSjKKMAScw5CEXFfzFKUZlfufe1MrKSTa5pUET-wPxUxx0O2UcAxZj2fjmSx_Nog8hNu6EEM");
  }
}