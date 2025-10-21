import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:login_page/presentation/screens/auth/login_page.dart';
import 'package:login_page/presentation/screens/common/more_page.dart';
import 'package:login_page/presentation/screens/home/home_page.dart';
import 'package:login_page/presentation/screens/notifications/notifications_screen.dart';
import 'package:login_page/presentation/screens/profile/profile_page.dart';
import 'package:login_page/data/services/notification_service.dart';
import 'package:login_page/core/theme/theme_provider.dart';
import 'package:login_page/presentation/screens/auth/welcome_screen.dart';
import 'package:login_page/presentation/screens/onboarding/hostel_registration.dart';
import 'package:login_page/presentation/screens/home/loading_screen.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'presentation/screens/gymkhana/gymkhana.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/screens/lnmiit/lnm_page.dart';
import 'core/config/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:login_page/presentation/screens/common/coming_soon_page.dart';
import 'package:provider/provider.dart';

import 'data/repositories/notification_repository.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with web-specific config
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final notificationRepo = NotificationRepository(
    client: http.Client(),
    baseUrl: 'https://ccell-notification-api.onrender.com/api',
  );

  // Configure notifications differently for web vs mobile using repository
  if (kIsWeb) {
    await _setupWebPushNotifications(notificationRepo);
  } else {
    await _setupMobilePushNotifications(notificationRepo);
  }

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => notificationRepo),
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

// ================= WEB CONFIGURATION =================
Future<void> _setupWebPushNotifications(NotificationRepository repo) async {
  try {
    // Request browser permission
    final messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('✅ User granted web push permission');
      }

      // Use repository to register token
      await repo.registerToken(userId: await _getCurrentUserId());

      // Subscribe to default topics
      await repo.subscribeToTopic('all-users');

      // Handle foreground messages
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        if (kDebugMode) {
          print('📱 Web push received while app is open!');
          print('Title: ${message.notification?.title}');
          print('Body: ${message.notification?.body}');
        }
        _showWebNotification(message);
      });
    }
  } catch (e) {
    if (kDebugMode) {
      print('❌ Error configuring web push: $e');
    }
  }
}

// ================= MOBILE CONFIGURATION =================
Future<void> _setupMobilePushNotifications(NotificationRepository repo) async {
  // Background handler (must be top-level)
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Initialize local notifications plugin
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Create notification channel (Android)
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'c-cell-notifs',
    'C-Cell',
    description: 'Notifications from the C-Cell, LNMIIT',
    importance: Importance.high,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  // Use repository to register token
  await repo.registerToken(userId: await _getCurrentUserId());

  // Subscribe to default topics
  await repo.subscribeToTopic('all-users');

  // Foreground message handler
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;

    if (notification != null) {
      if (kDebugMode) {
        print("📱 Foreground push received!");
        print("Title: ${notification.title}");
        print("Body: ${notification.body}");
      }

      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'c-cell-notifs',
            'General',
            importance: Importance.high,
            priority: Priority.max,
            color: const Color(0xFF143FA6),
            enableLights: true,
            enableVibration: true,
            largeIcon: const FilePathAndroidBitmap('assets/images/ccell_logo.png'),
            visibility: NotificationVisibility.public,
          ),
        ),
      );
    }
  });
}

// ... (keep all your existing imports and Firebase setup code)

class MainScaffold extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final Function(int) onItemTapped;

  const MainScaffold({
    required this.body,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: body,
      ),
      bottomNavigationBar: SalomonBottomBar(
        margin: const EdgeInsets.all(15.0),
        currentIndex: currentIndex,
        itemShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(90),
        ),
        onTap: onItemTapped,
        backgroundColor: theme.colorScheme.onSurface,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade600,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
        items: [
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.home, currentIndex == 0),
            title: const Text("Home"),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.sports, currentIndex == 1),
            title: const Text("Gymkhana"),
            selectedColor:  Color(0xFF3B82F6),
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.notifications, currentIndex == 2),
            title: const Text("Notifications"),
            selectedColor: Color(0xFFF59E0B),
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.account_balance, currentIndex == 3),
            title: const Text("LNMIIT"),
            selectedColor: Color(0xFF10B981),
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.more_horiz, currentIndex == 4),
            title: const Text("More"),
            selectedColor: Colors.purpleAccent,
          ),
        ],
      ),
    );
  }

  static Widget _buildGlowingIcon(IconData icon, bool isActive) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: isActive
            ? [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ]
            : [],
      ),
      child: Icon(
        icon,
        color: isActive ? Colors.white : Colors.grey.shade600,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'LNMIIT C-Cell App',
        debugShowCheckedModeBanner: false,
        theme: themeNotifier.themeData,
        routes: {
          '/profile': (context) => const ProfilePage(),
          '/home': (context) => const MainNavigationWrapper(),
          '/welcome': (context) => const WelcomeScreen(),
          '/hostel_registration': (context) => const HostelRegistrationScreen(),
          '/login': (context) => LoginPage(),
          '/coming_soon': (context) => const ComingSoonPage(featureName: 'Feature'),
        },
        home: const AuthLoadingScreen(),
      ),
    );
  }
}

