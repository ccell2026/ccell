import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_page/presentation/screens/about/council.dart';
import 'package:url_launcher/url_launcher.dart';

class SportsCouncil extends StatelessWidget {
  const SportsCouncil({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             SizedBox(
                height: 140.h,
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 60.r,
                        backgroundImage: AssetImage(
                          "assets/images/sports_logo.jpg",
                        ),
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
                            color: theme.colorScheme.surface,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: theme.colorScheme.onSurface.withOpacity(0.2),
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: theme.colorScheme.onSurface,
                            size: 30.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  "The Sports Council at LNMIIT is an integral and dynamic component of the Student Gymkhana, fundamentally dedicated to invigorating the physical well-being and competitive spirit of the entire student body. It champions a culture of athleticism, perseverance, and teamwork, recognizing that excellence extends beyond the academic realm.",
                  style: GoogleFonts.inter(
                    color: theme.colorScheme.onSurface,
                    fontSize: 10.sp
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: _buildGSecTile(
                  "Mr. Arihant Bhura",
                  "General Secretary",
                  "9345275071",
                  "gsec.sports@lnmiit.ac.in",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: _buildGSecTile(
                  "Ms. Priyal Maheshwari",
                  "Associate General Secretary",
                  "7727881239",
                  "agsec.sports@lnmiit.ac.in",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: _buildGSecTile(
                  "Mr. Raghav Khandelwal",
                  "Finance Convener",
                  "8003454873",
                  "",
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                  childAspectRatio: 0.9,
                  children: [
                    squareCard(
                      "assets/images/sports/badminton/badminton_logo.jpeg",
                      "Badminton",
                      context,
                      "The Badminton Club is where ambition meets discipline — a court for those who play to win and train to dominate. Every match is a test, every session a step toward becoming unbeatable. It’s not just about playing; it’s about proving you’re better than yesterday.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/badminton/bad1.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/badminton/bad2.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/badminton/bad3.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/badminton/bad4.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/badminton/bad5.jpeg",
                      ],
                      [
                        {
                          "name": "Naman Agrawal",
                          "phone": "7877500689",
                          "email": "23ume535@lnmiit.ac.in",
                        },
                        {
                          "name": "Raman Kumar Singh",
                          "phone": "8591708702",
                          "email": "23ucs689@lnmiit.ac.in",
                        },
                        {
                          "name": "Vanshika Garg",
                          "phone": "7509004321",
                          "email": "v23ume552@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/badminton_lnmiit/",
                    ),
                    squareCard(
                      "assets/images/sports/basketball/basketball_logo.png",
                      "Basketball",
                      context,
                      "Our Basketball Club is a place for students who love the game. We practice regularly, play matches, and grow as a team. Whether you’re a beginner or experienced, everyone’s welcome to join.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/basketball/basket1.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/basketball/basket2.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/basketball/basket3.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/basketball/basket4.jpeg",
                      ],
                      [
                        {
                          "name": "Deepanshu Sharma",
                          "phone": "9509014105",
                          "email": "23ucs561@lnmiit.ac.in",
                        },
                        {
                          "name": "Hiitesh Gour",
                          "phone": "7878431617",
                          "email": "23ucs590@lnmiit.ac.in",
                        },
                        {
                          "name": "Shreyansh Agarwal",
                          "phone": "8005681982",
                          "email": "23ucs709@lnmiit.ac.in",
                        },
                        {
                          "name": "Umang Jindal",
                          "phone": "8619029605",
                          "email": "23ucs727@lnmiit.ac.in",
                        },
                      ],
                      'https://www.instagram.com/lnmiit_basketball/',
                    ),
                    squareCard(
                      "assets/images/sports/chess/chess_logo.jpg",
                      "Chess",
                      context,
                      "The Chess Club brings together students who share an interest in chess. It’s a space for strategic thinking, friendly competition, and continuous learning. Open to all skill levels, the club promotes a love for the game and a sense of community.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/chess/chess1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/chess/chess2.jpg",
                      ],
                      [
                        {
                          "name": "Akshat Pandey",
                          "phone": "8303253024",
                          "email": "23ucc512@lnmiit.ac.in",
                        },
                        {
                          "name": "Aditya Shukla",
                          "phone": "9023502669",
                          "email": "23ucc508@lnmiit.ac.in",
                        },
                        {
                          "name": "Kapil Rajpurohit ",
                          "phone": "9589454999",
                          "email": "23ucs606@lnmiit.ac.in",
                        },
                        {
                          "name": "Kriti Bhambhani",
                          "phone": "8076707955",
                          "email": "23ucs624@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/chess_lnmiit/",
                    ),
                    squareCard(
                      "assets/images/sports/cricket/cricket_logo.jpeg",
                      "Cricket",
                      context,
                      "At LNMIIT, cricket is more than just a game-its a shared passion that brings students across batches. The cricket culture here fosters not only teamwork and competitiveness but also creates a homely bond with seniors and its a place where memories are made beyond scorecard.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket1.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket2.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket3.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket4.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket5.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket6.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket7.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket8.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/cricket/cricket9.jpeg",
                      ],
                      [
                        {
                          "name": "Akshat Tyagi",
                          "phone": "7611879965",
                          "email": "23uec510@lnmiit.ac.in",
                        },
                        {
                          "name": "Parth Pandey",
                          "phone": "9023973958",
                          "email": "23ucs662@lnmiit.ac.in",
                        },
                        {
                          "name": "Vijay Kumar Bijarnia",
                          "phone": "6280833211",
                          "email": "23ume554@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/_cricket_lnmiit/",
                    ),
                    squareCard(
                      "assets/images/sports/football/football_logo.jpg",
                      "Football",
                      context,
                      "Just a bunch of football fanatics who live for the game – whether it's sweating it out on the field or supporting their favourite clubs. LNMFC is all about teamwork, passion, and having a blast while playing the sport we love. Everyone’s welcome, from casual kickers to future pros!",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/football/foot1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/football/foot2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/football/foot3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/football/foot4.jpg",
                      ],
                      [
                        {
                          "name": "Anurag Tomar",
                          "phone": "9354892101",
                          "email": "23ucs542@lnmiit.ac.in",
                        },
                        {
                          "name": "Kartikeya Swami",
                          "phone": "6350619239",
                          "email": "23ume527@lnmiit.ac.in",
                        },
                        {
                          "name": "Priyangshu Saha",
                          "phone": "8597641998",
                          "email": "23ucc587@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/football.lnmiit/",
                    ),
                    squareCard(
                      "assets/images/sports/kabaddi/kabaddi_logo.jpeg",
                      "Kabaddi",
                      context,
                      "Ready to bring the heat on the mat? LNMIIT Kabaddi is where passion meets power. With consistent podium finishes at Despo and Udghosh, we’re building legends — one tackle at a time. Join us and #LePanga! ",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/kabaddi/kabaddi1.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/kabaddi/kabaddi2.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/kabaddi/kabaddi3.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/kabaddi/kabaddi4.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/kabaddi/kabaddi5.jpeg",
                      ],
                      [
                        {
                          "name": "Arpit Singh",
                          "phone": "7988039741",
                          "email": "23ucc519@lnmiit.ac.in",
                        },
                        {
                          "name": "Bhavesh Rode",
                          "phone": "9307502610",
                          "email": "23ucc531@lnmiit.ac.in",
                        },
                        {
                          "name": "Ishan Bansal",
                          "phone": "6375492739",
                          "email": "23uec553@lnmiit.ac.in",
                        },
                        {
                          "name": "Naveen Kumawat",
                          "phone": "7569619441",
                          "email": "",
                        },
                      ],
                      "https://www.instagram.com/lnmiit_kabaddi/",
                    ),
                    squareCard(
                      "assets/images/sports/lawn_tennis/lawnt_logo.png",
                      "Lawn Tennis",
                      context,
                      "The Lawn Tennis Club welcomes everyone, whether you’re a complete beginner or an experienced player. We hold regular practice sessions, friendly matches, and competitive tournaments throughout the year. It’s a great space to improve your game, stay active, and be part of a supportive tennis community",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/lawn_tennis/lawn3.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/lawn_tennis/lawn1.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/lawn_tennis/lawn2.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/lawn_tennis/lawn4.jpeg",
                      ],
                      [
                        {
                          "name": "Aditya Vyas",
                          "phone": "9079255992",
                          "email": "23ucs519@lnmiit.ac.in",
                        },
                        {
                          "name": "Krishna Prabhav",
                          "phone": "9550725780",
                          "email": "23ucs640@lnmiit.ac.in",
                        },
                      ],
                      "",
                    ),
                    squareCard(
                      "assets/images/sports/squash/squash_logo.jpeg",
                      "Squash",
                      context,
                      "The Squash Club is a fun and energetic space for anyone who loves the game or wants to try something new. We play regularly, help each other improve, and enjoy a bit of friendly competition along the way. Whether you're just starting out or have been playing for years, you're always welcome to join us. It's all about staying active, meeting people, and having a great time on court!",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/squash/squash1.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/squash/squash2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/squash/squash3.jpg",
                      ],
                      [
                        {
                          "name": "Prasann Dewan",
                          "phone": "9116640830",
                          "email": "23ume539@lnmiit.ac.in",
                        },
                        {
                          "name": "Rohit Bondada",
                          "phone": "9618112529",
                          "email": "23ucs558@lnmiit.ac.in",
                        },
                      ],
                      "",
                    ),
                    squareCard(
                      "assets/images/sports/table_tennis/tablet_logo.png",
                      "Table Tennis",
                      context,
                      "The Table Tennis Club is a passionate and competitive group dedicated to learning and improving the sport. With a history of securing top positions in past competitions, the club proudly includes state-level players who lead by example. Members train rigorously and regularly participate in friendly matches with other colleges to gain experience and build camaraderie.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/table_tennis/tablt1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/table_tennis/tablt3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/table_tennis/tablt4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/table_tennis/tablt5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/table_tennis/tablt6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/table_tennis/tablt7.jpg",
                      ],
                      [
                        {
                          "name": "Charu Arora",
                          "phone": "",
                          "email": "23uec530@lnmiit.ac.in",
                        },
                        {
                          "name": "Pratham Kala",
                          "phone": "6376665781",
                          "email": "23ucs675@lnmiit.ac.in",
                        },
                        {
                          "name": "Soumya Jain",
                          "phone": "7877318802",
                          "email": "23ucs717@lnmiit.ac.in",
                        },
                        {"name": "Urvi Salecha", "phone": "", "email": ""},
                      ],
                      "",
                    ),
                    squareCard(
                      "assets/images/sports/volleyball/volleyball_logo.jpg",
                      "Volleyball",
                      context,
                      "The Volleyball Club at LNMIIT is a vibrant and competitive community for sports enthusiasts who are passionate about the game. As one of the institute's official sports clubs, we aim to promote physical fitness, teamwork, and sportsmanship through regular practice sessions, friendly matches, and participation in inter-college tournaments. Whether you're a beginner or an experienced player, the club welcomes everyone with a love for volleyball. Join us to bump, set, and spike your way into a spirited sports culture!",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/volleyball/volley1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/volleyball/volley2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/volleyball/volley5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/volleyball/volley6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/volleyball/volley7.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/sports/volleyball/volley9.jpg",
                      ],
                      [
                        {
                          "name": "Anisha Khandelwal",
                          "phone": "9828881138",
                          "email": "23ucs536@lnmiit.ac.in",
                        },
                        {
                          "name": "Anvesh Gupta",
                          "phone": "9045488096",
                          "email": "23ucc517@lnmiit.ac.in",
                        },
                        {
                          "name": "Priyanshi Kadian",
                          "phone": "8950016880",
                          "email": "23uec594@lnmiit.ac.in",
                        },
                        {
                          "name": "Saurav Rathi",
                          "phone": "9821723636",
                          "email": "23ucc597@lnmiit.ac.in",
                        },
                        {
                          "name": "Vishesh Jain",
                          "phone": "7742567202",
                          "email": "23ucs738@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/lnmiit.volleyball/",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget squareCard(
  String logoUrl,
  String label,
  BuildContext context,
  String description,
  List<String> galleryImages,
  List<Map<String, String>> cordies,
  String instaUrl,
) {
  final theme = Theme.of(context);
  return Material(
    elevation: 6,
    borderRadius: BorderRadius.circular(16.r),
    child: InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CouncilDetailScreen(
              imageUrl: logoUrl,
              galleryImages: galleryImages,
              cordies: cordies,
              instaUrl: instaUrl,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        width: 100.w,
        height: 100.h,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: theme.colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: theme.colorScheme.onPrimary.withOpacity(0.2), width: 2.w),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(logoUrl),
              radius: 40.r,
              backgroundColor: theme.colorScheme.onPrimary,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: theme.colorScheme.onSurface,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildGSecTile(
  String name,
  String post,
  String phoneUrl,
  String mailUrl,
) {
  return Builder(
    builder: (context) {
      final theme = Theme.of(context);
      return Container(
        margin: EdgeInsets.only(bottom: 12.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: theme.colorScheme.onSurface.withOpacity(0.2), width: 2.w),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          title: Text(
            name,
            style: GoogleFonts.inter(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          subtitle: Text(
            post,
            style: GoogleFonts.inter(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
              fontSize: 10.sp,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.phone, color: theme.colorScheme.secondary, size: 20.sp),
                onPressed: () => _launchPhone(phoneUrl),
              ),
              IconButton(
                icon: Icon(Icons.email, color: theme.colorScheme.tertiary, size: 20.sp),
                onPressed: () => _launchEmail(mailUrl),
              ),
            ],
          ),
        ),
      );
    }
  );
}

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
