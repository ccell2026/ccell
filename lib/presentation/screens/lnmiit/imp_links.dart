// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class LinksPage extends StatelessWidget {
//   const LinksPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF0E1A23),
//       appBar: AppBar(
//         title: const Text(
//           'IMPORTANT LINKS',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 0.9,
//           ),
//         ),
//         backgroundColor: const Color(0xFF0E1A23),
//         foregroundColor: Colors.white,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildLinkCard(
//                   title: 'Youtube',
//                   link: 'youtube.com'
//               ),
//               const SizedBox(height: 12),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLinkCard({
//     required String title,
//     required String link,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xFF3A4B57), // Lighter top-left
//             Color(0xFF2A3B47), // Medium middle
//             Color(0xFF1A2B37),
//           ],
//           stops: [0.0, 0.5, 1.0],
//         ),
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//           BoxShadow(
//             color: Colors.white.withOpacity(0.05),
//             blurRadius: 2,
//             offset: const Offset(-1, -1),
//           ),
//         ],
//       ),
//       // Expanded(
//       //   child: Row(
//       //     children: [
//       //       Text(
//       //         title,
//       //         style: const TextStyle(
//       //           color: Colors.white,
//       //           fontSize: 16,
//       //           fontWeight: FontWeight.w600,
//       //         ),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//       // child: Row(
//       //   children: [
//       //     const SizedBox(width: 16),
//       //     Text(
//       //       title,
//       //       style: const TextStyle(
//       //         color: Colors.white,
//       //         fontSize: 16,
//       //         fontWeight: FontWeight.w600,
//       //       ),
//       //     ),
//       //   ],
//       //     Expanded(
//       //       child: Column(
//       //         crossAxisAlignment: CrossAxisAlignment.start,
//       //         children: [
//       //           Text(
//       //             name,
//       //             style: const TextStyle(
//       //               color: Colors.white,
//       //               fontSize: 16,
//       //               fontWeight: FontWeight.w600,
//       //             ),
//       //           ),
//       //           const SizedBox(height: 4),
//       //           Text(
//       //             designation,
//       //             style: const TextStyle(
//       //               color: Color(0xFFB0B0B0),
//       //               fontSize: 14,
//       //               fontWeight: FontWeight.w400,
//       //             ),
//       //           ),
//       //         ],
//       //       ),
//       //     ),
//       //     Row(
//       //       children: [
//       //         if (email != null) ...[
//       //           GestureDetector(
//       //             onTap: () => _launchEmail(email),
//       //             child: Container(
//       //               padding: const EdgeInsets.all(12),
//       //               decoration: BoxDecoration(
//       //                 color: const Color(0xFF4A5B67),
//       //                 borderRadius: BorderRadius.circular(8),
//       //               ),
//       //               child: const Icon(
//       //                 Icons.email_outlined,
//       //                 size: 20,
//       //                 color: Colors.white,
//       //               ),
//       //             ),
//       //           ),
//       //         ],
//       //         if (phone != null) ...[
//       //           const SizedBox(width: 8),
//       //           GestureDetector(
//       //             onTap: () => _launchPhone(phone!),
//       //             child: Container(
//       //               padding: const EdgeInsets.all(12),
//       //               decoration: BoxDecoration(
//       //                 color: const Color(0xFF4A5B67),
//       //                 borderRadius: BorderRadius.circular(8),
//       //               ),
//       //               child: const Icon(
//       //                 Icons.phone_outlined,
//       //                 size: 20,
//       //                 color: Colors.white,
//       //               ),
//       //             ),
//       //           ),
//       //         ],
//       //         if (phone2 != null) ...[
//       //           const SizedBox(width: 8),
//       //           GestureDetector(
//       //             onTap: () => _launchPhone(phone2!),
//       //             child: Container(
//       //               padding: const EdgeInsets.all(12),
//       //               decoration: BoxDecoration(
//       //                 color: const Color(0xFF4A5B67),
//       //                 borderRadius: BorderRadius.circular(8),
//       //               ),
//       //               child: const Icon(
//       //                 Icons.phone_outlined,
//       //                 size: 20,
//       //                 color: Colors.white,
//       //               ),
//       //             ),
//       //           ),
//       //         ],
//       //       ],
//       //     ),
//       //   ],
//       // ),
//     );
//   }
//
//   void _launchLink(String link) {
//     print('linkeddddddddddd');
//   }
//
//
// }


import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksPage extends StatelessWidget {
  const LinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23), // Same dark blue background
      appBar: AppBar(
        title: const Text(
          'IMPORTANT LINKS',
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
              _buildLinkCard(
                title: 'LNMIIT Official Website',
                url: 'https://www.lnmiit.ac.in',
              ),
              const SizedBox(height: 12),
              _buildLinkCard(
                title: 'Scholarship Policy',
                url: 'https://lnmiit.ac.in/scholarships-assistantships/',
              ),
              const SizedBox(height: 12),
              _buildLinkCard(
                title: 'Fee Structure - UG Admissions',
                url: 'https://lnmiit.ac.in/admissions/ug/regular-mode/',
              ),
              const SizedBox(height: 12),
              _buildLinkCard(
                title: 'Training and Placement Cell',
                url: 'https://placements.lnmiit.ac.in/',
              ),
              const SizedBox(height: 12),
              _buildLinkCard(
                title: 'MIS Portal',
                url: 'https://erp.lnmiit.ac.in/mis',
              ),
              const SizedBox(height: 12),
              _buildLinkCard(
                title: 'Moodle',
                url: 'https://moodle.lnmiit.ac.in',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLinkCard({
    required String title,
    required String url,
  }) {
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: Container(
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
            // Link Icon
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF4A5B67),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.link,
                size: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 16),
            // Link Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    url,
                    style: const TextStyle(
                      color: Color(0xFFB0B0B0),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print('Could not launch $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }
}