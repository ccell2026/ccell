import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/presentation/widgets/new_member.dart';

import 'package:login_page/presentation/screens/about/team_mentors.dart';
import 'package:login_page/presentation/screens/about/convener_message.dart';
import 'package:login_page/presentation/widgets/member_section.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:login_page/presentation/widgets/member.dart';

class AboutCCellPage extends StatelessWidget {
  const AboutCCellPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Banner + Avatar
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/y24.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: -40,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: theme.colorScheme.surface,
                    backgroundImage: const AssetImage(
                      'assets/images/ccell_logo_c.png',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "The LNM Institute of Information Technology",
                style: GoogleFonts.poppins(
                  color: theme.colorScheme.onBackground,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "The Counselling and Guidance Cell at LNMIIT fosters mental well-being and provides support through peer mentorship, professional guidance, and proactive outreach initiatives.",
                style: GoogleFonts.inter(
                  color: theme.colorScheme.onBackground,
                ),
              ),
            ),

            const SizedBox(height: 20),

            MemberSection(
              title: "Coordinators",
              members: [
                Member(
                  name: "Aditya Kansal",
                  imagePath: 'assets/images/aditya_kansal.webp',
                  email: '23ucc506@lnmiit.ac.in',
                  phone: '7037898300',
                ),
                Member(
                  name: "Kunal Sharma",
                  imagePath: 'assets/images/kunal_sharma.png',
                  email: '23uec563@lnmiit.ac.in',
                  phone: '9166405904',
                ),
                Member(
                  name: "Neha Raniwala",
                  imagePath: 'assets/images/neha_raniwala.jpg',
                  email: '23ucc577@lnmiit.ac.in',
                  phone: '8982919670',
                ),
              ],
            ),

            const SizedBox(height: 20),

            MemberSection(
              title: "Associate Coordinators",
              members: [
                Member(
                  name: "Atharv Shah",
                  imagePath: 'assets/images/atharv_shah.jpg',
                  email: '23ucc525@lnmiit.ac.in',
                  phone: ' 9315394135',
                ),
                Member(
                  name: "Lakshita Sharma",
                  imagePath: 'assets/images/lakshita.jpeg',
                  email: '23ume529@lnmiit.ac.in',
                  phone: '7877045043',
                ),
                Member(
                  name: "Mudit Choudhary",
                  imagePath: 'assets/images/mudit_img.jpg',
                  email: '23ucc623@lnmiit.ac.in',
                  phone: '9672467580',
                ),
                Member(
                  name: "Rahul Sharma",
                  imagePath: 'assets/images/rahul_sharma.jpg',
                  email: '23ucs686@lnmiit.ac.in',
                  phone: ' 9899007236',
                ),
                Member(
                  name: "Vibha Gupta",
                  imagePath: 'assets/images/vibha_gupta.jpg',
                  email: '23uec642@lnmiit.ac.in',
                  phone: '7976737262',
                ),
                Member(
                  name: "Yash Raj",
                  imagePath: 'assets/images/yash_raj.jpg',
                  email: '23ucc619@lnmiit.ac.in',
                  phone: '8291508341',
                ),
              ],
            ),

            const SizedBox(height: 20),

            TeamMentors(
              title: "Team Mentors",
              members: [
                NewMember(
                  name: "Harshita Sharma",
                  imagePath: 'assets/images/Harshita.jpg',
                ),

                NewMember(
                  name: "Arpit Joshi",
                  imagePath: 'assets/images/arpit_joshi.jpg',
                ),
                NewMember(
                  name: "Naman Agarwal",
                  imagePath: 'assets/images/naman.jpg',
                ),
              ],
            ),

            convenerMessageSection(),

            NewSection(
              title: "App Developers",
              members: [
                NewMember(
                  name: "Ishita Agarwal",
                  imagePath: 'assets/images/ishita.jpg',
                ),
                NewMember(
                  name: "Armaan Jain",
                  imagePath: 'assets/images/armaan.png',
                ),
                NewMember(
                  name: "Panth Moradia",
                  imagePath: 'assets/images/panth_moradiya.jpg',
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class NewSection extends StatelessWidget {
  final String title;
  final List<NewMember> members;

  const NewSection({super.key, required this.title, required this.members});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: theme.colorScheme.onBackground,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(height: 16),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                developerCard("Mudit Choudhary", "assets/images/mudit_img.jpg"),
                SizedBox(width: 16),
                developerCard("Yash Raj", "assets/images/yash_raj.jpg"),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                developerCard("Praneel Dev", "assets/images/praneel.jpg"),
                SizedBox(width: 16),
                developerCard(
                  "Panth Moradia",
                  "assets/images/panth_moradiya.jpg",
                ),

              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                developerCard("Nikhila S Hari", "assets/images/nikhila.jpg"),
                SizedBox(width: 16),
                developerCard("Ishita Agarwal", "assets/images/ishita.jpg"),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                developerCard("Armaan Jain", "assets/images/armaan.png"),
              ],
            ),
          ],
        ),
      ],
    );
  }
}


Widget developerCard(String name, String imagePath) {


  return LayoutBuilder(
      builder: (context,constraints) {
        final theme = Theme.of(context);
        double screenWidth = MediaQuery.of(context).size.width;
        double cardWidth = screenWidth / 2.5; // tweak this factor for balance
        double cardHeight = cardWidth * 1.1; // adjust ratio to your liking
        return Container(
          height: cardHeight,
          width: cardWidth,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.colorScheme.onSurface.withOpacity(0.2),
              width: 2
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(imagePath),
                backgroundColor: theme.colorScheme.surface,
              ),
              const SizedBox(height: 8),
              Text(
                name,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: theme.colorScheme.onSurface,
                  fontSize: 17
                ),
              ),
            ],
          ),
        );
      }
  );
}