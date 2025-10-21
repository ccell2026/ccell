import 'dart:convert';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_page/core/theme/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_page/presentation/screens/auth/login_page.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb, Uint8List;
import 'package:image_picker/image_picker.dart';
import 'package:login_page/core/utils/guest_id_manager.dart';
import 'package:provider/provider.dart';
import 'package:login_page/core/theme/theme_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin {
  File? _profileImagePicked;
  static const String _imageKey = 'profile_image_path';
  Uint8List? _webImageBytes;

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // Student details
  String? roll;
  String? branch;
  String? batch;
  String? email;
  String? degree;

  final Map<String, String> branchName = {
    'ucs': 'Computer Science and Engineering',
    'ucc': 'Communication and Computer Engineering',
    'uec': 'Electronics and Communication Engineering',
    'ume': 'Mechanical Engineering',
    'dcs': 'Computer Science and Engineering',
    'dec': 'Electronics and Communication Engineering',
  };

  final Map<String, String> degreeType = {
    'ucs': 'B.Tech',
    'ucc': 'B.Tech',
    'uec': 'B.Tech',
    'ume': 'B.Tech',
    'dcs': 'B.Tech - M.Tech (Dual)',
    'dec': 'B.Tech - M.Tech (Dual)',
  };

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
    email = FirebaseAuth.instance.currentUser?.email;
    if (email != null) extractUsername(email!);

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void extractUsername(String email) {
    final username = email.split('@').first;
    if (username.length >= 8) {
      roll = username;
      final code = username.substring(2, 5);
      branch = branchName[code];
      degree = degreeType[code];

      final year = int.tryParse(username.substring(0, 2));
      if (year != null) {
        if (branch == 'dec' || branch == 'dcs') {
          batch = '20$year - 20${year + 5}';
        } else {
          batch = '20$year - 20${year + 4}';
        }
      }
    }
  }

  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_imageKey);

    if (saved != null) {
      if (kIsWeb) {
        _webImageBytes = base64Decode(saved);
      } else if (File(saved).existsSync()) {
        _profileImagePicked = File(saved);
      }
      setState(() {});
    }
  }

  Future<void> _profilePicker() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final prefs = await SharedPreferences.getInstance();

      if (kIsWeb) {
        final bytes = await pickedFile.readAsBytes();
        _webImageBytes = bytes;
        await prefs.setString(_imageKey, base64Encode(bytes));
      } else {
        final path = pickedFile.path;
        _profileImagePicked = File(path);
        await prefs.setString(_imageKey, path);
      }
      setState(() {});
    }
  }

  Future<void> signOutUser() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      await googleSignIn.signOut();
      await FirebaseAuth.instance.signOut();
      await GuestIdManager.clearGuestId();
    } catch (e) {
      debugPrint("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            surfaceTintColor: Colors.transparent,
            backgroundColor: theme.colorScheme.surface,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: _ThemeChangeButton(),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              titlePadding: const EdgeInsets.only(left: 24, bottom: 16),
              title: AnimatedBuilder(
                animation: _fadeAnimation!,
                builder: (context, child) {
                  return Opacity(
                    opacity: _fadeAnimation!.value,
                    child: Text(
                      "Profile",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 16),
                SlideTransition(
                  position: _slideAnimation!,
                  child: _ProfileHeaderSection(
                    pickedImage: _profileImagePicked,
                    webImageBytes: _webImageBytes,
                    onPressed: _profilePicker,
                    theme: theme,
                    email: email,
                  ),
                ),
                const SizedBox(height: 32),
                SlideTransition(
                  position: _slideAnimation!,
                  child: _AcademicDetailsSection(
                    roll: roll,
                    degree: degree,
                    batch: batch,
                    branch: branch,
                    theme: theme,
                  ),
                ),
                const SizedBox(height: 24),
                SlideTransition(
                  position: _slideAnimation!,
                  child: _SignOutButton(
                    onPressed: () async {
                      await signOutUser();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                    theme: theme,
                  ),
                ),
                const SizedBox(height: 48),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileHeaderSection extends StatelessWidget {
  final File? pickedImage;
  final Uint8List? webImageBytes;
  final VoidCallback onPressed;
  final ThemeData theme;
  final String? email;

  const _ProfileHeaderSection({
    required this.pickedImage,
    required this.webImageBytes,
    required this.onPressed,
    required this.theme,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.colorScheme.outline.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: ClipOval(
                  child: _ModernProfileImage(
                    pickedImage: pickedImage,
                    webImageBytes: webImageBytes,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onPressed,
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.surface,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.edit,
                      size: 18,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          FirebaseAuth.instance.currentUser?.displayName ?? 'User',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.email_rounded,
                size: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 8),
              Text(
                email ?? 'No Email',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AcademicDetailsSection extends StatelessWidget {
  final String? roll;
  final String? degree;
  final String? batch;
  final String? branch;
  final ThemeData theme;

  const _AcademicDetailsSection({
    required this.roll,
    required this.degree,
    required this.batch,
    required this.branch,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Academic Details',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _DetailRow(
                icon: Icons.badge_rounded,
                label: 'Roll Number',
                value: roll,
                theme: theme,
              ),
              const SizedBox(height: 12),
              _DetailRow(
                icon: Icons.school_rounded,
                label: 'Degree',
                value: degree,
                theme: theme,
              ),
              const SizedBox(height: 12),
              _DetailRow(
                icon: Icons.calendar_today_rounded,
                label: 'Batch',
                value: batch,
                theme: theme,
              ),
              if (branch != null) ...[
                const SizedBox(height: 12),
                _DetailRow(
                  icon: Icons.engineering_rounded,
                  label: 'Branch',
                  value: branch,
                  theme: theme,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final ThemeData theme;

  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value ?? 'Not available',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ThemeChangeButton extends StatefulWidget{

  const _ThemeChangeButton({super.key});


  @override
  State<_ThemeChangeButton> createState() => _ThemeChangeButtonState();
}

class _ThemeChangeButtonState extends State<_ThemeChangeButton> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return AnimatedToggleSwitch<bool>.dual(
      current: themeNotifier.isDarkMode,
      first: false,
      second: true,
      spacing: 50.0,
      style: const ToggleStyle(
        borderColor: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1.5),
          ),
        ],
      ),
      borderWidth: 5.0,
      height: 55,
      onChanged: (value) {
        themeNotifier.toggleTheme();
      },
      styleBuilder: (b) => ToggleStyle(
          indicatorColor: b ? Colors.black87 : Colors.lightBlueAccent),
      iconBuilder: (value) => value
          ? const Icon(Icons.nightlight)
          : const Icon(Icons.sunny),
      textBuilder: (value) => value
          ? const Center(child: Text('Dark'))
          : const Center(child: Text('Light')),
    );
  }

}


class _SignOutButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ThemeData theme;

  const _SignOutButton({
    required this.onPressed,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: theme.colorScheme.errorContainer,
        foregroundColor: theme.colorScheme.onErrorContainer,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.logout_rounded),
          const SizedBox(width: 12),
          Text(
            'Sign Out',
            style: theme.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ModernProfileImage extends StatelessWidget {
  final File? pickedImage;
  final Uint8List? webImageBytes;

  const _ModernProfileImage({
    required this.pickedImage,
    required this.webImageBytes,
  });

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final photoUrl = user?.photoURL ?? '';

    ImageProvider imageProvider;

    if (kIsWeb && webImageBytes != null) {
      imageProvider = MemoryImage(webImageBytes!);
    } else if (!kIsWeb && pickedImage != null) {
      imageProvider = FileImage(pickedImage!);
    } else if (photoUrl.isNotEmpty) {
      imageProvider = NetworkImage(photoUrl);
    } else {
      imageProvider = const AssetImage('assets/images/profile.png');
    }

    return Image(
      image: imageProvider,
      width: 120,
      height: 120,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Icon(
          Icons.person,
          size: 48,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}