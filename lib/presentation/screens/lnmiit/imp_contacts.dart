import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ImportantContactsPage extends StatelessWidget {
  const ImportantContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23), // Same dark blue background
      appBar: AppBar(
        title: Text(
            'IMPORTANT CONTACTS',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20.sp,
          ),
        ),
        backgroundColor: const Color(0xFF0E1A23),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContactCard(
                name: 'Dr. Rahul Banerjee',
                designation: 'Director',
                email: 'rahul.banerjee@lnmiit.ac.in',
                imageAsset: 'assets/pages/faces/rahul_banerjee.jpg',
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'Dr. Sandeep Saini',
                designation: 'Dean of Academic Affairs',
                email: 'dean.academics@lnmiit.ac.in',
                imageAsset: 'assets/pages/faces/sandeep_saini.jpg',
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'Dr. Nabyendu Das',
                designation: 'Dean of Student Affairs',
                email: 'dean.students@lnmiit.ac.in',
                imageAsset: 'assets/pages/faces/nabyendu_das.jpg',
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'Mr. Rajeev Saxena',
                designation: 'Assistant Registrar - Academic',
                email: 'aracademic@lnmiit.ac.in',
                imageAsset: 'assets/pages/faces/rajeev_saxena.jpg',
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'Mr. Devaram Rabri',
                designation: 'Finance Assistant',
                email: 'devadewasi@lnmiit.ac.in',
                imageAsset: 'assets/pages/faces/devaram_rabri.jpg',
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'Mr. Samar Singh',
                designation: 'Assistant Registrar - Academic',
                email: 'arss@lnmiit.ac.in',
                imageAsset: 'assets/pages/faces/rajeev_saxena.jpg',
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'Dr. Chand Singh Panwar',
                designation: 'Resident Doctor',
                email: 'medicalofficer@lnmiit.ac.in',
                imageAsset: 'assets/pages/faces/dr_chand.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required String name,
    required String designation,
    String? email,
    String? imageAsset,
    String? phone,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF3A4B57), // Lighter top-left
            Color(0xFF2A3B47), // Medium middle
            Color(0xFF1A2B37), // Darker bottom-right
          ],
          stops: [0.0, 0.5, 1.0],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(-1, -1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile Image
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF4A5B67),
              borderRadius: BorderRadius.circular(12),
              image: imageAsset != null
                  ? DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover,
              )
                  : null,
            ),
            child: imageAsset == null
                ? const Icon(
              Icons.person,
              size: 28,
              color: Colors.white,
            )
                : null,
          ),
          const SizedBox(width: 16),
          // Contact Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  designation,
                  style: const TextStyle(
                    color: Color(0xFFB0B0B0),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Action Buttons
          Row(
            children: [
              if (email != null) ...[
                GestureDetector(
                  onTap: () => _launchEmail(email),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A5B67),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.email_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              if (phone != null) ...[
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _launchPhone(phone!),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A5B67),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.phone_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      // query: 'subject=Inquiry&body=Hello,',
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        // Fallback to Gmail web if app is not available
        final Uri gmailUri = Uri.parse('https://mail.google.com/mail/?view=cm&to=$email');
        if (await canLaunchUrl(gmailUri)) {
          await launchUrl(gmailUri, mode: LaunchMode.externalApplication);
        }
      }
    } catch (e) {
      print('Error launching email: $e');
    }
  }

  Future<void> _launchPhone(String phone) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);

    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      }
    } catch (e) {
      print('Error launching phone: $e');
    }
  }
}

