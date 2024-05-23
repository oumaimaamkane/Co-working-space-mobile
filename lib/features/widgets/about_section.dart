import 'package:coworking_space_mobile/features/constants.dart';
import 'package:flutter/material.dart';

class AboutUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        children: [
          const Text(
            'About Us',
            style: TextStyle(
              color: Color(0xFF888F96),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.8,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Community, creativity,\ncomfort & more',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF1E3954),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Image.asset('images/layericon-1.png'),
          const SizedBox(height: 20),
          const Text(
            'We are a community of bold minds who have decided to work under the same roof. Our workspace and the people around us inspire us to take action, to grow, to do better. By saying that our coworking space is sustainable and comfy we confirm that you will get 100% satisfaction from working here and making the best out of this experience.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: buttonStyle,
            child: const Text('Book A Seat'),
          ),
        ],
      ),
    );
  }
}
