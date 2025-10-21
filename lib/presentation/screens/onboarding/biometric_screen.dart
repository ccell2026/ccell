import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'credential_collection.dart';

class BiometricScreen extends StatefulWidget {
  const BiometricScreen({super.key});

  @override
  State<BiometricScreen> createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen>
    with TickerProviderStateMixin {
  bool isDone = false;

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _cardController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late List<Animation<double>> _cardAnimations;

  static const String biometricLocation = 'LH9, LNMIIT, Jaipur';
  static const String biometricMapUrl = 'https://maps.app.goo.gl/2j4QFtwQy4zxvnkKA';

  @override
  void initState() {
    super.initState();
    _loadDoneStatus();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _cardController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic));

    _cardAnimations = List.generate(3, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _cardController,
          curve: Interval(
            index * 0.2,
            0.4 + (index * 0.2),
            curve: Curves.easeOutBack,
          ),
        ),
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          _fadeController.forward();
          Future.delayed(const Duration(milliseconds: 200), () {
            if (mounted) _slideController.forward();
          });
          Future.delayed(const Duration(milliseconds: 400), () {
            if (mounted) _cardController.forward();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _cardController.dispose();
    super.dispose();
  }

  Future<void> _loadDoneStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDone = prefs.getBool('biometric_done') ?? false;
    });
  }

  Future<void> _setDone(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('biometric_done', value);
    if (!mounted) return;
    setState(() {
      isDone = value;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              value ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(value ? 'Biometric registration marked complete!' : 'Marked as pending'),
          ],
        ),
        backgroundColor: value ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Future<void> _launchMapUrl(BuildContext context) async {
    final Uri url = Uri.parse(biometricMapUrl);

    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch map';
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open map: $e'),
          backgroundColor: const Color(0xFFEF4444),
        ),
      );
    }
  }

  Widget _buildCard(
    BuildContext context,
    int index,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    return ScaleTransition(
      scale: _cardAnimations[index],
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: theme.colorScheme.onSurface.withOpacity(0.2),
            width: 2,
          ),
        ),
        color: theme.colorScheme.surface.withOpacity(0.1),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: theme.colorScheme.onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    color: theme.colorScheme.onSurface.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 1024;
    final isTablet = size.width >= 768 && size.width < 1024;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Biometric Registration',
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Please visit for biometric registration:',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: theme.colorScheme.onSurface.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: 4),
                        InkWell(
                          onTap: () async {
                            final Uri uri = Uri.parse(biometricMapUrl);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            }
                          },
                          child: Text(
                            biometricLocation,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: theme.colorScheme.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                _buildCard(
                  context,
                  0,
                  'Register Biometrics',
                  'Visit the location for biometric registration',
                  () {
                    HapticFeedback.mediumImpact();
                    _setDone(true);
                  },
                ),
                const SizedBox(height: 16),
                _buildCard(
                  context,
                  1,
                  'Know More',
                  'Learn about biometric registration process',
                  () {
                    HapticFeedback.mediumImpact();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: theme.colorScheme.surface,
                        title: Text(
                          'Biometric Registration',
                          style: GoogleFonts.poppins(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Text(
                          'Biometric registration is mandatory for all students. Please visit the designated location during working hours.',
                          style: GoogleFonts.inter(
                            color: theme.colorScheme.onSurface.withOpacity(0.8),
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'OK',
                              style: TextStyle(color: theme.colorScheme.primary),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                _buildCard(
                  context,
                  2,
                  'Continue',
                  'Proceed to next step',
                  () {
                    if (!isDone) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Please complete biometric registration first',
                            style: TextStyle(color: theme.colorScheme.onError),
                          ),
                          backgroundColor: theme.colorScheme.error,
                        ),
                      );
                      return;
                    }
                    HapticFeedback.mediumImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CredentialCollectionScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Data model for process steps
class StepData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  StepData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}
