import 'package:flutter/material.dart';
import 'service_box.dart';
import 'package:coworking_space_mobile/features/constants.dart';

class ServicesSection extends StatefulWidget {
  @override
  _ServicesSectionState createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  int _expandedIndex = -1; // Track the index of the currently expanded box

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const Text(
            'Our services',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3954),
            ),
          ),
          const SizedBox(height: 20),
          Image.asset('images/layericon-1.png'),
          const SizedBox(height: 20),
          Text(
            'Beautiful setting, abundant natural light, amazing comfort, super-fast internet, industrial style interior, custom made desks, state-of-the-art AC system, top notch location,…',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Add your action here
            },
            style: buttonStyle, // You can define buttonStyle if you want
            child: const Text('Explore Spaces'),
          ),
          ServiceBox(
            iconData: Icons.wifi,
            title: 'Highspeed WiFi',
            description: 'We offer you excellent rates of return paid either monthly.',
            isExpanded: _expandedIndex == 0, // Check if this box is expanded
            onTap: () {
              setState(() {
                _expandedIndex = _expandedIndex == 0 ? -1 : 0;
              });
            },
          ),
          ServiceBox(
            iconData: Icons.local_cafe,
            title: 'Organic Tea & Coffee',
            description: 'We offer you excellent rates of return paid either monthly.',
            isExpanded: _expandedIndex == 1, // Check if this box is expanded
            onTap: () {
              setState(() {
                _expandedIndex = _expandedIndex == 1 ? -1 : 1;
              });
            },
          ),
          ServiceBox(
            iconData: Icons.tv,
            title: 'Relax, entertainment room',
            description: 'We offer you excellent rates of return paid either monthly.',
            isExpanded: _expandedIndex == 2, // Check if this box is expanded
            onTap: () {
              setState(() {
                _expandedIndex = _expandedIndex == 2 ? -1 : 2;
              });
            },
          ),
        ],
      ),
    );
  }
}
