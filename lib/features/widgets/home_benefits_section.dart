import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/constants.dart';

class BenefitsSection extends StatelessWidget {
  const BenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 706.4,
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                const Text(
                  'OUR BENEFITS',
                  style: TextStyle(
                    color: Color(0xFF888F96),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.8,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Benefits to Setting Up Your Startup in Our Coworking Space',
                  style: TextStyle(
                    color: Color(0xFF1E3954),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                Image.asset('images/layericon-1.png'),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'We are proud of what we have come up to at our center! Only here you get to enjoy with talented people who work in different areas, designers, photographers, engineers etc.',
            style: TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BenefitItem(
                  number: '1',
                  text: 'Actual office space that promotes productivity'),
              BenefitItem(
                  number: '2', text: 'Meaningful connections with your team'),
              BenefitItem(
                  number: '3',
                  text: 'Increased productivity to get some work done'),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: buttonStyle,
            onPressed: () {
              // Add your navigation logic here
            },
            child: const Text('Schedule My Tour'),
          ),
        ],
      ),
    );
  }
}

class BenefitItem extends StatelessWidget {
  final String number;
  final String text;

  const BenefitItem({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
              color: Color(0xFF55bbaf),
              fontWeight: FontWeight.bold,
              fontSize: 20.0),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
