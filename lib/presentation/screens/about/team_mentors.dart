import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/presentation/widgets/new_member.dart';

class TeamMentors extends StatelessWidget {
  final String title;
  final List<NewMember> members;

  const TeamMentors({super.key, required this.title, required this.members});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: theme.colorScheme.onSurface,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      
        SizedBox(height: 16),
        SizedBox(
          height: 180,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: members.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return MentorCard(member: members[index]);
            },
          ),
        ),
      ],
    );
  }
}

class MentorCard  extends StatelessWidget {
  final NewMember member;

  const MentorCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.35;
    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.onSurface.withOpacity(0.2),
          width: 2
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(member.imagePath),
            backgroundColor: theme.colorScheme.surface,
          ),
          const SizedBox(height: 12),
          Text(
            member.name,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: theme.colorScheme.onBackground,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
