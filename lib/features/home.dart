import 'package:flutter/material.dart';
import 'widgets/home_carousel_slider.dart'; 
import 'widgets/about_section.dart';
import 'widgets/video_section.dart';
import 'widgets/home_services_section.dart';
import 'widgets/membership_section.dart';
import 'widgets/home_benefits_section.dart';
import 'widgets/brand_list.dart';
import 'widgets/event_host_section.dart';
import 'widgets/contact_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeCarousel(),
          const AboutUsSection(),
          const SizedBox(height: 24),
          PlayVideoSection(
            onVideoPlay: () {
              // Handle video play
              print('Video played');
            },
          ),
          const SizedBox(height: 24),
          const ServicesSection(),
          const SizedBox(height: 24),
          const MembershipSection(),
          const SizedBox(height: 24),
          const BenefitsSection(),
          const SizedBox(height: 24),
          const BrandList(),
          const SizedBox(height: 24),
          const EventHostSection(),
          const SizedBox(height: 24),
          const ContactSection(),
        ],
      ),
    );
  }
}