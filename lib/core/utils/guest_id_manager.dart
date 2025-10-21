import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class GuestIdManager {
  static const String _guestUidKey = 'guest_uid';

  // Generate or retrieve existing guest UUID
  static Future<String> getGuestId() async {
    final prefs = await SharedPreferences.getInstance();
    String? guestId = prefs.getString(_guestUidKey);

    // If no ID exists, generate a new one
    if (guestId == null) {
      guestId = const Uuid().v4(); // Random UUID
      await prefs.setString(_guestUidKey, guestId);
    }

    return guestId;
  }

  // Clear guest ID (if user logs in properly)
  static Future<void> clearGuestId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_guestUidKey);
  }
}