import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/main.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key, required this.userName});

  final String userName;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  double _progress = 0.0;
  double _opacity = 1.0;

  // Animation Controllers
  late AnimationController _pulseController;
  late AnimationController _rotationController;
  late AnimationController _scaleController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.linear),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    // Start animations with proper timing
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _pulseController.repeat(reverse: true);
        _rotationController.repeat();
        _scaleController.forward();
        _startLoading();
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _rotationController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _startLoading() {
    const duration = Duration(milliseconds: 50);
    int i = 0;

    Timer.periodic(duration, (Timer timer) {
      if (i > 100) {
        timer.cancel();
        setState(() {
          _opacity = 0.0;
        });

        Future.delayed(const Duration(milliseconds: 400), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
                (Route<dynamic> route) => false,
          );
        });
      } else {
        setState(() {
          _progress = i / 100;
        });
        i++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width >= 1024;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0E27),
              Color(0xFF1E293B),
              Color(0xFF0F172A),
            ],
          ),
        ),
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 400),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App Logo Section
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: AnimatedBuilder(
                          animation: _pulseAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _pulseAnimation.value,
                              child: Container(
                                width: isDesktop ? 160 : 120,
                                height: isDesktop ? 160 : 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF3B82F6).withOpacity(0.4),
                                      blurRadius: 30,
                                      spreadRadius: 5,
                                    ),
                                  ],
                                ),
                                child: RotationTransition(
                                  turns: _rotationAnimation,
                                  child: Image.asset("assets/images/ccell_logo_dark.png",
                                    height: 60,
                                    width: 60,
                                  )
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: isDesktop ? 48 : 32),

                      // App Title
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: Column(
                          children: [
                            Text(
                              'C-Cell',
                              style: GoogleFonts.poppins(
                                fontSize: isDesktop ? 48 : 36,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                letterSpacing: -1,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'LNMIIT Student App',
                              style: GoogleFonts.inter(
                                fontSize: isDesktop ? 20 : 16,
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: isDesktop ? 64 : 48),

                      // Welcome Message
                      ScaleTransition(
                        scale: _scaleAnimation,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: isDesktop ? 80 : 40,
                          ),
                          padding: EdgeInsets.all(isDesktop ? 32 : 24),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.1),
                                Colors.white.withOpacity(0.05),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.person_rounded,
                                size: isDesktop ? 32 : 24,
                                color: const Color(0xFF3B82F6),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Welcome back',
                                style: GoogleFonts.inter(
                                  fontSize: isDesktop ? 18 : 16,
                                  color: Colors.white.withOpacity(0.7),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                widget.userName,
                                style: GoogleFonts.poppins(
                                  fontSize: isDesktop ? 24 : 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Progress Section
                Padding(
                  padding: EdgeInsets.all(isDesktop ? 48 : 32),
                  child: Column(
                    children: [
                      // Loading Text
                      Text(
                        'Loading your dashboard...',
                        style: GoogleFonts.inter(
                          fontSize: isDesktop ? 16 : 14,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: isDesktop ? 24 : 16),

                      // Progress Bar
                      Container(
                        width: double.infinity,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: _progress,
                            backgroundColor: Colors.transparent,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xFF3B82F6),
                            ),
                            minHeight: 8,
                          ),
                        ),
                      ),

                      SizedBox(height: isDesktop ? 16 : 12),

                      // Progress Percentage
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${(_progress * 100).round()}%',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: const Color(0xFF3B82F6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Almost there...',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.5),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
