import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'gymkhana.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const SimplePage(title: 'Home Page'),
    const GymkhanaPage(), // Actual Gymkhana page
    const SimplePage(title: 'Notifications Page'),
    const SimplePage(title: "PYQ's Page"),
    const SimplePage(title: 'More Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Smooth fade animation when switching tabs
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _pages[_selectedIndex],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: const Border(
                  top: BorderSide(color: Colors.grey, width: 0.5),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: BottomNavigationBar(
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  type: BottomNavigationBarType.fixed,
  backgroundColor: Colors.black, // black nav bar like your image
  selectedItemColor: Colors.white, // white selected icon
  unselectedItemColor: Colors.grey, // grey unselected
  showUnselectedLabels: true,
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Gymkhana',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notifications',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: "PYQ's",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.more_horiz),
      label: 'More',
    ),
  ],
),

            ),
          ),
        ],
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;
  const SimplePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
