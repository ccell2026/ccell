import 'dart:convert';
import 'package:login_page/notifications_api/notification_model.dart';
import 'package:http/http.dart' as http;

Future<List<NotificationModel>> fetchNotifications() async {
  final response = await http.get(
    Uri.parse('https://ccell-notification-api.onrender.com/api/notifications')
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((jsonItem) => NotificationModel.fromJson(jsonItem)).toList();
  }  else {
throw Exception('Failed to load notifications');
}
}


