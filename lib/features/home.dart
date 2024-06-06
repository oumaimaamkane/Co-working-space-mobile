import 'dart:async';
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
import 'widgets/co_place_searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageUrls = [
    'images/leyer1.jpg',
    'images/leyer2.jpg',
    'images/leyer3.jpg',
  ];

  final List<String> titles = [
    'Probably The Best Creative Space In The City',
    'Another Creative Space For Your Startup',
    'Explore Our Amazing Coworking Space',
  ];

  final List<String> descriptions = [
    'Small description for the first image',
    'Small description for the second image',
    'Small description for the third image',
  ];

  late PageController _pageController;
  late Timer _timer;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(const Duration(milliseconds: 3000), (Timer timer) {
      if (_currentPageIndex < imageUrls.length - 1) {
        _currentPageIndex++;
      } else {
        _currentPageIndex = 0;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            imageUrls: imageUrls,
            titles: titles,
            descriptions: descriptions,
            onPageChanged: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            currentPageIndex: _currentPageIndex,
          ),
          // const SizedBox(height: 4),
          const coPlaceSearchBar(),
          const SizedBox(height: 24),
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
  