class MainNavigationWrapper extends StatefulWidget {
  final int initialIndex;

  const MainNavigationWrapper({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  late int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;  // Initialize with the passed index
  }

  final List<Widget> _pages = <Widget>[
    HomePage(userName: FirebaseAuth.instance.currentUser!.displayName!),
    const GymkhanaPage(),
    const NotificationsPage(),
    const LNMPage(),
    MorePage(),
  ];

  void _onItemTapped(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      currentIndex: _selectedIndex,
      onItemTapped: _onItemTapped,
    );
  }
}

// ... (keep your existing AuthLoadingScreen and other classes)

// =====================
// AuthLoadingScreen
// =====================

class AuthLoadingScreen extends StatefulWidget {
  const AuthLoadingScreen({super.key});

  @override
  State<AuthLoadingScreen> createState() => _AuthLoadingScreenState();
}

class _AuthLoadingScreenState extends State<AuthLoadingScreen> {
  bool _navigated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, _, _) => LoadingScreen(
            userName: FirebaseAuth.instance.currentUser?.displayName ?? 'User',
          ),
        ),
      );
      if (!_navigated) {
        _navigated = true;
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pushReplacementNamed(context, '/welcome');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show a loading indicator while waiting for navigation
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

// =====================
// 🧭 Navigation UI Starts
// =====================

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    HomePage(userName: FirebaseAuth.instance.currentUser!.displayName!),
    const GymkhanaPage(),
    const NotificationsPage(),
    const LNMPage(),
    MorePage()
  ];

  void _onItemTapped(int index) {
    HapticFeedback.lightImpact();
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildGlowingIcon(IconData icon, bool isActive) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: isActive
            ? [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ]
            : [],
      ),
      child: Icon(
        icon,
        color: isActive ? Colors.white : Colors.grey.shade600,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        margin: EdgeInsets.all(15.0),
        currentIndex: _selectedIndex,
        itemShape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(90)),
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade600,
        duration: const Duration(milliseconds: 400),
        curve: Curves.linear,
        items: [
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.home, _selectedIndex == 0),
            title: const Text("Home"),
            selectedColor: Colors.white,
            unselectedColor: Colors.grey.shade600,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.sports, _selectedIndex == 1),
            title: const Text("Gymkhana"),
            selectedColor: Colors.cyanAccent,
            unselectedColor: Colors.grey.shade600,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.notifications, _selectedIndex == 2),
            title: const Text("Notifications"),
            selectedColor: Colors.lightGreenAccent,
            unselectedColor: Colors.grey.shade600,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.account_balance, _selectedIndex == 3),
            title: const Text("LNMIIT"),
            selectedColor: Colors.redAccent,
            unselectedColor: Colors.grey.shade600,
          ),
          SalomonBottomBarItem(
            icon: _buildGlowingIcon(Icons.more_horiz, _selectedIndex == 4),
            title: const Text("More"),
            selectedColor: Colors.purpleAccent,
            unselectedColor: Colors.grey.shade600,
          ),
        ],
      ),
    );

  }
}

// ================= HELPER FUNCTIONS =================
// Helper method to get current user ID
Future<String?> _getCurrentUserId() async {
  final user = FirebaseAuth.instance.currentUser;
  return user?.uid;
}

// Helper method to show web notifications
void _showWebNotification(RemoteMessage message) {
  if (kIsWeb && message.notification != null) {
    if (kDebugMode) {
      print('📱 Showing web notification: ${message.notification?.title}');
    }

    // Show browser notification if permission is granted
    _showBrowserNotification(
      message.notification!.title ?? 'New Notification',
      message.notification!.body ?? '',
    );
  }
}

// Show native browser notification
void _showBrowserNotification(String title, String body) {
  // This will trigger the browser's native notification system
  // The actual display is handled by the service worker
  if (kDebugMode) {
    print('🔔 Browser notification triggered: $title');
  }
}
