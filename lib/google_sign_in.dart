import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/loading_screen.dart';
import 'package:login_page/notifications_api/notification_state.dart';
import 'package:login_page/utils/guest_id_manager.dart';
import 'package:provider/provider.dart'; // modified by cursor - added provider import
import 'notification_repository.dart'; // modified by cursor - added notification repository import




// modified by cursor - updated to use NotificationRepository
Future<void> initializeFCM(BuildContext context, String userId) async {
  final notificationRepo = Provider.of<NotificationRepository>(context, listen: false);
  
  try {
    // Register token using repository
    await notificationRepo.registerToken(userId: userId);
    
    // Subscribe to topics using repository
    await notificationRepo.subscribeToTopic('all-users');

    if (kDebugMode) {
      print('✅ FCM initialized for user: $userId');
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ FCM initialization failed: $e');
    }
  }
}
Future<void> signInWithCollegeGoogleAccount(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> requestNotificationPermission() async {

    final settings = await FirebaseMessaging.instance.requestPermission();
    NotificationState.permissionGranted =
        settings.authorizationStatus == AuthorizationStatus.authorized;

  }

  try {
    // Sign out previous sessions just in case
    await googleSignIn.signOut();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      // User cancelled sign-in
      return;
    }

    final String email = googleUser.email;
    if (!email.endsWith('@lnmiit.ac.in')) {
      await googleSignIn.signOut();

      await showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 245, 245, 245),
            title: const Text('Used an Invalid Email'),
            content: const Text('Please use your LNMIIT Email ID to Sign In.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 239, 210, 210),
                  side: const BorderSide(
                    color: Color.fromARGB(255, 86, 3, 3),
                    width: 2,
                  ),
                ),
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    color: Color.fromARGB(255, 86, 3, 3),
                  ),
                ),
              ),
            ],
          );
        },
      );
      return;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    final String userName = userCredential.user?.displayName ?? 'User';

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // modified by cursor - use repository-based FCM initialization
      await initializeFCM(context, user.email ?? user.uid);
      NotificationState.permissionGranted = true;
      requestNotificationPermission();
    } else {
      if (kDebugMode) {
        print("❌ Firebase user not logged in");
      }
    }

    // Clear guest ID and merge account if needed
    await GuestIdManager.clearGuestId();

    // Navigate to loading screen, then to home screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoadingScreen(userName: userName),
      ),
    );
  } catch (e) {
    if (kDebugMode) {
      print('Sign-in failed: $e');
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login failed. Please Refresh and Try Again'),
        backgroundColor: Colors.red,
      ),
    );
  }
}