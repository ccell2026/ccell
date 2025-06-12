import 'package:ccell_1/cosha.dart';
import 'package:ccell_1/cultural.dart';
import 'package:ccell_1/sports.dart';
import 'package:ccell_1/technology.dart';
import 'package:flutter/material.dart';

class GymkhanaPage extends StatelessWidget {
  const GymkhanaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'STUDENT GYMKHANA',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'About student gymkhana',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF6CD4F3), Color(0xFF0E90B8)],
                  ),
                ),
                child: const Text(
                  'PRESIDENTIAL COUNCIL',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  squareCard(
                    [Colors.lightBlueAccent, Colors.blueAccent],
                    "Cultural Council",
                    context,
                    const CulturalCouncil(),
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.grey.shade600],
                    "Science & Technology Council",
                    context,
                    const TechnologyCouncil(),
                  ),
                  squareCard(
                    [Colors.lightBlueAccent, Colors.blueAccent],
                    "Sports Council",
                    context,
                    const SportsCouncil(),
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.grey.shade600],
                    "COSHA Committee",
                    context,
                    const COSHAScreen(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'STUDENT FESTS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 160,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 40,
                      top: 0,
                      child: triangleCard(
                        color: const LinearGradient(
                          colors: [Color(0xFF6CD4F3), Color(0xFF0E90B8)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        isInverted: true,
                        size: 120,
                        label: 'name',
                        context: context,
                        targetScreen: const BlueFestScreen(),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 0,
                      child: triangleCard(
                        color: const LinearGradient(
                          colors: [Color(0xFFEDE6DB), Color(0xFFB7ADA3)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        isInverted: true,
                        size: 120,
                        label: 'name',
                        context: context,
                        targetScreen: const GreyFestScreen(),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: triangleCard(
                        color: const LinearGradient(
                          colors: [Color(0xFFD45A5A), Color(0xFF8A3E3E)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        isInverted: false,
                        size: 120,
                        label: 'name',
                        context: context,
                        targetScreen: const RedFestScreen(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'STUDENT EVENTS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  squareCard(
                    [Colors.lightBlueAccent, Colors.blueAccent],
                    "name",
                    context,
                    const StudentEventScreen(),
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.grey.shade600],
                    "name",
                    context,
                    const StudentEventScreen(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Square Card Widget
Widget squareCard(List<Color> gradientColors, String label, BuildContext context, Widget targetScreen) {
  return Material(
    elevation: 6,
    borderRadius: BorderRadius.circular(16),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => targetScreen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        width: 100,
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 24, backgroundColor: Colors.white),
            const SizedBox(height: 8),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 12)),
          ],
        ),
      ),
    ),
  );
}

// Triangle Card Widget
Widget triangleCard({
  required Gradient color,
  required bool isInverted,
  required double size,
  required String label,
  required BuildContext context,
  required Widget targetScreen,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => targetScreen),
      );
    },
    child: ClipPath(
      clipper: EquilateralTriangleClipper(
        inverted: isInverted,
        cornerRadius: 12,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          gradient: color,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(radius: 20, backgroundColor: Colors.white),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
      ),
    ),
  );
}

// Triangle Clipper
class EquilateralTriangleClipper extends CustomClipper<Path> {
  final bool inverted;
  final double cornerRadius;

  EquilateralTriangleClipper({this.inverted = false, this.cornerRadius = 12});

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double height = size.height;
    final double width = size.width;

    if (inverted) {
      path.moveTo(width / 2, height);
      path.lineTo(0, 0);
      path.lineTo(width, 0);
    } else {
      path.moveTo(width / 2, 0);
      path.lineTo(0, height);
      path.lineTo(width, height);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Dummy Target Screens
class BlueFestScreen extends StatelessWidget {
  const BlueFestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Blue Fest")),
      body: const Center(child: Text("Welcome to Blue Fest")),
    );
  }
}

class GreyFestScreen extends StatelessWidget {
  const GreyFestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grey Fest")),
      body: const Center(child: Text("Welcome to Grey Fest")),
    );
  }
}

class RedFestScreen extends StatelessWidget {
  const RedFestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Red Fest")),
      body: const Center(child: Text("Welcome to Red Fest")),
    );
  }
}

class PresidentialCouncilScreen extends StatelessWidget {
  const PresidentialCouncilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Presidential Council")),
      body: const Center(child: Text("Welcome to Presidential Council")),
    );
  }
}

class StudentEventScreen extends StatelessWidget {
  const StudentEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Event")),
      body: const Center(child: Text("Welcome to Student Event")),
    );
  }
}
