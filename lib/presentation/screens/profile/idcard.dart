import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'checklist.dart';
import 'login_page.dart';

class IdCardScreen extends StatefulWidget {
  const IdCardScreen({super.key});

  static const String idCardMapUrl = 'https://maps.app.goo.gl/VnJqvNGdJhhoiZyb9';
  static const String description = "Collect your official LNMIIT ID card from the CP1 Lab after completing the prior steps.";

  @override
  State<IdCardScreen> createState() => _IdCardScreenState();
}

class _IdCardScreenState extends State<IdCardScreen> with TickerProviderStateMixin {
  bool isDone = false;
  bool allDone = false;

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _loadDoneStatus();
    _checkAllDone();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 200), () {
        if (mounted) {
          _fadeController.forward();
          Future.delayed(const Duration(milliseconds: 150), () {
            if (mounted) _slideController.forward();
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  Future<void> _loadDoneStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDone = prefs.getBool('idcard_collection_done') ?? false;
    });
  }

  Future<void> _checkAllDone() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      allDone = (prefs.getBool('hostel_registration_done') ?? false) &&
          (prefs.getBool('document_verification_done') ?? false) &&
          (prefs.getBool('biometric_done') ?? false) &&
          (prefs.getBool('credential_collection_done') ?? false) &&
          (prefs.getBool('anti_ragging_done') ?? false) &&
          (prefs.getBool('idcard_collection_done') ?? false);
    });
  }

  Future<void> _setDone(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('idcard_collection_done', value);
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
            Text(value ? 'ID Card collection marked complete!' : 'Marked as pending'),
          ],
        ),
        backgroundColor: value ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
    _checkAllDone();
  }

  Future<void> _launchMapUrl() async {
    final Uri url = Uri.parse(IdCardScreen.idCardMapUrl);
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
      backgroundColor: const Color(0xFF0A0E27),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                _buildAppBar(isDesktop, isTablet),
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
                        SizedBox(height: isDesktop ? 40 : 28),
                        _buildLocationSection(isDesktop),
                        SizedBox(height: isDesktop ? 40 : 28),
                        _buildProgressSection(isDesktop),
                        SizedBox(height: isDesktop ? 32 : 24),
                        _buildChecklistOrLoginButton(isDesktop),
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

  Widget _buildAppBar(bool isDesktop, bool isTablet) {
    return SliverAppBar(
      expandedHeight: isDesktop ? 180 : 140,
      floating: false,
      pinned: true,
      elevation: 0,
      backgroundColor: const Color(0xFF0A0E27),
      foregroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF6366F1),
                Color(0xFF818CF8),
                Color(0xFF3730A3),
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
                        Icons.credit_card_rounded,
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
                            'ID Card Collection',
                            style: GoogleFonts.poppins(
                              fontSize: isDesktop ? 28 : 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              letterSpacing: -0.5,
                            ),
                          ),
                          Text(
                            'Collect your LNMIIT ID card',
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
            const Color(0xFF6366F1).withOpacity(0.12),
            const Color(0xFF818CF8).withOpacity(0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF6366F1).withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: isDesktop ? 32 : 24,
            color: const Color(0xFF6366F1),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Collect your official LNMIIT ID card from the CP1 Lab after completing all prior steps.',
                  style: GoogleFonts.poppins(
                    fontSize: isDesktop ? 16 : 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Carry a valid photo ID and your admission letter for verification.',
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
      padding: EdgeInsets.all(isDesktop ? 28 : 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF818CF8).withOpacity(0.15),
            const Color(0xFF6366F1).withOpacity(0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF6366F1).withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF6366F1).withOpacity(0.18),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.location_on_rounded,
                  size: 24,
                  color: Color(0xFF6366F1),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'CP1 Lab',
                  style: GoogleFonts.poppins(
                    fontSize: isDesktop ? 18 : 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Show this screen at the counter to collect your ID card.',
            style: GoogleFonts.inter(
              fontSize: isDesktop ? 14 : 12,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _launchMapUrl,
              icon: const Icon(Icons.directions_rounded),
              label: const Text('Get Directions to CP1 Lab'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: isDesktop ? 16 : 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
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
            (isDone ? const Color(0xFF10B981) : const Color(0xFF6366F1)).withOpacity(0.1),
            (isDone ? const Color(0xFF059669) : const Color(0xFF6366F1)).withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: (isDone ? const Color(0xFF10B981) : const Color(0xFF6366F1)).withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: (isDone ? const Color(0xFF10B981) : const Color(0xFF6366F1)).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isDone ? Icons.check_circle_rounded : Icons.credit_card_rounded,
              size: isDesktop ? 28 : 24,
              color: isDone ? const Color(0xFF10B981) : const Color(0xFF6366F1),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isDone ? 'ID Card Collected' : 'ID Card Pending',
                  style: GoogleFonts.poppins(
                    fontSize: isDesktop ? 18 : 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isDone
                      ? 'You have collected your LNMIIT ID card!'
                      : 'Visit the CP1 Lab to collect your ID card.',
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

  Widget _buildChecklistOrLoginButton(bool isDesktop) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(allDone ? Icons.login_rounded : Icons.arrow_back_rounded),
        label: Text(allDone ? 'Proceed to Login' : 'Go Back to Checklist'),
        style: ElevatedButton.styleFrom(
          backgroundColor: allDone ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: isDesktop ? 16 : 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          if (allDone) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ChecklistScreen()),
            );
          }
        },
      ),
    );
  }
}