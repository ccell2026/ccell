import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HODsPage extends StatelessWidget {
  const HODsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      appBar: AppBar(
        title: const Text(
          'HEAD OF DEPARTMENTS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.9,
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
                name: 'Dr. Rajbir Kaur',
                designation: 'CSE',
                email: 'rajbirkaur@lnmiit.ac.in',
                imageAsset: 'assets/pages/faces/rajbir_kaur.jpg'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'Dr. Sunil Kumar',
                designation: 'CCE',
                email: 'sunil@lnmiit.ac.in',
                imageAsset: 'assets/pages/faces/sunil_kumar.png'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'Prof. Kusum Lata',
                designation: 'ECE',
                email: 'kusum@lnmiit.ac.in',
                imageAsset: 'assets/pages/faces/kusum_lata.jpg'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'Dr. Deepak Rajendra Unune',
                designation: 'MME',
                email: 'deepak.unune@lnmiit.ac.in',
                imageAsset: 'assets/pages/faces/deepak_rajendra_unune.jpg'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Dr. Manish Kumar Singh',
                  designation: 'Physics',
                  email: 'mksingh@lnmiit.ac.in',
                  imageAsset: 'assets/pages/faces/manish_kumar_singh.jpg'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Dr. Harsh Chandrakant Trivedi',
                  designation: 'Mathematics',
                  email: 'harsh.trivedi@lnmiit.ac.in',
                  imageAsset: 'assets/pages/faces/harsh_chandrakant_trivedi.jpg'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Dr. Rajbala Singh',
                  designation: 'Humanities and Social Sciences',
                  email: 'rajbala@lnmiit.ac.in',
                  imageAsset: 'assets/pages/faces/rajbala_singh.jpg'
              ),
              const SizedBox(height: 12),
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
            Color(0xFF1A2B37),
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