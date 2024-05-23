import 'package:flutter/material.dart';

class PlayVideoSection extends StatelessWidget {
  final VoidCallback onVideoPlay;

  const PlayVideoSection({Key? key, required this.onVideoPlay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[200],
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
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.play_circle_outline,
                size: 48,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
