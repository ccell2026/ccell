import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    const SimplePage(title: 'Gymkhana Page'),
    const SimplePage(title: 'Notifications Page'),
    const SimplePage(title: "PYQ's Page"),
    const SimplePage(title: 'More Page'),
    const AboutPage(),
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
          _pages[_selectedIndex],
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
                selectedItemColor: Colors.deepPurple,
                unselectedItemColor: Colors.grey,
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
                  BottomNavigationBarItem(
                    icon: Icon(Icons.info),
                    label: 'About',
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

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple, // match your dark theme
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Banner + Avatar
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Banner
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/y24.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Circle Avatar
                Positioned(
                  left: 16,
                  bottom: -40,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(Icons.person, size: 40),
                  ),
                ),
              ],
            ),

            SizedBox(height: 50),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "The LNM Institute of Information Technology",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 10),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("description", style: TextStyle(color: Colors.white)),
            ),

            SizedBox(height: 20),

            Coordinators(),
            SizedBox(height: 20),
            AssociateCoordi(),
          ],
        ),
      ),
    );
  }
}

class Coordinators extends StatelessWidget {
  const Coordinators({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Coordinators Y-23",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 220,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              CoordiName(name: "Aditya Kansal"),
              SizedBox(width: 8),
              CoordiName(name: "Kunal Sharma"),
              SizedBox(width: 8),
              CoordiName(name: "Neha Raniwala"),
            ],
          ),
        ),
      ],
    );
  }
}

class AssociateCoordi extends StatelessWidget {
  const AssociateCoordi({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Associate Coordinators Y-23",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 220,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              CoordiName(name: "Atharv Shah"),
              SizedBox(width: 8),
              CoordiName(name: "Laxita Sharma"),
              SizedBox(width: 8),
              CoordiName(name: "Mudit Choudhary"),
              SizedBox(width:8),
              CoordiName(name: "Rahul Sharma"),
              SizedBox(width: 8),
              CoordiName(name: "Vibha Gupta"),
              SizedBox(width: 8),
              CoordiName(name: "Yash Raj"),
            ],
          ),
        ),
      ],
    );
  }
}

class CoordiName extends StatelessWidget {
  final String name;
  const CoordiName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(18),
      ),
      width: 150,
      height: 200,
      child: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade300,
            child: Icon(Icons.person, size: 60),
          ),
          SizedBox(height: 10),
          Text(name, style: TextStyle(color: Colors.black, fontSize: 16)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  () => {};
                },
                child: Image.asset('assets/phone_icon.png', width: 30),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  () => {};
                },
                child: Image.asset('assets/gmail.png', width: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
