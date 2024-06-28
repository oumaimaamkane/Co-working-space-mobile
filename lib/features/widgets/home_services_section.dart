import 'package:flutter/material.dart';
import 'service_box.dart';
import 'package:coworking_space_mobile/features/constants.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  _ServicesSectionState createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> with SingleTickerProviderStateMixin {
  int _expandedIndex = -1;
  late AnimationController _scaleController; // Now without initialization
  late Animation<double> _scaleAnimation;

  Animation<double> getScaleAnimation() {
    return Tween<double>(begin: 1.0, end: 1.09).animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut));
  }

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000))..repeat();
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02)
    .animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut))
    ..addListener(() => setState(() {}));
    _scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _scaleController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _scaleController.forward();
      }
    });
    _scaleController.forward();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

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
            style: buttonStyle,
            child: const Text('Explore Spaces'),
          ),
          const SizedBox(height: 30),
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
            scaleAnimation: getScaleAnimation(),
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
            scaleAnimation: getScaleAnimation(),
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
            scaleAnimation: getScaleAnimation(),
          ),
        ],
      ),
    );
  }
}
