import 'package:flutter/material.dart';
import 'package:login_page/presentation/screens/resources/pdfviewer.dart';

class CurriculumPage extends StatelessWidget {
  const CurriculumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      appBar: AppBar(
        title: const Text(
          'CURRICULUM',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.9,
          ),
        ),
        backgroundColor: const Color(0xFF0E1A23),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildButtonGrid(context, [
                _ButtonData('B.Tech CSE', 'https://raw.githubusercontent.com/ccell2026/ccell/master/assets/pdfs/curriculum/cse.pdf'),
                _ButtonData('CSE Integrated', 'https://raw.githubusercontent.com/ccell2026/ccell/master/assets/pdfs/curriculum/cse_integrated.pdf'),
                _ButtonData('M.Tech CSE', 'https://raw.githubusercontent.com/ccell2026/ccell/master/assets/pdfs/curriculum/mtech_cse.pdf'),
                _ButtonData('B.Tech ECE', 'https://raw.githubusercontent.com/ccell2026/ccell/master/assets/pdfs/curriculum/ece.pdf'),
                _ButtonData('ECE Integrated', 'https://raw.githubusercontent.com/ccell2026/ccell/master/assets/pdfs/curriculum/cse_int.pdf'),
                _ButtonData('M.Tech ECE', 'https://raw.githubusercontent.com/ccell2026/ccell/master/assets/pdfs/curriculum/mtec_ece.pdf'),
                _ButtonData('B.Tech CCE', 'https://raw.githubusercontent.com/ccell2026/ccell/master/assets/pdfs/curriculum/cce.pdf'),
                _ButtonData('B.Tech MME', 'https://raw.githubusercontent.com/ccell2026/ccell/master/assets/pdfs/curriculum/mme.pdf'),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonGrid(BuildContext context, List<_ButtonData> buttons) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.19,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        final button = buttons[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PDFViewerPage(
                  title: button.title,
                  pdfUrl: button.url,
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF3A4B57), // Lighter top-left
                  Color(0xFF2A3B47), // Medium middle
                  Color(0xFF1A2B37), // Darker bottom-right
                ],
                stops: [0.0, 0.5, 1.0],
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(-1, -1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                button.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ButtonData {
  final String title;
  final String url;

  _ButtonData(this.title, this.url);
}
