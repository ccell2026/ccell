import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NotificationRepository {
  final FirebaseMessaging _fcm;
  final http.Client _client;
  final String _baseUrl;

  NotificationRepository({
    required http.Client client,
    String? baseUrl,
    FirebaseMessaging? fcm,
  })  : _client = client,
        _baseUrl = baseUrl ?? 'https://ccell-notification-api.onrender.com/api', // modified by cursor - updated to correct base URL
        _fcm = fcm ?? FirebaseMessaging.instance;

  // ================== Core Methods ==================

  Future<void> registerToken({String? userId}) async {
    try {
      // Use VAPID key for web token generation
      final token = kIsWeb 
          ? await _fcm.getToken(vapidKey: "BO1lGHgcWJXK1vANSjKKMAScw5CEXFfzFKUZlfufe1MrKSTa5pUET-wPxUxx0O2UcAxZj2fjmSx_Nog8hNu6EEM")
          : await _fcm.getToken();
      if (token == null) return;

      final isGuest = userId == null;
      final guestUserId = isGuest ? await _getOrCreateGuestId() : null;
      
      final response = await _client.post(
        Uri.parse('$_baseUrl/notifications/register-token'), // modified by cursor - using correct endpoint
        headers: _headers,
        body: jsonEncode({
          'token': token,
          'userId': userId ?? guestUserId,
          'isGuest': isGuest,
        }),
      );

      _validateResponse(response);
      
      if (kDebugMode) {
        print('✅ Token registered successfully');
        print('User ID: ${userId ?? guestUserId}');
        print('Is Guest: $isGuest');
      }
    } catch (e) {
      _logError('Token registration failed', e);
      rethrow;
    }
  }

  Future<void> subscribeToTopic(String topic) async {
    try {
      // Use VAPID key for web token generation
      final token = kIsWeb 
          ? await _fcm.getToken(vapidKey: "BO1lGHgcWJXK1vANSjKKMAScw5CEXFfzFKUZlfufe1MrKSTa5pUET-wPxUxx0O2UcAxZj2fjmSx_Nog8hNu6EEM")
          : await _fcm.getToken();
      if (token == null) return;

      if (kIsWeb) {
        // For web, use backend topic subscription
        final response = await _client.post(
          Uri.parse('$_baseUrl/notifications/subscribe-topic'), // modified by cursor - using correct endpoint
          headers: _headers,
          body: jsonEncode({
            'token': token,
            'topic': topic,
          }),
        );
        _validateResponse(response);
        
        if (kDebugMode) {
          print('✅ Web topic subscription successful: $topic');
        }
      } else {
        // For mobile, use native FCM topics
        await _fcm.subscribeToTopic(topic);
        
        if (kDebugMode) {
          print('✅ Mobile topic subscription successful: $topic');
        }
      }
    } catch (e) {
      _logError('Topic subscription failed', e);
      rethrow;
    }
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    try {
      // Use VAPID key for web token generation
      final token = kIsWeb 
          ? await _fcm.getToken(vapidKey: "BO1lGHgcWJXK1vANSjKKMAScw5CEXFfzFKUZlfufe1MrKSTa5pUET-wPxUxx0O2UcAxZj2fjmSx_Nog8hNu6EEM")
          : await _fcm.getToken();
      if (token == null) return;

      if (kIsWeb) {
        // For web, use backend topic unsubscription
        final response = await _client.delete(
          Uri.parse('$_baseUrl/notifications/unsubscribe-topic?token=$token&topic=$topic'), // modified by cursor - using correct endpoint
          headers: _headers,
        );
        _validateResponse(response);
        
        if (kDebugMode) {
          print('✅ Web topic unsubscription successful: $topic');
        }
      } else {
        // For mobile, use native FCM topics
        await _fcm.unsubscribeFromTopic(topic);
        
        if (kDebugMode) {
          print('✅ Mobile topic unsubscription successful: $topic');
        }
      }
    } catch (e) {
      _logError('Topic unsubscription failed', e);
      rethrow;
    }
  }

  Future<void> mergeGuestAccount(String newUserId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final guestId = prefs.getString('guestId');
      if (guestId == null) return;

      final response = await _client.post(
        Uri.parse('$_baseUrl/notifications/merge-user?guestUserId=$guestId'), // modified by cursor - using correct endpoint
        headers: _headers,
      );

      _validateResponse(response);
      await prefs.remove('guestId');
      
      if (kDebugMode) {
        print('✅ Guest account merged successfully');
      }
    } catch (e) {
      _logError('Account merge failed', e);
      rethrow;
    }
  }

  // ================== Helpers ==================

  Future<String> _getOrCreateGuestId() async {
    final prefs = await SharedPreferences.getInstance();
    final guestId = prefs.getString('guestId') ?? 'guest_${DateTime.now().millisecondsSinceEpoch}';
    await prefs.setString('guestId', guestId);
    return guestId;
  }

  void _validateResponse(http.Response response) {
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('API request failed: ${response.statusCode} - ${response.body}');
    }
  }

  void _logError(String message, dynamic error) {
    if (kDebugMode) {
      print('❌ $message: $error');
    }
  }

  Map<String, String> get _headers => {
    'Content-Type': 'application/json',
  };
}