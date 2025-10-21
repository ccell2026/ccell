import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';

import 'package:login_page/presentation/screens/about/about_ccell_page.dart';
import 'package:login_page/notifications_api/post_screen.dart';

import 'AboutCCellPage.dart';
import 'notifications_api/post_screen.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  bool _isAuthorized = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    checkAuthorization();
  }

  Future<void> checkAuthorization() async {
    try {
      final userEmail = FirebaseAuth.instance.currentUser?.email;
      print("Checking auth for user: $userEmail");

      if (userEmail == null) {
        print("No user logged in.");
        setState(() {
          _isAuthorized = false;
          _isLoading = false;
        });
        return;
      }

      final response = await http.get(
        Uri.parse('https://ccell-notification-api.onrender.com/api/auth/approved-senders'),
      );
      print("API Status: ${response.statusCode}");
      print("API Response: ${response.body}");

      if (response.statusCode == 200) {
        final List<dynamic> approvedEmails = jsonDecode(response.body);
        print("Approved Emails: $approvedEmails");

        setState(() {
          _isAuthorized = approvedEmails.contains(userEmail);
          _isLoading = false;
        });
      } else {
        print("Non-200 response");
        setState(() {
          _isAuthorized = false;
          _isLoading = false;
        });
      }
    } catch (e) {
      print("Error while checking auth: $e");
      setState(() {
        _isAuthorized = false;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'More',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 24),
              if (_isLoading)
                Center(
                  child: CircularProgressIndicator(
                    color: theme.colorScheme.primary,
                  ),
                )
              else ...[
                if (_isAuthorized)
                  Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: theme.colorScheme.primary.withOpacity(0.2),
                      ),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationInputScreen(),
                          ),
                        );
                      },
                      leading: Icon(
                        Icons.notifications_active,
                        color: theme.colorScheme.primary,
                      ),
                      title: Text(
                        'Post a Notification',
                        style: GoogleFonts.poppins(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        'Create and send notifications',
                        style: GoogleFonts.inter(
                          color: theme.colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: theme.colorScheme.onSurface.withOpacity(0.5),
                        size: 16,
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: theme.colorScheme.onSurface.withOpacity(0.1),
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutCCellPage(),
                        ),
                      );
                    },
                    leading: Icon(
                      Icons.info_outline,
                      color: theme.colorScheme.onSurface,
                    ),
                    title: Text(
                      'About C-Cell',
                      style: GoogleFonts.poppins(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      'Learn more about the Counselling Cell',
                      style: GoogleFonts.inter(
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: theme.colorScheme.onSurface.withOpacity(0.5),
                      size: 16,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
