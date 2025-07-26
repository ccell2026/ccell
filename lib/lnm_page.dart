import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'pages/impContacts.dart';
import 'pages/hods.dart';
import 'pages/hostelContacts.dart';
import 'pages/impLinks.dart';
import 'pages/curriculum.dart';

class LNMPage extends StatelessWidget {
  const LNMPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(14.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   'IMPORTANT DOCUMENTS',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //     letterSpacing: 1.2,
              //   ),
              // ),
              // const SizedBox(height: 16),
              // _buildCardGrid([
              //   _CardData('Holiday\nCalendar', Icons.calendar_today, () {
              //     Navigator.push(context, MaterialPageRoute(
              //       builder: (context) => const PDFViewerPage(
              //         title: 'Holiday Calendar',
              //         pdfAssetPath: 'assets/pages/pdfs/sample.pdf',
              //       ),
              //     ));
              //   }),
              //   _CardData('Bus Time\nTable', Icons.directions_bus, () {
              //     Navigator.push(context, MaterialPageRoute(
              //       builder: (context) => const PDFViewerPage(
              //         title: 'Bus Time Table',
              //         pdfAssetPath: 'assets/pages/pdfs/sample1.pdf',
              //       ),
              //     ));
              //   }),
              //   _CardData('Mess Menu', Icons.restaurant, () {
              //     Navigator.push(context, MaterialPageRoute(
              //       builder: (context) => const PDFViewerPage(
              //         title: 'Mess Menu',
              //         pdfAssetPath: 'assets/pages/pdfs/sample2.pdf',
              //       ),
              //     ));
              //   }),
              //   _CardData('SOPs', Icons.description, () {
              //     Navigator.push(context, MaterialPageRoute(
              //       builder: (context) => const PDFViewerPage(
              //         title: 'SOPs',
              //         pdfAssetPath: 'assets/pages/pdfs/sample3.pdf',
              //       ),
              //     ));
              //   }),
              // ]),
              // const SizedBox(height: 32),
              Text(
                'FACULTIES',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildCardGrid([
                _CardData('Important\nContacts', Icons.contact_phone, () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const ImportantContactsPage(),
                  ));
                }),
                _CardData('HODs', Icons.person, () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>  HODsPage(),
                  ));
                }),
                // _CardData('Head of\nSections', Icons.group, () {
                //   Navigator.push(context, MaterialPageRoute(
                //     builder: (context) => const PlaceholderPage(title: 'Head of Sections'),
                //   ));
                // }),
                _CardData('Hostel\nContacts', Icons.home, () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const HostelPage(),
                  ));
                }),
              ]),
               SizedBox(height: 28.h),
              Text(
                'MISCELLANEOUS',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: 14.h),
              _buildCardGrid([
                _CardData('Campus Map', Icons.map, () async {
                  const url = 'https://example.com';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                  } else {
                    // Handle error - maybe show a snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not open PDF')),
                    );
                  }
                }),
                _CardData('Academic\nArea Map', Icons.school, () async {
                  const url = 'https://example.com';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Could not open PDF')),
                    );
                  }
                }),
                _CardData('Curriculum', Icons.book, () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const CurriculumPage(),
                  ));
                }),
                _CardData('Important\nLinks', Icons.link, () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const LinksPage(),
                  ));
                }),
              ]),
              SizedBox(height: 28.h),
              Text(
                'DIRECTOR\'S MESSAGE',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF2A3B47),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Message',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Welcome to The LNM Institute of Information Technology (LNMIIT), Jaipur! The LNMIIT is an institution of higher learning focused in select areas of Computing, Communication, ICT, Electronics and carefully chosen traditional engineering and sciences with an innovative blend of interdisciplinary flavor and contemporary relevance.',
                      style: TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF3A4B57),
                            image: const DecorationImage(
                              image: AssetImage('assets/pages/faces/rahul_banerjee_2.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Prof. Rahul Banerjee',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'The Institute, in spite of being young (founded in 2002, jointly by the Government of Rajasthan and the Lakshmi & Usha Mittal Foundation in the public-private partnership mode) is considered as one of the best institutions in its chosen areas of higher learning, both in the state and the country. In addition to having been accredited by the National Assessment & Accreditation Council (NAAC) as an "A" grade institution, the LNMIIT has been ranked fairly high by many different agencies in the recent past as may be noticed elsewhere on the official web-portal.',
                      style: TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'The Institute takes pride in its eco-system that aims to groom incoming students into academically strong yet well-rounded personality based professionals who could adapt themselves to the challenges posed by the ever-changing world and working environments.',
                      style: TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'If you are an aspiring student, we welcome you to take a good look at our website and preferably consider visiting the campus for getting to know it even better by getting the first hand feel of its ambience and interacting with faculty and students so that you could take a well-informed decision. If you have already applied to the LNMIIT, have been offered an admission and accepted the offer, Congratulations and Welcome to this new home of yours for next few years!',
                      style: TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardGrid(List<_CardData> cards) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.57, // higher value -> thinner boxes
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: cards.length,
      itemBuilder: (context, index) {
        final card = cards[index];
        return GestureDetector(
          onTap: card.onTap,
          child: Container(
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
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(
                    card.icon,
                    size: 24,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      card.title.replaceAll('\n', ' '),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CardData {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  _CardData(this.title, this.icon, this.onTap);
}