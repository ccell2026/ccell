import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HostelPage extends StatelessWidget {
  const HostelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      appBar: AppBar(
        title: const Text(
          'HOSTEL CONTACTS',
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
              _buildSectionHeader("ADMINISTRATION"),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Pushpendra Singh',
                  designation: 'Chief Administrative Officer',
                  email: 'cao@lnmiit.ac.in',
                  phone: '0141- 3526006',
                  imageAsset: 'assets/pages/faces/pushpendra_singh.jpg'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Manoj Singh',
                  designation: 'Chief Warden Office - Office Staff',
                  email: 'cwoffice@lnmiit.ac.in',
                  phone: '+91- 9351773779'
              ),
              const SizedBox(height: 24),
              _buildSectionHeader("Boys Hostel 1"),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'BH1',
                designation: '',
                phone: '+91–0141–2688128',
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Namo Narayan Meena',
                  designation: 'Jr. Hostel Superintendent BH1',
                  email: 'jhs-bh1@lnmiit.ac.in',
                  phone: '91-141-3526145',
                  phone2: '7851948930',
                  imageAsset: 'assets/pages/faces/namo_narayan_meena.jpg'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Prahlad Sharma',
                  designation: 'Hostel Support BH1',
                  email: 'bh1-support@lnmiit.ac.in',
                  phone: '91-141-3526145',
                  phone2: '7851948930',
                  imageAsset: 'assets/pages/faces/prahlad_sharma.jpg'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Kajor Meena',
                  designation: 'Hostel Support BH1',
                  email: 'bh1-support@lnmiit.ac.in',
                  phone: '91-141-3526145',
                  phone2: '7851948930'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Abhishek Sharma',
                  designation: 'Hostel Support BH1',
                  email: 'bh1-support@lnmiit.ac.in',
                  phone: '91-141-3526145',
                  phone2: '7851948930'
              ),
              const SizedBox(height: 24),
              _buildSectionHeader("Boys Hostel 2"),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'BH2',
                designation: '',
                phone: '+91–0141–2688129',
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Namo Narayan Meena',
                  designation: 'Jr. Hostel Superintendent BH2',
                  email: 'jhs-bh2@lnmiit.ac.in',
                  phone: '+91-141-3526148',
                  phone2: '7852824457',
                  imageAsset: 'assets/pages/faces/namo_narayan_meena.jpg'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Kamlesh Kumar Meena',
                  designation: 'Hostel Support BH2',
                  email: 'bh2-support@lnmiit.ac.in',
                  phone: '91-141-3526148',
                  phone2: '7852824457'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Suresh Chand Danka',
                  designation: 'Hostel Support BH2',
                  email: 'bh2-support@lnmiit.ac.in',
                  phone: '91-141-3526148',
                  phone2: '7852824457'
              ),
              const SizedBox(height: 24),
              _buildSectionHeader("Boys Hostel 3"),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'BH3',
                  designation: '',
                  phone: '+91–0141–2688130',
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Ghanshyam Sharma',
                  designation: 'Jr. Hostel Superintendent BH3',
                  email: 'jhs-bh3@lnmiit.ac.in',
                  phone: '91-141-3526151',
                  phone2: '7852833867'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Rahul Sharma',
                  designation: 'Hostel Support BH3',
                  email: 'bh3-support@lnmiit.ac.in',
                  phone: '91-141-3526151',
                  phone2: '7852833867'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Ram Kumar Singh',
                  designation: 'Hostel Support BH3',
                  email: 'bh3-support@lnmiit.ac.in',
                  phone: '91-141-3526151',
                  phone2: '7852833867'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Madhu Sudan Sharma',
                  designation: 'Hostel Support BH3',
                  email: 'bh3-support@lnmiit.ac.in',
                  phone: '91-141-3526151',
                  phone2: '7852833867'
              ),
              const SizedBox(height: 24),
              _buildSectionHeader("Boys Hostel 4"),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'BH4',
                designation: '',
                phone: '+91–0141–2688131',
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Ghanshyam Sharma',
                  designation: 'Jr. Hostel Superintendent BH4',
                  email: 'jhs-bh4@lnmiit.ac.in',
                  phone: '91-141-3526153',
                  phone2: '7852832339'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Praveen Kumar Jha',
                  designation: 'Hostel Support BH4',
                  email: 'bh4-support@lnmiit.ac.in',
                  phone: '91-141-3526153',
                  phone2: '7852832339'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Manoj Kumar Pancholi',
                  designation: 'Hostel Support BH4',
                  email: 'bh4-support@lnmiit.ac.in',
                  phone: '91-141-3526153',
                  phone2: '7852832339'
              ),
              const SizedBox(height: 24),
              _buildSectionHeader("Boys Hostel 5 (Pre FEB Building)"),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mr. Prahlad Sharma',
                  designation: 'Hostel Support BH5',
                  email: 'bh1-support@lnmiit.ac.in',
                  phone: '7851948930',
                  imageAsset: 'assets/pages/faces/prahlad_sharma.jpg'
              ),
              const SizedBox(height: 24),
              _buildSectionHeader("Girls Hostel"),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Girls Hostel',
                  designation: '',
                  phone: '+91–0141–2688132'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Dr. Poonam Gera',
                  designation: 'GH Warden',
                  phone: '+91–0141-3526225',
                  email: 'warden-gh@lnmiit.ac.in',
                  imageAsset: 'assets/pages/faces/poonam_gera.jpg'
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                  name: 'Mrs. Sakshi Sharma',
                  designation: 'Hostel Support GH',
                  phone: '91-141-3526158',
                  phone2: '7851941316',
                  email: 'gh-support@lnmiit.ac.in',
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'Mrs. Pankesh Sharma',
                designation: 'Hostel Support GH',
                phone: '91-141-3526158',
                phone2: '7851941316',
                email: 'gh-support@lnmiit.ac.in',
              ),
              const SizedBox(height: 12),
              _buildContactCard(
                name: 'Mrs. Manju Kunwar',
                designation: 'Hostel Support GH',
                phone: '91-141-3526158',
                phone2: '7851941316',
                email: 'gh-support@lnmiit.ac.in',
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF2A3B47),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF4A5B67),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: const Color(0xFF64B5F6),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required String name,
    required String designation,
    String? email,
    String? imageAsset,
    String? phone,
    String? phone2,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
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
            width: 38,
            height: 38,
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
          const SizedBox(width: 8),
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
                const SizedBox(height: 3),
                Text(
                  designation,
                  style: const TextStyle(
                    color: Color(0xFFB0B0B0),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 6),
          Row(
            children: [
              if (email != null) ...[
                GestureDetector(
                  onTap: () => _launchEmail(email),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A5B67),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.email_outlined,
                      size: 18,
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
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A5B67),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.phone_outlined,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
              if (phone2 != null) ...[
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => _launchPhone(phone2!),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A5B67),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.phone_outlined,
                      size: 18,
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

//
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class HostelPage extends StatelessWidget {
//   const HostelPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF0E1A23),
//       appBar: AppBar(
//         title: const Text(
//           'HOSTEL CONTACTS',
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
//               // Administration Section
//               _buildSectionHeader('ADMINISTRATION'),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Pushpendra Singh',
//                   designation: 'Chief Administrative Officer',
//                   phone: '0141- 3526006',
//                   imageAsset: '/assets/faces/pushpendra_singh.jpg'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Manoj Singh',
//                   designation: 'Chief Warden Office - Office Staff',
//                   phone: '+91- 9351773779'
//               ),
//               const SizedBox(height: 24),
//
//               // Boys Hostel 1 Section
//               _buildSectionHeader('BOYS HOSTEL 1'),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                 name: 'BH1',
//                 designation: '',
//                 phone: '+91–0141–2688128',
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Namo Narayan Meena',
//                   designation: 'Jr. Hostel Superintendent BH1',
//                   phone: '91-141-3526145',
//                   phone2: '7851948930',
//                   imageAsset: '/assets/faces/namo_narayan_meena.jpg'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Prahlad Sharma',
//                   designation: 'Hostel Support BH1',
//                   phone: '91-141-3526145',
//                   phone2: '7851948930',
//                   imageAsset: '/assets/faces/prahlad_sharma.jpg'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Kajor Meena',
//                   designation: 'Hostel Support BH1',
//                   phone: '91-141-3526145',
//                   phone2: '7851948930'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Abhishek Sharma',
//                   designation: 'Hostel Support BH1',
//                   phone: '91-141-3526145',
//                   phone2: '7851948930'
//               ),
//               const SizedBox(height: 24),
//
//               // Boys Hostel 2 Section
//               _buildSectionHeader('BOYS HOSTEL 2'),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                 name: 'BH2',
//                 designation: '',
//                 phone: '+91–0141–2688129',
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Namo Narayan Meena',
//                   designation: 'Jr. Hostel Superintendent BH2',
//                   phone: '+91-141-3526148',
//                   phone2: '7852824457',
//                   imageAsset: '/assets/faces/namo_narayan_meena.jpg'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Kamlesh Kumar Meena',
//                   designation: 'Hostel Support BH2',
//                   phone: '91-141-3526148',
//                   phone2: '7852824457'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Suresh Chand Danka',
//                   designation: 'Hostel Support BH2',
//                   phone: '91-141-3526148',
//                   phone2: '7852824457'
//               ),
//               const SizedBox(height: 24),
//
//               // Boys Hostel 3 Section
//               _buildSectionHeader('BOYS HOSTEL 3'),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                 name: 'BH3',
//                 designation: '',
//                 phone: '+91–0141–2688130',
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Ghanshyam Sharma',
//                   designation: 'Jr. Hostel Superintendent BH3',
//                   phone: '91-141-3526151',
//                   phone2: '7852833867'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Rahul Sharma',
//                   designation: 'Hostel Support BH3',
//                   phone: '91-141-3526151',
//                   phone2: '7852833867'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Ram Kumar Singh',
//                   designation: 'Hostel Support BH3',
//                   phone: '91-141-3526151',
//                   phone2: '7852833867'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Madhu Sudan Sharma',
//                   designation: 'Hostel Support BH3',
//                   phone: '91-141-3526151',
//                   phone2: '7852833867'
//               ),
//               const SizedBox(height: 24),
//
//               // Boys Hostel 4 Section
//               _buildSectionHeader('BOYS HOSTEL 4'),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                 name: 'BH4',
//                 designation: '',
//                 phone: '+91–0141–2688131',
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Ghanshyam Sharma',
//                   designation: 'Jr. Hostel Superintendent BH4',
//                   phone: '91-141-3526153',
//                   phone2: '7852832339'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Praveen Kumar Jha',
//                   designation: 'Hostel Support BH4',
//                   phone: '91-141-3526153',
//                   phone2: '7852832339'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Manoj Kumar Pancholi',
//                   designation: 'Hostel Support BH4',
//                   phone: '91-141-3526153',
//                   phone2: '7852832339'
//               ),
//               const SizedBox(height: 24),
//
//               // Boys Hostel 5 Section
//               _buildSectionHeader('BOYS HOSTEL 5'),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Mr. Prahlad Sharma',
//                   designation: 'Hostel Support BH5',
//                   phone: '7851948930',
//                   imageAsset: '/assets/faces/prahlad_sharma.jpg'
//               ),
//               const SizedBox(height: 24),
//
//               // Girls Hostel Section
//               _buildSectionHeader('GIRLS HOSTEL'),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Girls Hostel',
//                   designation: '',
//                   phone: '+91–0141–2688132'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                   name: 'Dr. Poonam Gera',
//                   designation: 'GH Warden',
//                   phone: '+91–0141-3526225',
//                   imageAsset: '/assets/faces/poonam_gera.jpg'
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                 name: 'Mrs. Sakshi Sharma',
//                 designation: 'Hostel Support GH',
//                 phone: '91-141-3526158',
//                 phone2: '7851941316',
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                 name: 'Mrs. Pankesh Sharma',
//                 designation: 'Hostel Support GH',
//                 phone: '91-141-3526158',
//                 phone2: '7851941316',
//               ),
//               const SizedBox(height: 12),
//               _buildContactCard(
//                 name: 'Mrs. Manju Kunwar',
//                 designation: 'Hostel Support GH',
//                 phone: '91-141-3526158',
//                 phone2: '7851941316',
//               ),
//               const SizedBox(height: 12),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Section Header Widget
//   Widget _buildSectionHeader(String title) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         color: const Color(0xFF2A3B47),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(
//           color: const Color(0xFF4A5B67),
//           width: 1,
//         ),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 4,
//             height: 20,
//             decoration: BoxDecoration(
//               color: const Color(0xFF64B5F6),
//               borderRadius: BorderRadius.circular(2),
//             ),
//           ),
//           const SizedBox(width: 12),
//           Text(
//             title,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               letterSpacing: 0.5,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildContactCard({
//     required String name,
//     required String designation,
//     String? email,
//     String? imageAsset,
//     String? phone,
//     String? phone2,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(14),
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
//       child: Row(
//         children: [
//           Container(
//             width: 38,
//             height: 38,
//             decoration: BoxDecoration(
//               color: const Color(0xFF4A5B67),
//               borderRadius: BorderRadius.circular(12),
//               image: imageAsset != null
//                   ? DecorationImage(
//                 image: AssetImage(imageAsset),
//                 fit: BoxFit.cover,
//               )
//                   : null,
//             ),
//             child: imageAsset == null
//                 ? const Icon(
//               Icons.person,
//               size: 28,
//               color: Colors.white,
//             )
//                 : null,
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 3),
//                 Text(
//                   designation,
//                   style: const TextStyle(
//                     color: Color(0xFFB0B0B0),
//                     fontSize: 12,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 6),
//           Row(
//             children: [
//               if (email != null) ...[
//                 GestureDetector(
//                   onTap: () => _launchEmail(email),
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF4A5B67),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Icon(
//                       Icons.email_outlined,
//                       size: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//               if (phone != null) ...[
//                 const SizedBox(width: 8),
//                 GestureDetector(
//                   onTap: () => _launchPhone(phone!),
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF4A5B67),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Icon(
//                       Icons.phone_outlined,
//                       size: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//               if (phone2 != null) ...[
//                 const SizedBox(width: 8),
//                 GestureDetector(
//                   onTap: () => _launchPhone(phone2!),
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF4A5B67),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Icon(
//                       Icons.phone_outlined,
//                       size: 18,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _launchEmail(String email) async {
//     final Uri emailUri = Uri(
//       scheme: 'mailto',
//       path: email,
//       // query: 'subject=Inquiry&body=Hello,',
//     );
//     try {
//       if (await canLaunchUrl(emailUri)) {
//         await launchUrl(emailUri);
//       } else {
//         // Fallback to Gmail web if app is not available
//         final Uri gmailUri = Uri.parse('https://mail.google.com/mail/?view=cm&to=$email');
//         if (await canLaunchUrl(gmailUri)) {
//           await launchUrl(gmailUri, mode: LaunchMode.externalApplication);
//         }
//       }
//     } catch (e) {
//       print('Error launching email: $e');
//     }
//   }
//
//   Future<void> _launchPhone(String phone) async {
//     final Uri phoneUri = Uri(scheme: 'tel', path: phone);
//     try {
//       if (await canLaunchUrl(phoneUri)) {
//         await launchUrl(phoneUri);
//       }
//     } catch (e) {
//       print('Error launching phone: $e');
//     }
//   }
// }