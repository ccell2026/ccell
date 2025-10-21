import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // modified by cursor - updated to work with NotificationRepository
  Future<void> initNotifications() async {
    try {
      // Request permissions (works differently on web/mobile)
      NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
          if (kDebugMode) {
          print("✅ Notification permissions granted");
          }
      } else {
        if (kDebugMode) {
          print("❌ Notification permissions denied");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("⚠️ Notification init failed: $e");
      }
    }
  }

  // modified by cursor - removed duplicate token registration methods
  // Token registration is now handled by NotificationRepository
}