import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_page/council.dart';
import 'package:url_launcher/url_launcher.dart';

class CulturalCouncil extends StatelessWidget {
  const CulturalCouncil({super.key});

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
                          "assets/images/cult_logo.jpeg",
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
                padding: EdgeInsets.symmetric(horizontal:  10.w),
                child: Text(
                  "The Cultural Council at LNMIIT stands as a vibrant cornerstone of the Student Gymkhana, dedicated to nurturing and showcasing the rich tapestry of arts and traditions within the student community...",
                  style: GoogleFonts.inter(
                    color: theme.colorScheme.onSurface,
                    fontSize: 10.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: _buildGSecTile(
                  "Mr. Kanishq Singhal",
                  "General Secretary",
                  "8005644538",
                  "gsec.cultural@lnmiit.ac.in ",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:  10.w),
                child: _buildGSecTile(
                  "Ms. Ishita Khandelwal",
                  "Associate General Secretary",
                  "7597252005",
                  "agsec.cultural@lnmiit.ac.in",
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: _buildGSecTile(
                  "Mr. Tanmay Jain",
                  "Finance Convener",
                  "9039951710",
                  "",
                ),
              ),
              SizedBox(height: 10.h,),
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
                      "assets/images/cultural/aaveg/aaveg_logo.png",
                      "AAVEG",
                      context,
                      "Aaveg is the Nukkad Natak (street play) club of our college, dedicated to creating social awareness through powerful performances. With a team of 20–25 members, we bring important societal issues to life through impactful street plays.We perform not only at various inter-college events but also in public with flashmobs at crowded places",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/aaveg/aaeg4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/aaveg/aaveg1.JPG",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/aaveg/aaveg2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/aaveg/aaveg4.JPG",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/aaveg/aaveg5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/aaveg/aaveg6.JPG",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/aaveg/aaveg7.jpg",
                      ],
                      [
                        {
                          "name": "Hitesh Shee",
                          "phone": "9311546859",
                          "email": "23ucs594@lnmiit.ac.in",
                        },
                        {
                          "name": "Prachi Saxena",
                          "phone": "8690497223",
                          "email": "23ucc581@lnmiit.ac.in",
                        },
                        {
                          "name": "Shaurya Agarwal",
                          "phone": "7827347353",
                          "email": "23ucs703@lnmiit.ac.in",
                        },
                        {
                          "name": "Shravan Goyal",
                          "phone": "9528133169",
                          "email": "23ucs708@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/aaveg_lnmiit/",
                    ),
                    squareCard(
                      "assets/images/cultural/capriccio/capriccio_logo.jpg",
                      "Capriccio",
                      context,
                      "Step into a world where melodies speak, rhythms connect, and music becomes a way of life. At Capriccio, we’re a tight-knit crew of singers, instrumentalists, and producers who vibe, jam, and grow together. With every session, we create memories, share knowledge, and build bonds that last far beyond college. It’s more than music—it’s family!",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/capriccio/cap1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/capriccio/cap2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/capriccio/cap3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/capriccio/cap4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/capriccio/cap5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/capriccio/cap6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/capriccio/cap7.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/capriccio/cap8.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/capriccio/cap9.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/capriccio/cap10.jpg",
                      ],
                      [
                        {
                          "name": "Atharva Chhaparwal",
                          "phone": "9352129177",
                          "email": "23ucs550@lnmiit.ac.in",
                        },
                        {
                          "name": "Ayush Verma",
                          "phone": "9654524461",
                          "email": "23ucs552@lnmiit.ac.in",
                        },
                        {
                          "name": "Shyamsundar Paramasivam",
                          "phone": "8015610714",
                          "email": "23ucs712@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/capriccio.lnmiit/",
                    ),
                    squareCard(
                      "assets/images/cultural/eminence/eminence_logo.jpg",
                      "Eminence",
                      context,
                      "Eminence is a fashion-forward club where style meets passion. From choreographed ramp walks to fashion-themed events, we explore all aspects of fashion. Our club is a space for aspiring models, stylists, and fashion enthusiasts to grow and shine. We believe fashion is not just about clothes — it’s about attitude and identity.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/eminence/emin1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/eminence/emin2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/eminence/emin3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/eminence/emin4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/eminence/emin5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/eminence/emin6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/eminence/emin7.jpg",
                      ],
                      [
                        {
                          "name": "Gagan Gaur",
                          "phone": "7689990636",
                          "email": "23uec538@lnmiit.ac.in",
                        },
                        {
                          "name": "Manasvi Methi",
                          "phone": "8852075880",
                          "email": "23uec568@lnmiit.ac.in",
                        },
                        {
                          "name": "Shivam Agarwal",
                          "phone": "9386292461",
                          "email": "23uec621@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/eminence.lnmiit/",
                    ),
                    squareCard(
                      "assets/images/cultural/fundoo/fundoo_logo.jpg",
                      "Fundoo",
                      context,
                      "FUNDOO : Cultivating a Home Away from Home. From sparkling Diwali nights to the craziest Holi bashes, the events of the Fundoo club are more than just spectacles. They are immersive experiences, inviting you to dance, laugh, and savor the rich palette of world cultures",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/fundoo/fundoo1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/fundoo/fundoo3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/fundoo/fundoo4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/fundoo/fundoo6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/fundoo/fundoo7.jpg",
                      ],
                      [
                        {
                          "name": "Ansh Dubey",
                          "phone": "9555078768",
                          "email": "23uec517@lnmiit.ac.in",
                        },
                        {
                          "name": "Sanvi Mittal",
                          "phone": "7428261097",
                          "email": "23uec614@lnmiit.ac.in",
                        },
                        {
                          "name": "Satvik Gupta",
                          "phone": "7727001785",
                          "email": "23ucs698@lnmiit.ac.in",
                        },
                        {
                          "name": "Yuvika Gupta",
                          "phone": "9216746454",
                          "email": "23ume560@lnmiit.ac.in",
                        },
                      ],
                      'https://www.instagram.com/fundoo.lnmiit/',
                    ),
                    squareCard(
                      "assets/images/cultural/imagination/imagi_logo.jpg",
                      "Imagination",
                      context,
                      "IMAGINATION is the creative photography and cinematography club of The LNM Institute of Information Technology. It is a vibrant community of passionate individuals who explore the world through lenses, pixels, and ideas — turning vision into impactful visuals.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/imagination/imagi1.png",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/imagination/imagi3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/imagination/imagi5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/imagination/imagi8.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/imagination/imagi10.jpg",
                      ],
                      [
                        {
                          "name": "Dhairya Chhabra",
                          "phone": "9560149823",
                          "email": "23ucs564@lnmiit.ac.in",
                        },
                        {
                          "name": "Kartikeya Singh Gaur",
                          "phone": "9026178103",
                          "email": "23ucs612@lnmiit.ac.in",
                        },
                        {
                          "name": "Kriti Jindal",
                          "phone": "7973049747",
                          "email": "23ucs623@lnmiit.ac.in",
                        },
                        {
                          "name": "Prasoon Agrawal",
                          "phone": "9413922975",
                          "email": "23ume540@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/imagination.lnmiit/",
                    ),
                    squareCard(
                      "assets/images/cultural/insignia/insignia_logo.jpg",
                      "Insignia",
                      context,
                      "INSIGNIA, the official dance club of LNMIIT, is a powerhouse of passion, rhythm, and relentless dedication. We pour our heart and soul into every move, crafting performances that leave a mark. Winning doesn't matter—shining is.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/insignia/insignia1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/insignia/insignia2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/insignia/insignia3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/insignia/insignia4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/insignia/insignia5.jpg",
                      ],
                      [
                        {
                          "name": "Harita Paliwal",
                          "phone": "7239947589",
                          "email": "23ucs584@lnmiit.ac.in",
                        },
                        {
                          "name": "Khushi Tyagi",
                          "phone": "9289869124",
                          "email": "23ucs618@lnmiit.ac.in",
                        },
                        {
                          "name": "Pratham Gupta",
                          "phone": "7088992992",
                          "email": "23ucs674@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/insignia_lnm/",
                    ),
                    squareCard(
                      "assets/images/cultural/lc/lc_logo.jpg",
                      "Literary Committee",
                      context,
                      "Putting the CULT in culture, the Literary Committee is a mosh pit fueled by caffeine-riddled fanatics who walk on walls and drink up aquariums. An isle of those who romanticize Sisyphean suffering while thinking of nostalgia as the closest thing to a home. The Literary Committee does it all—with flair and a touch of melancholy.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/lc/lc1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/lc/lc2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/lc/lc3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/lc/lc4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/lc/lc5.jpg",
                      ],
                      [
                        {
                          "name": "Atharv Shah",
                          "phone": "9315394135",
                          "email": "23ucc525@lnmiit.ac.in",
                        },
                        {
                          "name": "Alakshendra Bhardwaj",
                          "phone": "8299433225",
                          "email": "23ucc622@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/literary_lnmiit/",
                    ),
                    squareCard(
                      "assets/images/cultural/mediacell/media_logo.jpg",
                      "Media Cell",
                      context,
                      "Media Cell isn’t just a club—it’s a platform for expression. Rooted in the idea of “media” as a medium, it offers students a space to build confidence, stage presence, and spontaneous speaking skills through interactive events. From anchoring major college fests to hosting formats like Doulogue and Knockout Ads, it ensures every voice is heard. At its core, Media Cell turns communication into connection—and gives every voice its medium",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/mediacell/media1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/mediacell/media2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/mediacell/media3.jpg",
                      ],
                      [
                        {
                          "name": "Abdul Hadi Siddiqui",
                          "phone": "8107210700",
                          "email": "23ucs503@lnmiit.ac.in",
                        },
                        {
                          "name": "Anshika Agrawal",
                          "phone": "8826256810",
                          "email": "23ucs538@lnmiit.ac.in",
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
                      "https://www.instagram.com/mediacell_lnmiit/",
                    ),
                    squareCard(
                      "assets/images/cultural/rendition/rendition_logo.png",
                      "Rendition",
                      context,
                      "Rendition is the theatre club of LNMIIT, where stories come alive on stage. From expressive mime performances and powerful monoacts to engaging stage plays, the club celebrates the art of acting in all its forms. We believe in the magic of live performance and the ability of theatre to connect, inspire, and transform. Whether through silent gestures or commanding dialogues, Rendition gives voice to creativity and passion.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/rendition/rendition1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/rendition/rendition2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/rendition/rendition3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/rendition/rendition4.jpg",
                      ],
                      [
                        {
                          "name": "Devansh Pareek",
                          "phone": "7677333444",
                          "email": "23ume518@lnmiit.ac.in",
                        },
                        {
                          "name": "Harshita Devnani",
                          "phone": "9351023881",
                          "email": "23ucc546@lnmiit.ac.in",
                        },
                        {
                          "name": "Rahul Sharma",
                          "phone": "9899007236",
                          "email": "23ucs686@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/rendition_lnmiit/",
                    ),
                    squareCard(
                      "assets/images/cultural/sankalp/sankalp_logo.jpg",
                      "Sankalp",
                      context,
                      "Sankalp is the social club of our college, driven by the spirit of service and compassion. We work to educate underprivileged children in nearby villages, uplift mess workers through literacy programs, and lead initiatives like cloth distribution. At Sankalp, we believe in turning intentions into actions and building a better tomorrow—one life at a time.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/sankalp/sankalp1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/sankalp/sankalp2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/sankalp/sankalp3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/sankalp/sankalp5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/sankalp/sankalp6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/sankalp/sankalp8.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/sankalp/sankalp9.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/sankalp/sankalp10.jpg",
                      ],
                      [
                        {
                          "name": "Anshika Agarwal",
                          "phone": "9462568459",
                          "email": "23ucs538@lnmiit.ac.in",
                        },
                        {
                          "name": "Garvit Jain",
                          "phone": "9518824626",
                          "email": "23ucs578@lnmiit.ac.in",
                        },
                        {
                          "name": "Kushagra Garg",
                          "phone": "9588519915",
                          "email": "23ucc564@lnmiit.ac.in",
                        },
                        {
                          "name": "Paramveer Singh",
                          "phone": "8948000075",
                          "email": "23ucs743@lnmiit.ac.in",
                        },
                        {
                          "name": "Rithvik Bansal",
                          "phone": "9510040865",
                          "email": "23dcs508@lnmiit.ac.in",
                        },
                      ],
                      "https://www.instagram.com/sankalp.lnmiit/",
                    ),
                    squareCard(
                      "assets/images/cultural/vignette/vignette_logo.jpg",
                      "Vignette",
                      context,
                      "Vignette - the Art and Craft Club of LNMIIT, is the creative heart of the campus. It's vibrant artworks bring the campus to life, adding color, energy, and character to every corner. From sketching on sheets to painting walls and even faces, it’s a space where imagination feels at home. With a canvas, a piece of fabric, or just an idea, you're free to create, in your own way.",
                      [
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/vignette/vign1.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/vignette/vign2.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/vignette/vign3.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/vignette/vign4.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/vignette/vign5.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/vignette/vign6.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/vignette/vign7.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/vignette/vign8.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/vignette/vign9.jpg",
                        "https://raw.githubusercontent.com/ccell2026/ccell/refs/heads/master/assets/images/cultural/vignette/vign10.jpg",
                      ],
                      [
                        {"name": "Tanay Singhvi", "phone": "6375954622"},
                        {
                          "name": "Amritanshu Kumar Shandilya",
                          "phone": "9461326773",
                        },
                        {"name": "Manasvi Agrawal", "phone": "6367787902"},
                        {"name": "Titiksha Gupta", "phone": "9589433182"},
                      ],
                      "https://www.instagram.com/vignette_lnmiit/",
                    ),
                  ]
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

Widget _buildGSecTile(String name, String post, String phoneUrl, String mailUrl) {
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
