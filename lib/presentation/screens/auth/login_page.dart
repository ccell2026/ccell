import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/presentation/screens/auth/google_sign_in.dart';
import 'package:login_page/presentation/screens/auth/welcome_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  bool _isSigningIn = false;

  final Uri emailUrl = Uri(
      scheme: 'mailto',
      path: 'c-cell.students@lnmiit.ac.in',
      query: Uri.encodeQueryComponent(
        'subject=Unable to Login into C-Cell App',
      ));

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _startAnimations();
      }
    });
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.elasticOut));

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.bounceOut),
    );
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _fadeController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _slideController.forward();
    await Future.delayed(const Duration(milliseconds: 300));
    _scaleController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isDesktop = screenSize.width >= 1024;
    final bool isTablet = screenSize.width >= 768 && screenSize.width < 1024;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          );
        }
      },
      child: Scaffold(
        body: Container(
          height: screenSize.height,
          width: screenSize.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF0A1828),
                Color(0xFF178582),
                Color(0xFF23395B),
                Color(0xFF0A1828),
              ],
              stops: [0.0, 0.3, 0.7, 1.0],
            ),
          ),
          child: SafeArea(
            child: _buildResponsiveLayout(isDesktop, isTablet, screenSize),
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveLayout(bool isDesktop, bool isTablet, Size screenSize) {
    if (isDesktop) {
      return _buildDesktopLayout(screenSize);
    } else if (isTablet) {
      return _buildTabletLayout(screenSize);
    } else {
      return _buildMobileLayout(screenSize);
    }
  }

  Widget _buildDesktopLayout(Size screenSize) {
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: Row(
        children: [
          // Left side - Branding
          Expanded(
            flex: 5,
            child: SizedBox(
              height: screenSize.height,
              child: _buildBrandingSection(screenSize, true),
            ),
          ),
          // Right side - Login Form
          Expanded(
            flex: 4,
            child: Container(
              height: screenSize.height,
              padding: const EdgeInsets.all(60),
              child: Center(
                child: _buildLoginCard(screenSize, true),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(Size screenSize) {
    return SizedBox(
      height: screenSize.height,
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenSize.height,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBrandingSection(screenSize, false),
                const SizedBox(height: 40),
                _buildLoginCard(screenSize, false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(Size screenSize) {
    return SizedBox(
      height: screenSize.height,
      width: screenSize.width,
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenSize.height,
            minWidth: screenSize.width,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildBrandingSection(screenSize, false),
                const SizedBox(height: 30),
                _buildLoginCard(screenSize, false),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandingSection(Size screenSize, bool isDesktop) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo with glow effect
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF39E7E3).withValues(alpha: 0.2),
                    blurRadius: 30,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/ccell_logo_dark.png',
                height: isDesktop ? 350 : 280,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 10),

            // Welcome Text
            Text(
              'Welcome to',
              style: GoogleFonts.inter(
                fontSize: isDesktop ? 24 : 20,
                fontWeight: FontWeight.w300,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 8),

            Text(
              'C-Cell',
              style: GoogleFonts.poppins(
                fontSize: isDesktop ? 48 : 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF178582).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: const Color(0xFF178582).withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Text(
                'LNMIIT Student Hub',
                style: GoogleFonts.inter(
                  fontSize: isDesktop ? 16 : 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF4ECDC4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginCard(Size screenSize, bool isDesktop) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isDesktop ? 400 : double.infinity,
        ),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.95),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
            BoxShadow(
              color: const Color(0xFF178582).withValues(alpha: 0.1),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            Text(
              'Sign In',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2C3E50),
              ),
            ),
            const SizedBox(height: 8),

            Text(
              'Use your LNMIIT college email to continue',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.4,
              ),
            ),
            const SizedBox(height: 40),

            // Google Sign In Button
            _buildGoogleSignInButton(),
            const SizedBox(height: 24),

            // Security Badge
            _buildSecurityBadge(),
            const SizedBox(height: 32),

            // Help Section
            _buildHelpSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 45.h,
      child: Material(
        elevation: _isSigningIn ? 0 : 4,
        borderRadius: BorderRadius.circular(45),
        color: _isSigningIn ? Colors.grey[100] : Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(45),
          onTap: _isSigningIn ? null : _handleGoogleSignIn,
          child:
            Image.asset(
              'assets/images/google_logo.png',
            ),
        ),
      ),
    );
  }

  Widget _buildSecurityBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F9FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF178582).withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.security,
            size: 16,
            color: const Color(0xFF178582),
          ),
          const SizedBox(width: 8),
          Text(
            'Secure LNMIIT Authentication',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF178582),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpSection() {
    return Column(
      children: [
        const Divider(color: Colors.grey),
        const SizedBox(height: 16),
        const SizedBox(height: 16),

        TextButton.icon(
          onPressed: _showHelpDialog,
          icon: Icon(
            Icons.help_outline,
            size: 18,
            color: const Color(0xFF178582),
          ),
          label: Text(
            'Login Issues?',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF178582),
            ),
          ),
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }

  void _handleGoogleSignIn() async {
    setState(() {
      _isSigningIn = true;
    });

    try {
      await signInWithCollegeGoogleAccount(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.error_outline, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Sign in failed. Please try again.',
                    style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.red[600],
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSigningIn = false;
        });

      }
    }
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 16,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  const Color(0xFFF8FAFC),
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF178582).withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.help_outline,
                    size: 32,
                    color: const Color(0xFF178582),
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                  'Login Help',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  'Follow these steps to resolve login issues',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24),

                // Help Steps
                _buildHelpStep(
                  icon: Icons.email_outlined,
                  title: 'Check Your Email',
                  description: 'Ensure you\'re using your official LNMIIT email ID ending with @lnmiit.ac.in',
                  color: const Color(0xFF3B82F6),
                ),
                const SizedBox(height: 16),

                _buildHelpStep(
                  icon: Icons.people_outline,
                  title: 'Contact C-Cell',
                  description: 'Reach out to any C-Cell member for immediate assistance',
                  color: const Color(0xFF8B5CF6),
                ),
                const SizedBox(height: 16),

                _buildHelpStep(
                  icon: Icons.mail_outline,
                  title: 'Email Support',
                  description: 'Send us an email for technical support',
                  color: const Color(0xFF10B981),
                  isClickable: true,
                  onTap: _sendSupportEmail,
                ),
                const SizedBox(height: 24),

                // Close Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF178582),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Got it!',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHelpStep({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    bool isClickable = false,
    VoidCallback? onTap,
  }) {
    Widget content = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          if (isClickable) ...[
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: color,
            ),
          ],
        ],
      ),
    );

    if (isClickable && onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: content,
        ),
      );
    }

    return content;
  }

  void _sendSupportEmail() async {
    try {
      if (await canLaunchUrl(emailUrl)) {
        await launchUrl(emailUrl);
        Navigator.of(context).pop(); // Close dialog after opening email
      } else {
        _showEmailError();
      }
    } catch (e) {
      _showEmailError();
    }
  }

  void _showEmailError() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Could not open email app',
              style: GoogleFonts.inter(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            Text(
              'Please email us manually at:\nc-cell.students@lnmiit.ac.in',
              style: GoogleFonts.inter(fontSize: 12),
            ),
          ],
        ),
        backgroundColor: Colors.orange[600],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}

