import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/widgets/contact_form.dart';
import 'package:coworking_space_mobile/features/widgets/contact_infos.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: ContactInfo(),
          ),
          const SizedBox(height: 40.0),
          const Text(
            'Request for Call Back',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'We\'re always ready to discuss cooperation',
            style: TextStyle(
              color: Color(0xFF1E3954),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40.0),
          const Text(
            'I would like to discuss:',
            style: TextStyle(
              color: Color(0xFF1E3954),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          ContactForm(),
        ],
      ),
    );
  }
}
