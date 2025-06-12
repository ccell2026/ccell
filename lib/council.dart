import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CouncilDetailScreen extends StatelessWidget {
  final String imageUrl;
  final List<String> galleryImages;
  final List<Map<String, String>> cordies;

  const CouncilDetailScreen({
    super.key,
    required this.imageUrl,
    required this.galleryImages,
    required this.cordies,
  });

  void _launchPhone(String phone) async {
    final Uri uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchEmail(String email) async {
  final Uri uri = Uri(
    scheme: 'mailto',
    path: email,
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } 
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            CircleAvatar(radius: 40, backgroundImage: NetworkImage(imageUrl)),
            const SizedBox(height: 8),
            // Gallery Carousel
            Container(
              height: 160,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: PageView.builder(
                itemCount: galleryImages.length,
                controller: PageController(viewportFraction: 0.8),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(galleryImages[index], fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),
            const Divider(color: Colors.white38),

            // Cordies List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(12),
                itemCount: cordies.length,
                itemBuilder: (context, index) {
                  final cordie = cordies[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C2834),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      title: Text(
                        cordie['name'] ?? '',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      trailing: Wrap(
                        spacing: 12,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.call, color: Colors.greenAccent),
                            onPressed: () => _launchPhone(cordie['phone'] ?? ''),
                          ),
                          IconButton(
                            icon: const Icon(Icons.mail, color: Colors.lightBlueAccent),
                            onPressed: () => _launchEmail(cordie['email'] ?? ''),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
