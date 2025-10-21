import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  final String featureName;

  const ComingSoonPage({
    super.key,
    required this.featureName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context), // Tap anywhere to go back
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFF07191F), // Background color for transparent image
          child: Image.asset(
            'assets/images/comingsoon.png',
            fit: BoxFit.contain, // Changed to contain to preserve aspect ratio
            errorBuilder: (context, error, stackTrace) {
              // Fallback if image doesn't load
              return Container(
                color: const Color(0xFF07191F),
                child: const Center(
                  child: Icon(
                    Icons.construction,
                    size: 100,
                    color: Colors.orange,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}