import 'package:flutter/material.dart';

class COSHAScreen extends StatelessWidget {
  const COSHAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E1A23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1A23),
        elevation: 0,
        title: const Text(
          'Presidential Council',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Circle Avatar
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/president_profile.jpg'), // replace with your image
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 16),

            // Gallery Card with arrows
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1C2834),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Arrows + gallery area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left arrow button
                      IconButton(
                        icon: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6A85F1), Color(0xFF7AC5FF)],
                            ),
                          ),
                          child: const Icon(Icons.arrow_left, color: Colors.white),
                        ),
                        onPressed: () {
                          // Handle left arrow
                        },
                      ),

                      // Gallery placeholder box
                      Expanded(
                        child: Container(
                          height: 120,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2B3948),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'Gallery',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Right arrow button
                      IconButton(
                        icon: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6A85F1), Color(0xFF7AC5FF)],
                            ),
                          ),
                          child: const Icon(Icons.arrow_right, color: Colors.white),
                        ),
                        onPressed: () {
                          // Handle right arrow
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Cordies list
            _buildCordieTile('Cordie 1'),
            const SizedBox(height: 12),
            _buildCordieTile('Cordie 2'),
            const SizedBox(height: 12),
            _buildCordieTile('Cordie 3'),
          ],
        ),
      ),
    );
  }

  // Reusable cordie tile
  Widget _buildCordieTile(String name) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C2834),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Cordie name
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          // Phone + Mail icons
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.phone, color: Colors.white),
                onPressed: () {
                  // Add phone action
                },
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.email, color: Colors.white),
                onPressed: () {
                  // Add email action
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
