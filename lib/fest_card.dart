import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentEventScreen extends StatelessWidget {
  final String imageUrl;
  final List<String> galleryImages;
  final List<Map<String, String>> festHeads;
  final String instaUrl;
  final String description;
  final String emailUrl;
  final String youtubeUrl;
  final String linkedinUrl;
  final String facebookUrl;
  final String xUrl;
  final String label;

  const StudentEventScreen({
    super.key,
    required this.imageUrl,
    required this.galleryImages,
    required this.festHeads,
    required this.instaUrl,
    required this.description,
    required this.emailUrl,
    required this.youtubeUrl,
    required this.linkedinUrl,
    required this.facebookUrl,
    required this.xUrl,
    required this.label,
  });

  void _launchPhone(String phone) async {
    final Uri uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _launchEmail(String email) async {
    final Uri uri = Uri(scheme: 'mailto', path: email);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _launchInstagram() async {
    if (instaUrl.trim().isEmpty) {
      debugPrint('Instagram URL is empty.');
      return;
    }

    final Uri url = Uri.parse(instaUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  Future<void> _launchYouTube(String url) async {
    if (url.trim().isEmpty) {
      debugPrint('YouTube URL is empty.');
      return;
    }

    final Uri youtubeUri = Uri.parse(url);

    if (await canLaunchUrl(youtubeUri)) {
      await launchUrl(youtubeUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $youtubeUri');
    }
  }

  Future<void> _launchGmail(String gmailUrl) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: gmailUrl, // replace with your email
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch Gmail';
    }
  }

  Future<void> _launchLinkedIn(String url) async {
    if (url.trim().isEmpty) {
      debugPrint('LinkedIn URL is empty.');
      return;
    }

    final Uri linkedinUri = Uri.parse(url);

    if (await canLaunchUrl(linkedinUri)) {
      await launchUrl(linkedinUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $linkedinUri');
    }
  }

  Future<void> _launchFacebook(String url) async {
    if (url.trim().isEmpty) {
      debugPrint('Facebook URL is empty.');
      return;
    }

    final Uri fbUri = Uri.parse(url);

    if (await canLaunchUrl(fbUri)) {
      await launchUrl(fbUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $fbUri');
    }
  }

  Future<void> _launchX(String url) async {
    if (url.trim().isEmpty) {
      debugPrint('X URL is empty.');
      return;
    }

    final Uri xUri = Uri.parse(url);

    if (await canLaunchUrl(xUri)) {
      await launchUrl(xUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $xUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 25.h),
            SizedBox(
              height: 140.h,
              width: double.infinity,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 60.r,
                      backgroundImage: AssetImage(imageUrl),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    left: 15.w,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: Color(0xFF1C2834),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 30.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                description,
                style: GoogleFonts.inter(
                  color: theme.colorScheme.onSurface,
                  fontSize: 9.sp
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(10.w),
              itemCount: festHeads.length,
              itemBuilder: (context, index) {
                final cordie = festHeads[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: theme.colorScheme.onSurface.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                    title: Text(
                      cordie['name'] ?? '',
                      style: GoogleFonts.inter(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    subtitle: Text(
                      label.trim().toLowerCase() == "tedx lnmiit" ? "Organiser" : "Fest Head",
                      style: GoogleFonts.inter(
                        color: theme.colorScheme.onSurface.withOpacity(0.7),
                        fontSize: 10.sp,
                      ),
                    ),
                    trailing: Wrap(
                      spacing: 12.w,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.call,
                            color: Colors.greenAccent,
                          ),
                          onPressed: () => _launchPhone(cordie['phone'] ?? ''),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.mail,
                            color: Colors.lightBlueAccent,
                          ),
                          onPressed: () => _launchEmail(cordie['email'] ?? ''),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Divider(color: Colors.white38),
            SizedBox(height: 16.h),
            GalleryCarousel(galleryImages: galleryImages),
            SizedBox(height: 40.h),
            if ([
              instaUrl,
              emailUrl,
              youtubeUrl,
              linkedinUrl,
              facebookUrl,
              xUrl,
            ].any((url) => url.trim().isNotEmpty))
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0.w),
                    child: Text(
                      "Connect with us",
                      style: GoogleFonts.poppins(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        if (instaUrl.trim().isNotEmpty)
                          _buildSocialIcon(
                            'assets/images/Instagram.png',
                            50,
                            _launchInstagram,
                          ),
                        if (emailUrl.trim().isNotEmpty)
                          _buildSocialIcon(
                            'assets/images/gmail.png',
                            35,
                            () => _launchGmail(emailUrl),
                          ),
                        if (youtubeUrl.trim().isNotEmpty)
                          _buildSocialIcon(
                            'assets/images/youtube_logo.png',
                            40,
                            () => _launchYouTube(youtubeUrl),
                          ),
                        if (linkedinUrl.trim().isNotEmpty)
                          _buildSocialIcon(
                            'assets/images/linkedin_logo.png',
                            30,
                            () => _launchLinkedIn(linkedinUrl),
                          ),
                        if (facebookUrl.trim().isNotEmpty)
                          _buildSocialIcon(
                            'assets/images/facebook.png',
                            30,
                            () => _launchFacebook(facebookUrl),
                          ),
                        if (xUrl.trim().isNotEmpty)
                          _buildSocialIcon(
                            'assets/images/x.png',
                            35,
                            () => _launchX(xUrl),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String path, double size, Function() onTap) {
    return GestureDetector(
      onTap: () async {
        try {
          await onTap();
        } catch (e) {
          // fallback
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Image.asset(path, width: size.w, height: size.h),
      ),
    );
  }
}

class GalleryCarousel extends StatefulWidget {
  final List<String> galleryImages;
  const GalleryCarousel({super.key, required this.galleryImages});

  @override
  State<GalleryCarousel> createState() => _GalleryCarouselState();
}

class _GalleryCarouselState extends State<GalleryCarousel> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  int _currentIndex = 0;

  void _goToPrevious() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  void _goToNext() {
    if (_currentIndex < widget.galleryImages.length - 1) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 310.w,
            height: 180.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(53, 63, 84, 1),
                  Color.fromRGBO(34, 40, 52, 1),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: widget.galleryImages.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            widget.galleryImages[index],
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(
                                  child: Icon(
                                    Icons.broken_image,
                                    color: Colors.white,
                                  ),
                                ),
                          ),
                          Container(color: Colors.black.withOpacity(0.35)),
                        ],
                      );
                    },
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  Positioned(
                    left: 16.w,
                    bottom: 6.h,
                    child: Text(
                      'Gallery',
                      style: GoogleFonts.poppins(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildArrow(
            _goToPrevious,
            Icons.keyboard_arrow_left_sharp,
            Alignment.centerLeft,
            -15.w,
          ),
          _buildArrow(
            _goToNext,
            Icons.keyboard_arrow_right_sharp,
            Alignment.centerRight,
            -15.w,
          ),
        ],
      ),
    );
  }

  Widget _buildArrow(
    VoidCallback onTap,
    IconData icon,
    Alignment align,
    double offset,
  ) {
    return Positioned(
      left: align == Alignment.centerLeft ? offset : null,
      right: align == Alignment.centerRight ? offset : null,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 33.h,
          width: 33.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(142, 151, 253, 1),
                Color.fromRGBO(72, 49, 157, 1),
              ],
            ),
          ),
          child: Icon(icon, color: Colors.white, size: 23.sp),
        ),
      ),
    );
  }
}
