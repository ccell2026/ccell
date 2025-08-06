import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'member.dart';

class MemberCard extends StatelessWidget {
  final Member member;

  const MemberCard({super.key, required this.member});

  void _launchPhone() async {
    final Uri uri = Uri(scheme: 'tel', path: member.phone);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchEmail() async {
    final Uri uri = Uri(scheme: 'mailto', path: member.email);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.45;
    double cardHeight = screenWidth * 0.45;
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.surface,
            theme.colorScheme.background,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.onSurface.withOpacity(0.2),
          width: 2
        )
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(member.imagePath),
            backgroundColor: theme.colorScheme.surface,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              member.name,
              style: GoogleFonts.inter(
                color: theme.colorScheme.onSurface,
                fontSize: 17
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _launchPhone,
                child: Icon(Icons.call,
                  color: theme.colorScheme.onSurface,
                )
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: _launchEmail,
                child: Icon(Icons.mail,
                  color: theme.colorScheme.onSurface,
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
