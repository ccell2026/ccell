import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class COSHAScreen extends StatelessWidget {
  void _launchPhone(String phone) async {
    final Uri uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchEmail(String email) async {
    final Uri uri = Uri(scheme: 'mailto', path: email);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 25.h),
              SizedBox(
                height: 140.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 60.r,
                        backgroundImage: AssetImage(
                          "assets/images/cosha_logo.jpg",
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Positioned(
                      top: 10.h,
                      left: 15.w,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: theme.colorScheme.onSurface.withOpacity(0.2),
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: theme.colorScheme.onSurface,
                            size: 30.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  "A college is composed of many things: students, professors, academic blocks, hostels, mess etc. For the proper functioning of everything lying beneath the biosphere of Hostels, Mess and Canteen, Committee of Students for Hostel Affairs (COSHA) is the way to go. COSHA supervises all matters of common interest to the Hostels, whilst handling queries, complaints and suggestions regarding Mess and Canteen. Be it improving the mess menu, lodging a complaint regarding canteen shops, or raising a query related to the habitable conditions of hostels; Cosha is inculcated with the responsibility of being the voice of students and relaying their valid concerns to the higher authorities. A meeting of COSHA is chaired by the President, and consists of the Convenor of COSHA, Hall Representatives and Chief Warden/Wardens. In a meeting, COSHA puts forward the students’ candid views and tries to establish a common ground. COSHA believes in eliminating all complaints, relaying constructive suggestions and maintaining transparency at all fronts.",
                  style: GoogleFonts.inter(
                    color: theme.colorScheme.onSurface,
                    fontSize: 9.sp,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: theme.colorScheme.onSurface.withOpacity(0.2),
                      width: 2.w,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 4.h,
                    ),
                    title: Text(
                      "Mr. Ashish Goyal",
                      style: GoogleFonts.inter(
                        color: theme.colorScheme.onSurface,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "COSHA Head",
                      style: GoogleFonts.inter(
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                        fontSize: 10.sp,
                      ),
                    ),
                    trailing: Wrap(
                      spacing: 12,
                      children: [
                        IconButton(
                          onPressed: () => _launchPhone("6377079159"),
                          icon: Icon(Icons.call, color: theme.colorScheme.secondary),
                        ),
                        IconButton(
                          onPressed: () => _launchEmail("cosha@lnmiit.ac.in"),
                          icon: Icon(Icons.mail, color: theme.colorScheme.tertiary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
