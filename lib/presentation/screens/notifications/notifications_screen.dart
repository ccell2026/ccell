import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:login_page/features/notifications/notification_model.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationsPage> {
  late Future<List<NotificationModel>> futureNotifications;

  @override
  void initState() {
    super.initState();
    futureNotifications = fetchNotifications();
  }

  Future<List<NotificationModel>> fetchNotifications() async {
    final response = await http.get(
      Uri.parse('https://ccell-notification-api.onrender.com/api/notifications'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => NotificationModel.fromJson(data)).toList().reversed.toList();
    } else {
      throw Exception('Failed to load notifications');
    }
  }

  Future<void> _refreshNotifications() async {
    setState(() {
      futureNotifications = fetchNotifications();
    });
  }

  String formateDate(String isoString) {
    final date = DateTime.parse(isoString);
    return "${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}   ${date.day}/${date.month}/${date.year}";
  }

  String formatEventDate(DateTime date) {
    return DateFormat("d MMMM, yyyy").format(date);
  }

  Color withOpacity(Color color, double opacity) {
    return Color.fromARGB(
      (opacity * 255).round(),
      (color.r * 255.0).round() & 0xff,
      (color.g * 255.0).round() & 0xff,
      (color.b * 255.0).round() & 0xff,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final Color fadedOnSurface = themeData.colorScheme.onSurface.withAlpha(178);

    return Scaffold(
      backgroundColor: themeData.scaffoldBackgroundColor,
      body: RefreshIndicator(
        onRefresh: _refreshNotifications,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Center(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Container(
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              themeData.colorScheme.surface,
                              themeData.colorScheme.surface.withAlpha(178),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.notifications_active,
                          color: themeData.colorScheme.onSurface,
                          size: 32.r,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Notifications',
                        style: GoogleFonts.poppins(
                          color: themeData.colorScheme.onSurface,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: FutureBuilder<List<NotificationModel>>(
                  future: futureNotifications,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 48,
                              color: themeData.colorScheme.error,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Error loading notifications',
                              style: TextStyle(
                                color: themeData.colorScheme.onSurface,
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                              onPressed: _refreshNotifications,
                              child: Text(
                                'Retry',
                                style: TextStyle(
                                  color: themeData.colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(
                        child: Text(
                          'No notifications',
                          style: TextStyle(
                            color: themeData.colorScheme.onSurface.withValues(alpha: 179),
                          ),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final notification = snapshot.data![index];
                        return Card(
                          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                          color: themeData.colorScheme.surface.withValues(alpha: 26),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: themeData.colorScheme.onSurface.withValues(alpha: 26),
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(16.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notification.title,
                                  style: GoogleFonts.poppins(
                                    color: themeData.colorScheme.onSurface,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  notification.message,
                                  style: GoogleFonts.inter(
                                    color: fadedOnSurface,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      formateDate(notification.datePosted),
                                      style: GoogleFonts.inter(
                                        color: fadedOnSurface,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}