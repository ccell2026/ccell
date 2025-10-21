import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'member.dart';
import 'member_card.dart';


class MemberSection extends StatelessWidget {
  final String title;
  final List<Member> members;

  const MemberSection({
    super.key,
    required this.title,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: theme.colorScheme.onBackground,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: members.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return MemberCard(member: members[index]);
            },
          ),
        ),
      ],
    );
  }
}
