import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class convenerMessageSection extends StatelessWidget {
  const convenerMessageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Convener's Message",
            style: GoogleFonts.poppins(
              color: theme.colorScheme.onBackground,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "The LNMIIT Counselling and Guidance Cell is the bridge between students and the institute, helping them to settle into their new environment both emotionally and practically.",
                      style: TextStyle(
                        fontSize: 15,
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Image and Name Column
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: theme.colorScheme.primary,
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/usha_mam.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Dr. Usha Kanoongo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}