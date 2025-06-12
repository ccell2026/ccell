import 'package:ccell_1/council.dart';
import 'package:flutter/material.dart';

class SportsCouncil extends StatelessWidget {
  const SportsCouncil({super.key});

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
                'SPORTS COUNCIL',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              CircleAvatar(),
              SizedBox(height: 20),
              Text("About the COUNCIL", style: TextStyle(color: Colors.white),),
              SizedBox(height: 20,),
              _buildGSecTile("name", "General Secretary"),
              SizedBox(height: 12,),
              _buildGSecTile("name", "Associate General Secretary"),
              SizedBox(height: 12,),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Badminton",
                    context,
                    const PresidentialCouncilScreen(),
                    'assets/images/cosha.png',
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Basketball",
                    context,
                    const PresidentialCouncilScreen(),
                    'assets/images/cosha.png',
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1", "phone": "9979901008", "email": "panthmoradiya7@gmail.com"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Chess",
                    context,
                    const PresidentialCouncilScreen(),
                    'assets/images/cosha.png',
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                  ),
                  squareCard(
                    [const Color.fromRGBO(224, 224, 224, 1), Colors.blueAccent],
                    "Cricket",
                    context,
                    const PresidentialCouncilScreen(),
                    'assets/images/cosha.png',
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Football",
                    context,
                    const PresidentialCouncilScreen(),
                    'assets/images/cosha.png',
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Kabaddi",
                    context,
                    const PresidentialCouncilScreen(),
                    'assets/images/cosha.png',
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Lawn Tennis",
                    context,
                    const PresidentialCouncilScreen(),
                    'assets/images/cosha.png',
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Squash",
                    context,
                    const PresidentialCouncilScreen(),
                    'assets/images/cosha.png',
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Table Tennis",
                    context,
                    const PresidentialCouncilScreen(),
                    'assets/images/cosha.png',
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                  ),
                  squareCard(
                    [Colors.grey.shade300, Colors.blueAccent],
                    "Volleyball",
                    context,
                    const PresidentialCouncilScreen(),
                    'assets/images/cosha.png',
                    [
                      "https://example.com/gallery1.jpg",
                      "https://example.com/gallery2.jpg",
                    ],
                    [
                      {"name": "Cordie 1"},
                      {"name": "Cordie 2"},
                      {"name": "Cordie 3"},
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// Square Card Widget
Widget squareCard(List<Color> gradientColors, String label, BuildContext context, Widget targetScreen, String imageUrl, List<String> galleryImages, List<Map<String, String>> cordies) {
  return Material(
    elevation: 6,
    borderRadius: BorderRadius.circular(16),
    child: InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => CouncilDetailScreen(
      imageUrl: imageUrl,
      galleryImages: galleryImages,
      cordies: cordies
    ),
  ),
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

Widget _buildGSecTile(String name, String post) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF1C2834),
      borderRadius: BorderRadius.circular(12),
    ),
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        post,
        style: const TextStyle(
          fontSize: 12,
          color: Color.fromARGB(133, 255, 255, 255),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.white),
            onPressed: () async {
              // final Uri url = Uri.parse('tel:${cordie['phone']}');
              // if (await canLaunchUrl(url)) {
              //   await launchUrl(url);
              // } else {
              //   throw 'Could not launch $url';
              // }
            },
          ),
          IconButton(
            icon: const Icon(Icons.email, color: Colors.white),
            onPressed: () async {
              // final Uri url = Uri.parse('mailto:${cordie['email']}');
              // if (await canLaunchUrl(url)) {
              //   await launchUrl(url);
              // } else {
              //   throw 'Could not launch $url';
              // }
            },
          ),
        ],
      ),
    ),
  );
}
