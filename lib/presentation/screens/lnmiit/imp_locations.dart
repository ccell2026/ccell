import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ImplocationsScreen extends StatelessWidget {
  const ImplocationsScreen({super.key});

  static final List<_LocationInfo> locations = [
    _LocationInfo(
      name: 'Admin Office',
      mapUrl: 'https://maps.app.goo.gl/gzgRkrpU2wubqsbEA',
      icon: Icons.admin_panel_settings,
    ),
    _LocationInfo(
      name: 'Incubation Building',
      mapUrl: 'https://maps.app.goo.gl/N4vYVoZoXx1aJVZaA',
      icon: Icons.business,
    ),
    _LocationInfo(
      name: 'Cafeteria',
      mapUrl: 'https://maps.app.goo.gl/your-cafeteria-link',
      icon: Icons.local_cafe,
    ),
    _LocationInfo(
      name: 'Academic Block',
      mapUrl: 'https://maps.app.goo.gl/your-academic-block-link',
      icon: Icons.school,
    ),
    _LocationInfo(
      name: 'SAC (Student Activity Center)',
      mapUrl: 'https://maps.app.goo.gl/your-academic-block-link',
      icon: Icons.sports_basketball,
    ),
    _LocationInfo(
      name: 'Central Library',
      mapUrl: 'https://maps.app.goo.gl/your-academic-block-link',
      icon: Icons.local_library,
    ),
    _LocationInfo(
      name: 'College Bus Timetable',
      mapUrl: 'https://lnmiit.ac.in/Resourceimages/bus_schedule.pdf',
      icon: Icons.directions_bus,
    ),
  ];

  final Color buttonColor = const Color.fromARGB(255, 14, 160, 193); // Close to the image color

  Future<void> _launchMapUrl(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the map link.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001219),
      appBar: AppBar(
        title: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('Important Locations & Links'),
        ),
        backgroundColor: const Color(0xFF001219),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 0),
        itemCount: locations.length,
        separatorBuilder: (_, __) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          final location = locations[index];
          return Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 48.0), // Left indentation
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () => _launchMapUrl(context, location.mapUrl),
                splashColor: buttonColor.withOpacity(0.18),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 24),
                  child: Row(
                    children: [
                      Icon(location.icon, color: Colors.white, size: 25),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          location.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LocationInfo {
  final String name;
  final String mapUrl;
  final IconData icon;

  const _LocationInfo({
    required this.name,
    required this.mapUrl,
    required this.icon,
  });
}
