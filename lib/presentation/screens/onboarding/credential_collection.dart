import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'anti_ragging.dart';

class CredentialCollectionScreen extends StatefulWidget {
  const CredentialCollectionScreen({super.key});

  @override
  State<CredentialCollectionScreen> createState() => _CredentialCollectionScreenState();
}

class _CredentialCollectionScreenState extends State<CredentialCollectionScreen>
    with TickerProviderStateMixin {
  bool isDone = false;

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _cardController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late List<Animation<double>> _cardAnimations;

  static const String location = 'LH3, LNM Institute, Jaipur';
  static const String mapUrl = 'https://maps.app.goo.gl/9eRnELgnmkAZynyb8'; // Update if you have a specific LH3 map link

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
      isDone = prefs.getBool('credential_collection_done') ?? false;
    });
  }

  Future<void> _setDone(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('credential_collection_done', value);
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
            Text(value ? 'Credential collection marked complete!' : 'Marked as pending'),
          ],
        ),
        backgroundColor: value ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Future<void> _launchMapUrl() async {
    final Uri url = Uri.parse(mapUrl);
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 1024;
    final isTablet = size.width >= 768 && size.width < 1024;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                _buildModernAppBar(isDesktop, isTablet),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isDesktop ? 48 : (isTablet ? 32 : 20),
                      vertical: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoSection(isDesktop),
                        SizedBox(height: isDesktop ? 48 : 32),
                        _buildCredentialList(isDesktop),
                        SizedBox(height: isDesktop ? 32 : 24),
                        _buildLocationSection(isDesktop),
                        SizedBox(height: isDesktop ? 48 : 32),
                        _buildProgressSection(isDesktop),
                        SizedBox(height: isDesktop ? 32 : 24),
                        _buildActionButtons(isDesktop),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModernAppBar(bool isDesktop, bool isTablet) {
    return SliverAppBar(
      expandedHeight: isDesktop ? 200 : 160,
      floating: false,
      pinned: true,
      elevation: 0,
      backgroundColor: const Color(0xFF0F172A),
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF59E0B),
                Color(0xFFEAB308),
                Color(0xFFCA8A04),
              ],
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(isDesktop ? 48 : 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(
                        Icons.badge_rounded,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Credential Collection',
                            style: GoogleFonts.poppins(
                              fontSize: isDesktop ? 32 : 24,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                          ),
                          Text(
                            'Collect your LNMIIT credentials',
                            style: GoogleFonts.inter(
                              fontSize: isDesktop ? 16 : 14,
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection(bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 32 : 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFF59E0B).withOpacity(0.12),
            const Color(0xFFEAB308).withOpacity(0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFF59E0B).withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: isDesktop ? 32 : 24,
            color: const Color(0xFFF59E0B),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Collect your LNMIIT email credentials and app login details from LH3 after completing biometric registration.',
                  style: GoogleFonts.poppins(
                    fontSize: isDesktop ? 16 : 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Carry a valid photo ID for verification.',
                  style: GoogleFonts.inter(
                    fontSize: isDesktop ? 14 : 12,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCredentialList(bool isDesktop) {
    final credentials = [
      CredentialData(
        title: 'LNMIIT Email',
        description: 'Get your official institute email account',
        icon: Icons.email_rounded,
        color: const Color(0xFF3B82F6),
      ),
      CredentialData(
        title: 'App Login',
        description: 'Receive credentials for mobile app access',
        icon: Icons.login_rounded,
        color: const Color(0xFF10B981),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Credentials Provided',
          style: GoogleFonts.poppins(
            fontSize: isDesktop ? 24 : 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        ...credentials.asMap().entries.map((entry) {
          return AnimatedBuilder(
            animation: _cardAnimations[entry.key],
            builder: (context, child) {
              return Transform.scale(
                scale: 0.8 + (0.2 * _cardAnimations[entry.key].value),
                child: Opacity(
                  opacity: _cardAnimations[entry.key].value,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: _buildCredentialCard(entry.value, isDesktop),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ],
    );
  }

  Widget _buildCredentialCard(CredentialData credential, bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 20 : 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E293B).withOpacity(0.8),
            const Color(0xFF334155).withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: credential.color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: credential.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              credential.icon,
              size: isDesktop ? 24 : 20,
              color: credential.color,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  credential.title,
                  style: GoogleFonts.poppins(
                    fontSize: isDesktop ? 16 : 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  credential.description,
                  style: GoogleFonts.inter(
                    fontSize: isDesktop ? 14 : 12,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection(bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 24 : 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E3A8A).withOpacity(0.8),
            const Color(0xFF3B82F6).withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF3B82F6).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.location_on_rounded,
                  size: isDesktop ? 32 : 28,
                  color: const Color(0xFF3B82F6),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'LH3',
                      style: GoogleFonts.poppins(
                        fontSize: isDesktop ? 20 : 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Credential collection center',
                      style: GoogleFonts.inter(
                        fontSize: isDesktop ? 14 : 12,
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Visit LH3 to collect your LNMIIT email and app credentials.',
            style: GoogleFonts.inter(
              fontSize: isDesktop ? 16 : 14,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: _buildActionButton(
              icon: Icons.directions_rounded,
              label: 'Get Directions to LH3',
              color: const Color(0xFF3B82F6),
              onTap: _launchMapUrl,
              isDesktop: isDesktop,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressSection(bool isDesktop) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 24 : 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            (isDone ? const Color(0xFF10B981) : const Color(0xFFF59E0B)).withOpacity(0.1),
            (isDone ? const Color(0xFF059669) : const Color(0xFFD97706)).withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: (isDone ? const Color(0xFF10B981) : const Color(0xFFF59E0B)).withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: (isDone ? const Color(0xFF10B981) : const Color(0xFFF59E0B)).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isDone ? Icons.check_circle_rounded : Icons.schedule_rounded,
              size: isDesktop ? 28 : 24,
              color: isDone ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isDone ? 'Collection Complete' : 'Collection Pending',
                  style: GoogleFonts.poppins(
                    fontSize: isDesktop ? 18 : 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isDone
                      ? 'You have collected your credentials!'
                      : 'Visit LH3 to collect your credentials.',
                  style: GoogleFonts.inter(
                    fontSize: isDesktop ? 14 : 12,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: isDone,
            onChanged: _setDone,
            activeColor: const Color(0xFF10B981),
            thumbColor: MaterialStateProperty.all(Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(bool isDesktop) {
    return SizedBox(
      width: double.infinity,
      child: _buildActionButton(
        icon: Icons.arrow_forward_rounded,
        label: 'Continue to Anti-Ragging Declaration',
        color: const Color(0xFFF59E0B),
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AntiRaggingScreen()),
          );
        },
        isDesktop: isDesktop,
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    required bool isDesktop,
  }) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 24 : 20,
          vertical: isDesktop ? 16 : 14,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color,
              color.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: isDesktop ? 20 : 18,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: isDesktop ? 16 : 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CredentialData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  CredentialData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}
