import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'notification_model.dart';
import 'package:login_page/presentation/screens/profile/profile_page.dart';

Future<void> postNotification(NotificationModel notification, String email) async {
  final url = Uri.parse('https://ccell-notification-api.onrender.com/api/notifications'); // Replace with your real URL

  try {

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        'X-User-Email': ?FirebaseAuth.instance.currentUser?.email,
      },
      body: jsonEncode(notification.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("✅ Notification posted successfully");
    } else {
      print("❌ Failed with status: ${response.statusCode}: ${response.body}");
    }
  } catch (e) {
    print("⚠️ Error posting notification: $e");
  }
}
