import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

Future <List<String>> fetchApprovedSenders() async {
  final response = await http.get(Uri.parse('https://ccell-notification-api.onrender.com/api/auth/approved-senders'));

  if (response.statusCode == 200){
    final List<dynamic> jsonList = jsonDecode(response.body);
    return List<String>.from(jsonList);
  } else {
    throw Exception('Failed to load Approved Senders List');
  }
}

String? userEmail = FirebaseAuth.instance.currentUser!.email;

bool  isApproved(String userEmail, List<String> approvedEmails){
  return approvedEmails.contains(userEmail);
}