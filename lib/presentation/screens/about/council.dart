import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class CouncilDetailScreen extends StatelessWidget {
  final String imageUrl;
  final List<String> galleryImages;
  final List<Map<String, String>> cordies;
  final String instaUrl;
  final String description;

  const CouncilDetailScreen({
    super.key,
    required this.imageUrl,
    required this.galleryImages,
    required this.cordies,
    required this.instaUrl,
    required this.description,
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
    if (instaUrl.trim().isEmpty) return;
    final Uri url = Uri.parse(instaUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
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
                          color: Color(0xFFFFFFFF),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
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
                  fontSize: 10.sp,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(12.w),
              itemCount: cordies.length,
              itemBuilder: (context, index) {
                final cordie = cordies[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: theme.colorScheme.onSurface.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    title: Text(
                      cordie['name'] ?? '',
                      style: GoogleFonts.inter(
                        color: theme.colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    trailing: Wrap(
                      spacing: 12.w,
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
            Divider(
              color: theme.colorScheme.onSurface.withOpacity(0.38),
              thickness: 1.h
            ),
            SizedBox(height: 16.h),
            GalleryCarousel(galleryImages: galleryImages),
            SizedBox(height: 40.h),
            if (instaUrl.trim().isNotEmpty) ...[
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  "Connect with us",
                  style: GoogleFonts.poppins(
                    color: theme.colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.sp,
                  ),
                ),
              ),
              GestureDetector(
                onTap: _launchInstagram,
                child: Image.asset(
                  'assets/images/Instagram.png',
                  width: 60.w,
                  height: 60.w,
                ),
              ),
            ],
            SizedBox(height: 30.h),
          ],
        ),
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
  final PageController _pageController = PageController();
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
    final theme = Theme.of(context);
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            width: 310.w,
            height: 180.h,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF353F54),
                  Color(0xFF222834),
                ],
              ),
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: theme.colorScheme.onSurface.withOpacity(0.1),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Container(
                color: Colors.black,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: widget.galleryImages.length,
                      itemBuilder: (context, index) => Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            widget.galleryImages[index],
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  color: theme.colorScheme.surface,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) => Icon(
                              Icons.broken_image,
                              color: theme.colorScheme.error,
                              size: 48,
                            ),
                          ),
                          Container(
                            color: theme.colorScheme.onPrimary.withOpacity(0.35),
                          ),
                        ],
                      ),
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    // Image counter
                    Positioned(
                      top: 16.h,
                      right: 16.w,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Text(
                          '${_currentIndex + 1}/${widget.galleryImages.length}',
                          style: GoogleFonts.inter(
                            color: theme.colorScheme.onSurface,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Navigation arrows
          if (widget.galleryImages.length > 1) ...[
            Positioned(
              left: -15.w,
              child: _arrowButton(
                Icons.keyboard_arrow_left_sharp,
                _goToPrevious,
                theme,
                _currentIndex > 0,
              ),
            ),
            Positioned(
              right: -15.w,
              child: _arrowButton(
                Icons.keyboard_arrow_right_sharp,
                _goToNext,
                theme,
                _currentIndex < widget.galleryImages.length - 1,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _arrowButton(
    IconData icon,
    VoidCallback onTap,
    ThemeData theme,
    bool isEnabled,
  ) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        height: 33.h,
        width: 33.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isEnabled
                ? [
                    theme.colorScheme.primary,
                    theme.colorScheme.secondary,
                  ]
                : [
                    theme.colorScheme.surface.withOpacity(0.3),
                    theme.colorScheme.surface.withOpacity(0.1),
                  ],
          ),
        ),
        child: Icon(
          icon,
          color: isEnabled
              ? theme.colorScheme.onPrimary
              : theme.colorScheme.onSurface.withOpacity(0.3),
          size: 23.sp,
        ),
      ),
    );
  }
}
