import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/cosha.dart';
import 'package:login_page/cultural.dart';
import 'package:login_page/fest_card.dart';
import 'package:login_page/sports.dart';
import 'package:login_page/technology.dart';
import 'package:url_launcher/url_launcher.dart';

class GymkhanaPage extends StatelessWidget {
  const GymkhanaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001219),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Container(
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF353F54), Color(0xFF222834)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.account_balance_rounded,
                        color: Colors.white,
                        size: 32.r,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'STUDENT GYMKHANA',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w800,
                        //letterSpacing: -1,
                        height: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              presidentTile(
                "Mr. Vaibhav Khamesra",
                "President",
                "7023659757",
                "gym.president@lnmiit.ac.in",
              ),
              presidentTile(
                "Mr. Chirag Mehta",
                "Vice-President",
                "",
                "gym.vicepresident@lnmiit.ac.in",
              ),
              presidentTile(
                "Mr. Jalaj Rastogi",
                "Finance Convener",
                "8077054850",
                "gym.financeconvenor@lnmiit.ac.in",
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Container(
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF353F54), Color(0xFF222834)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.groups_rounded,
                        color: Colors.white,
                        size: 32.r,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Text(
                      'PRESIDENTIAL COUNCIL',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 0.75,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  squareCard(
                    "Cultural Council",
                    'assets/images/ccell_logo.png',
                    context,
                    const CulturalCouncil(),
                  ),
                  squareCard(
                    "Science & Technology Council",
                    'assets/images/tech_logo.jpg',
                    context,
                    const TechnologyCouncil(),
                  ),
                  squareCard(
                    "Sports Council",
                    'assets/images/sports_logo.jpg',
                    context,
                    const SportsCouncil(),
                  ),
                  squareCard(
                    "COSHA Committee",
                    "assets/images/cosha_logo.jpg",
                    context,
                    COSHAScreen(),
                  ),
                ],
              ),
              SizedBox(height: 35.h),
              Text(
                'STUDENT FESTS',
                style: GoogleFonts.poppins(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.h),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  squareCard(
                    "Desportivos",
                    "assets/images/despo/despo_logo.jpeg",
                    context,
                    const StudentEventScreen(
                      imageUrl: "assets/images/despo/despo_logo.jpeg",
                      description:
                          "Desportivos is the flagship annual sports festival of LNMIIT, proudly hosted by the Sports Council. Recognized as one of the largest collegiate sports fests in Rajasthan, it brings together student-athletes to compete, connect, and celebrate the spirit of the game.\nThis three-day mega event unites more than just teams—it fosters a shared culture of sportsmanship, discipline, and unity. With a diverse lineup of indoor and outdoor sports, including cricket, football, basketball, volleyball, badminton, table tennis, chess, carrom, and more, Desportivos offers a thrilling arena for both competitive glory and personal growth.\nWhat sets Desportivos apart is the unmatched energy on and off the field—where every match is met with roaring crowds, intense rivalries, and moments that become campus legends. It’s a space where adrenaline, ambition, and athleticism converge to create memories that last far beyond the final whistle.\nBehind the seamless execution is a dedicated student organizing team that ensures everything runs like clockwork—from fixtures to fair play.",
                      festHeads: [
                        {
                          "name": "Chetan Sharma",
                          "phone": "9761194540",
                          "email": "22uec033@lnmiit.ac.in",
                        },
                        {
                          "name": "Sanchay Goel",
                          "phone": "9997479600",
                          "email": "22ucs180@lnmiit.ac.in",
                        },
                      ],
                      galleryImages: [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/despo/despo1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/despo/despo2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/despo/despo3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/despo/despo4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/despo/despo5.jpg",
                      ],
                      instaUrl: 'https://www.instagram.com/desportivos.lnmiit/',
                      emailUrl: "desportivos@lnmiit.ac.in",
                      youtubeUrl:
                          "https://www.youtube.com/@desportivoslnmiit2733",
                      linkedinUrl:
                          "https://www.linkedin.com/in/desportivos-the-lnmiit-jaipur-ab9184250/?originalSubdomain=in",
                      facebookUrl:
                          "https://www.facebook.com/Desportivos.LNMIIT/",
                      xUrl: "https://x.com/desportivoslnm",
                      label: "",
                    ),
                  ),
                  squareCard(
                    "Plinth",
                    "assets/images/plinth/plinth_logo.jpg",
                    context,
                    const StudentEventScreen(
                      imageUrl: "assets/images/plinth/plinth_logo.jpg",
                      description:
                          "Plinth is the annual techno-management fest of LNMIIT Jaipur, turning the campus into a vibrant hub of innovation, competition, and intellectual exploration.Plinth attracts students, creators, and tech enthusiasts from across the country who come together to push the boundaries of what’s possible.\nPlinth embraces the cutting edge of technology, diving deep into areas like robotics, artificial intelligence, cybersecurity, and beyond. The renowned Talk Series features distinguished personalities from the world of tech who share groundbreaking ideas, industry insights, and bold visions for the future. Alongside these, Plinth offers immersive workshops, startup showcases, strategic management contests, and even literary events—ensuring that there's something for every curious mind.\nDriven by LNMIIT’s dynamic student community, Plinth 2025 creates an atmosphere where innovation thrives, collaboration flourishes, and passion for technology takes center stage. As a space where you don’t just witness the future—you build it—Plinth invites you to code, create, and celebrate in an unforgettable three-day experience.",
                      festHeads: [
                        {
                          "name": "Rajat Sharma",
                          "phone": "8972192855",
                          "email": "22uec106@lnmiit.ac.in",
                        },
                        {
                          "name": "Yug Agarwal",
                          "phone": "8299099721",
                          "email": "22ucs233@lnmiit.ac.in",
                        },
                      ],
                      galleryImages: [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/plinth/plinth3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/plinth/plinth4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/plinth/plinth5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/plinth/plinth1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/plinth/plinth2.jpg",
                      ],
                      instaUrl: 'https://www.instagram.com/plinth.lnmiit/',
                      emailUrl: "plinth@lnmiit.ac.in",
                      youtubeUrl: "http://www.youtube.com/@PlinthLNMIITJaipur",
                      linkedinUrl: "",
                      facebookUrl: "https://www.facebook.com/Plinth.LNMIIT/",
                      xUrl: "https://x.com/plinthlnmiit",
                      label: "",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              squareCard(
                "Vivacity",
                'assets/images/viva/viva_logo.png',
                context,
                const StudentEventScreen(
                  imageUrl: "assets/images/viva/viva_logo.png",
                  description:
                      "Since its inception in 2007, Vivacity has grown into a phenomenon that transcends the definition of a college fest. It’s not just an event—it’s an electrifying celebration of youth, creativity, and cultural spirit that brings the entire campus to life.\nAcross three unforgettable days, Vivacity transforms LNMIIT into a stage where dancers, musicians, artists, dramatists, fashionistas, and performers converge to showcase their brilliance. \nThe fest thrives on its diverse line-up: from street plays and band battles to open mics, poetry slams, and ramp walks, every corner of campus echoes with excitement. \nSpearheaded by an incredibly passionate student team, Vivacity continues to set new benchmarks every year. What makes it unforgettable is not just the scale—but the soul behind it.",
                  festHeads: [
                    {
                      "name": "Ayush Dhanesha",
                      "phone": "9998523792",
                      "email": "22ucs065@lnmiit.ac.in",
                    },
                    {
                      "name": "Shubhanshu Singhal",
                      "phone": "8949024851",
                      "email": "22ucc101@lnmiit.ac.in",
                    },
                  ],
                  galleryImages: [
                    "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/viva/viva1.jpg",
                    "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/viva/viva2.jpg",
                    "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/viva/viva3.jpg",
                    "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/viva/viva4.jpg",
                    "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/viva/viva5.jpg",
                  ],
                  instaUrl: 'https://www.instagram.com/vivacity_lnmiit/',
                  emailUrl: "vivacity@lnmiit.ac.in",
                  youtubeUrl: "https://www.youtube.com/@VivacityLNMIIT",
                  linkedinUrl:
                      "https://www.linkedin.com/company/vivacity-lnmiit/?originalSubdomain=in",
                  facebookUrl: "",
                  xUrl: "",
                  label: "",
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                'STUDENT EVENTS',
                style: GoogleFonts.poppins(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.h),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  squareCard(
                    "TEDX LNMIIT",
                    'assets/images/ted_logo.jpg',
                    context,
                    const StudentEventScreen(
                      imageUrl: "assets/images/ted_logo.jpg",
                      description:
                          "TEDxLNMIIT brings the global spirit of TED’s “ideas worth spreading” right to the heart of our campus—fostering a culture of curiosity, creativity, and bold thinking. Independently organized but deeply rooted in TED’s global vision, TEDxLNMIIT is where powerful voices and transformative ideas come alive.\nSpanning fields like technology, science, art, and education, TEDxLNMIIT welcomes speakers from diverse walks of life to ignite dialogue, question conventions, and provoke thought. Every edition centers around a unifying theme that encourages the community to look deeper, think differently, and reimagine the familiar.\nIt’s more than a stage—it’s a movement within the institute that empowers individuals to share ideas that matter. Through powerful talks and meaningful conversations, TEDxLNMIIT sparks a ripple of innovation and introspection, leaving lasting impressions on everyone who attends.",
                      festHeads: [
                        {
                          "name": "Abdul Hadi Siddiqui",
                          "phone": "8107210700",
                          "email": "23ucs503@lnmiit.ac.in",
                        },
                        {
                          "name": "Anshika Agrawal",
                          "phone": "8826256810",
                          "email": "23ucc516@lnmiit.ac.in",
                        },
                        {
                          "name": "Parv Khandelwal",
                          "phone": "8306595368",
                          "email": "23uec588@lnmiit.ac.in",
                        },
                        {
                          "name": "Vihaan Malik",
                          "phone": "8445893879",
                          "email": "23ume553@lnmiit.ac.in",
                        },
                      ],
                      galleryImages: [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/ted/ted1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/ted/ted2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/ted/ted3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/ted/ted4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/ted/ted5.jpg",
                      ],
                      instaUrl: 'https://www.instagram.com/tedxlnmiit/',
                      emailUrl: "",
                      youtubeUrl: "http://www.youtube.com/@TEDxLNMIIT",
                      linkedinUrl: "",
                      facebookUrl: "https://www.facebook.com/TEDxLNMIIT/",
                      xUrl: "",
                      label: "TEDX LNMIIT",
                    ),
                  ),
                  squareCard(
                    "E-Summit",
                    'assets/images/esummit_logo.jpg',
                    context,
                    const StudentEventScreen(
                      imageUrl: "assets/images/esummit_logo.jpg",
                      description:
                          "E-Summit is LNMIIT Jaipur’s flagship celebration of entrepreneurship, innovation, and enterprise, bringing together some of the brightest young minds from across India. Designed to empower the next generation of changemakers, the summit sparks powerful conversations between budding entrepreneurs, venture capitalists, founders, and industry veterans.\nMore than just a startup conclave, E-Summit is a launchpad where ideas evolve into ventures, and raw potential meets expert mentorship. At the heart of E-Summit lies a mission to nurture entrepreneurial talent within the student community and inspire participants to tackle real-world problems through innovation. With top institutes and emerging startups in attendance, the event offers unmatched networking opportunities, bridging the academic, corporate, and startup ecosystems./nWhether you're a founder in the making, a problem-solver with an idea, or someone curious about the startup world, E-Summit  promises a platform to learn, connect, and lead. ",
                      festHeads: [],
                      galleryImages: [],
                      instaUrl: '',
                      emailUrl: "",
                      youtubeUrl: "",
                      linkedinUrl: "",
                      facebookUrl: "",
                      xUrl: "",
                      label: "E-Summit",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget squareCard(
  String label,
  String imageUrl,
  BuildContext context,
  Widget targetScreen,
) {
  ImageProvider imageProvider;
  try {
    imageProvider = AssetImage(imageUrl);
  } catch (e) {
    imageProvider = const AssetImage('assets/images/ccell_logo.png');
  }

  return Material(
    elevation: 6,
    borderRadius: BorderRadius.circular(16.r),
    child: InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => targetScreen),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF353F54), Color(0xFF222834)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 2.w),
        ),
        width: 157.w,
        height: 157.h,
        padding: EdgeInsets.all(8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: imageProvider,
              radius: 40.r,
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
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

Widget buildSectionTitle(String title) {
  return Container(
    height: 60.h,
    width: 380.w,
    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF353F54), Color(0xFF222834)],
      ),
      boxShadow: [
        const BoxShadow(
          color: Color.fromARGB(255, 198, 196, 196),
          offset: Offset(-0.5, -0.5),
          blurRadius: 1,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.7),
          blurRadius: 12,
          offset: const Offset(6, 6),
        ),
      ],
    ),
    child: Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 19.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget presidentTile(
  String name,
  String post,
  String phoneUrl,
  String mailUrl,
) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFF1C2834),
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: Colors.white.withOpacity(0.2), width: 2.w),
    ),
    margin: EdgeInsets.only(bottom: 12.h),
    child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      title: Text(
        name,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 13.5.sp,
        ),
      ),
      subtitle: Text(
        post,
        style: GoogleFonts.inter(color: Colors.grey[400], fontSize: 10.sp),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.greenAccent),
            onPressed: () => _launchPhone(phoneUrl),
          ),
          IconButton(
            icon: const Icon(Icons.email, color: Colors.lightBlueAccent),
            onPressed: () => _launchEmail(mailUrl),
          ),
        ],
      ),
    ),
  );
}

// Launchers
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

Widget _buildHeroSection() {
  return Container(
    padding: EdgeInsets.all(15.h),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF353F54), Color(0xFF222834)],
      ),
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF3B82F6).withOpacity(0.3),
          blurRadius: 20,
          spreadRadius: 0,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      children: [
        const SizedBox(height: 24),
        // Text(
        //   "The Students' Gymkhana is the official student-governing body of The LNMIIT, Jaipur, dedicated to representing and advancing the interests of the student community.",
        //   style: GoogleFonts.inter(
        //     color: Colors.white.withOpacity(0.9),
        //     fontSize: 12,
        //     //height: 1.6,
        //     //fontWeight: FontWeight.w400,
        //   ),
        //   textAlign: TextAlign.center,
        // ),
      ],
    ),
  );
}
