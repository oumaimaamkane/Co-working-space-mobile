import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start, // Align from the start top
        children: [
          Expanded(
            child: _buildContactInfo(
              icon: Icons.location_on,
              label: 'Address',
              info: 'MASH Detroit building, 14711 Mack Ave., Detroit, MI 48214',
            ),
          ),
          Expanded(
            child: _buildContactInfo(
              icon: Icons.phone,
              label: 'Phone',
              info: '123 - 456 7890 / 123 - 456 7891',
            ),
          ),
          Expanded(
            child: _buildContactInfo(
              icon: Icons.email,
              label: 'Email',
              info: 'contact@company.com',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo({required IconData icon, required String label, required String info}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 231, 244, 241),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color.fromARGB(255, 58, 140, 129), size: 30.0),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF1E3954),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0), // Add horizontal padding
          child: Text(
            info,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
