import 'package:flutter/material.dart';

class PlayVideoSection extends StatelessWidget {
  final VoidCallback onVideoPlay;

  const PlayVideoSection({Key? key, required this.onVideoPlay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      // color: Colors.grey[200],
      child: Column(
        children: [
          const Text(
            'Play Video',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: onVideoPlay,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'images/leyer1.jpg', // Your video preview image path
                  width: double.infinity,
                  height: 200, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.6), // Adjust opacity as needed
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5), // Adjust opacity as needed
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_circle_outline,
                    size: 48,
                    color: Color(0xFF55bbae),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
