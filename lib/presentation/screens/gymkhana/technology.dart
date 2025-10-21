import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_page/presentation/screens/about/council.dart';
import 'package:url_launcher/url_launcher.dart';

class TechnologyCouncil extends StatelessWidget {
  const TechnologyCouncil({super.key});

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
                          "assets/images/tech_logo.jpg",
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
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Text(
                  "The LNMIIT Student Science and Technology Council is meticulously designed to foster and promote a vibrant culture of scientific inquiry, technological innovation, and hands-on technical skill development among the student community. It acts as a central hub, orchestrating and amplifying the efforts of various student technical clubs and activities. Beyond mere coordination, the Council actively cultivates an environment ripe for intellectual curiosity and practical application, empowering students to translate theoretical knowledge into tangible solutions.",
                  style: GoogleFonts.inter(
                    color: theme.colorScheme.onSurface,
                    fontSize: 9.sp
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: _buildGSecTile(
                  "Mr. Tushar Agrawal",
                  "General Secretary",
                  "6306263607",
                  "gsec.science@lnmiit.ac.in",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: _buildGSecTile(
                  "Ms. Anmol Adwani",
                  "Associate General Secretary",
                  "9039839018",
                  "agsec.science@lnmiit.ac.in",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: _buildGSecTile(
                  "Mr. Devashish Tripathi",
                  "Finance Convener",
                  "9473548085",
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
                      "assets/images/tech/astronomy/astro_logo.jpg",
                      "Astronomy",
                      context,
                      "The Astronomy Club fuels student passion for the wonders of astronomy and space exploration, sparking curiosity about the universe’s endless mysteries. As one of LNMIIT’s most active clubs, we bring together creative and enthusiastic minds to host thrilling, high-energy events that captivate everyone. From stargazing nights to cosmic quizzes, our year-round activities keep the excitement alive—because college life isn’t just about academics, it’s about unforgettable experiences too!",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/astronomy/astro1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/astronomy/astro2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/astronomy/astro3.JPG",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/astronomy/astro4.JPG",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/astronomy/astro5.jpg",
                      ],
                      [
                        {
                          "name": "Mudit Choudhary",
                          "phone": "9672467580",
                          "email": "23ucc623@lnmiit.ac.in",
                        },
                        {
                          "name": "Sirjan Singh",
                          "phone": "6239709755",
                          "email": "23ucs715@lnmiit.ac.in",
                        },
                        {
                          "name": "Sunidhi Avasthi",
                          "phone": "9829756507",
                          "email": "23ume547@lnmiit.ac.in ",
                        },
                        {
                          "name": "Vibhu Bharadwaj",
                          "phone": "9079660589",
                          "email": "23uec643@lnmiit.ac.in",
                        },
                      ],
                      'https://www.instagram.com/astronomylnmiit?igsh=MXEwemh4cjYwNzcxbQ==',
                    ),
                    squareCard(
                      "assets/images/tech/cipherclub/cipher_logo.png",
                      "Cipher",
                      context,
                      "With the mission to empower and educate, CIPHER is the Cybersecurity and Blockchain club focused on fostering awareness, innovation, and a strong technical culture. It provides a space for students to explore digital security and decentralized technologies, grow through collaboration, and engage with two of the most impactful domains shaping the future.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cipherclub/cipher1.jpeg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cipherclub/cipher2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cipherclub/cipher3.jpeg",
                      ],
                      [
                        {
                          "name": "Lakshya Jain",
                          "phone": "7568245339",
                          "email": "23ucs633@lnmiit.ac.in",
                        },
                        {
                          "name": "Amartya Vikram Singh",
                          "phone": "6268818288",
                          "email": "23ume513@lnmiit.ac.in",
                        },
                        {
                          "name": "Siddhartha Swarnkar",
                          "phone": "9831224418",
                          "email": "23dcs510@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/cipher.lnmiit/",
                    ),
                    squareCard(
                      "assets/images/tech/cybros/cybros_logo.jpg",
                      "Cybros",
                      context,
                      "Cybros is a competitive programming club dedicated to fostering a strong coding culture within the college. We promote algorithmic thinking, conduct regular contests, and help students build problem-solving skills through consistent practice and collaboration.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/cybros/cybros7.jpg",
                      ],
                      [
                        {
                          "name": "Naman Jain",
                          "phone": "8890061881",
                          "email": "22ucs133@lnmiit.ac.in",
                        },
                        {
                          "name": "Romit Sovakar",
                          "phone": "8436915546",
                          "email": "22ucs168@lnmiit.ac.in",
                        },
                      ],
                      'https://www.instagram.com/cybros_lnmiit/',
                    ),
                    squareCard(
                      "assets/images/tech/debsoc/debsoc_logo.jpg",
                      "Debsoc",
                      context,
                      "Lord Byron once said, “Those who will not reason are bigots, those who cannot are fools, and those who dare not are slaves.” At LNMIIT, we believe true growth comes from questioning, debating, and refining your voice. Enter The Debate Society (DebSoc)—where ideas clash, minds sharpen, and words become power. From fiery MUNs and parliamentary debates to gripping extempores, we cultivate rational thinkers and fearless speakers. Whether you're a seasoned orator or a curious beginner, DebSoc shapes you into a master of persuasion—one argument at a time. Because in a world of noise, the strongest voice wins.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/debsoc/deb1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/debsoc/deb2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/debsoc/deb3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/debsoc/deb4.jpg"
                      ],
                      [
                        {
                          "name": "Adarsh Dwivedi",
                          "phone": "9305597756",
                          "email": "23ucs509@lnmiit.ac.in"
                        },
                        {
                          "name": "Sukanya Singh Kirad",
                          "phone": "9522580431",
                          "email": "23uec629@lnmiit.ac.in"
                        },
                        {
                          "name": "Ujjawal Khatri",
                          "phone": "9660546607",
                          "email": "23uec635@lnmiit.ac.in"
                        }
                      ],
                      'https://www.instagram.com/thedebatesocietylnmiit/',
                    ),
                    squareCard(
                      "assets/images/tech/ecell/ecell_logo.jpg",
                      "E Cell",
                      context,
                      "Dive into entrepreneurship, crypto, stocks, Web3, and beyond with The Entrepreneurship Club—your hub for mastering the skills that shape tomorrow. From event planning and marketing to management, sponsorships, content creation, and design, we sharpen the tools you need to thrive. We collaborate with top tech colleges across India, bringing you real-world exposure through funding events, startup founder interactions, and deep dives into the startup ecosystem. Here, ideas meet execution—and learners become leaders.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/22fb5cfe2d93314c1d13b56ced87da6cdcec5fe4/assets/images/tech/ecell/ecell1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/22fb5cfe2d93314c1d13b56ced87da6cdcec5fe4/assets/images/tech/ecell/ecell2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/22fb5cfe2d93314c1d13b56ced87da6cdcec5fe4/assets/images/tech/ecell/ecell3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/22fb5cfe2d93314c1d13b56ced87da6cdcec5fe4/assets/images/tech/ecell/ecell4.jpg",
                      ],
                      [
                        {
                          "name": "Jimit Thakrar",
                          "phone": "8780579193",
                          "email": "23uec557@lnmiit.ac.in",
                        },
                        {
                          "name": "Shiviansh Yadav",
                          "phone": "9264930636",
                          "email": "23uec623@lnmiit.ac.in",
                        },
                        {
                          "name": "Sakasham Mewada",
                          "phone": "7597024466",
                          "email": "23ume543@lnmiit.ac.in",
                        },
                        {
                          "name": "Satyam Shukla",
                          "phone": "7984786107",
                          "email": "23ucs753@lnmiit.ac.in",
                        },
                      ],
                      ' https://www.instagram.com/ecell.lnmiit?igsh=NTRsOWF6Y3ZwODJx',
                    ),
                    squareCard(
                      "assets/images/tech/phoenix/phoenix_logo.png",
                      "Phoenix",
                      context,
                      "Phoenix , The Robotics club of LNMIIT Jaipur is a vibrant community of tech enthusiasts committed to hands-on innovation, collaborative problem-solving, and excellence in robotics. We actively design, build, and program intelligent systems while proudly representing our institution in prestigious nationwide competitions, fostering both technical expertise and a spirit of innovation.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix7.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix8.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/phoenix/phoenix9.jpg",
                      ],
                      [
                        {
                          "name": "Akshat Mehta",
                          "phone": "9521593891",
                          "email": "23ucs525@lnmiit.ac.in",
                        },
                        {
                          "name": "Dhruv Gupta",
                          "phone": "8005681519",
                          "email": "23ume519@lnmiit.ac.in",
                        },
                        {
                          "name": "Utkarsh Kumar",
                          "phone": "8840566896",
                          "email": "23uec637@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/phoenix.lnmiit/",
                    ),
                    squareCard(
                      "assets/images/tech/quizzinga/quizzinga_logo.jpg",
                      "Quizzinga",
                      context,
                      "We are Quizzinga, The official quizzing club of LNMIIT. Some consider us a cult of nerds (may or may not be true), while others call us a buzzing hivemind of trivia enthusiasts. If you like trivia nights, auctions or winning big prizes, Quizzinga might just be your turf. \nVENI VIDI VICI!!!",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga7.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga8.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/tech/quizzinga/quizzinga9.jpg",
                      ],
                      [
                        {
                          "name": "Akshit Bansal",
                          "phone": "8604944254",
                          "email": "23ucs529@lnmiit.ac.in",
                        },
                        {
                          "name": "Shubh Shresth",
                          "phone": "8887922448",
                          "email": "23ucs746@lnmiit.ac.in",
                        },
                        {
                          "name": "Toshit P. Kumar",
                          "phone": "8107733891",
                          "email": "23uec632@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/quizzingalnm/",
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
            border: Border.all(color: theme.colorScheme.onSurface.withOpacity(0.2), width: 2.w),
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
}
