import 'dart:async';
import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/layout/main_layout.dart';
import 'widgets/home_carousel_slider.dart';
import 'widgets/about_section.dart';
import 'widgets/video_section.dart';
import 'widgets/home_services_section.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return MainLayout(
      title: 'Home Page',
      child: SingleChildScrollView(
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
            const SizedBox(height: 24),
            AboutUsSection(),
            const SizedBox(height: 24),
            PlayVideoSection(
              onVideoPlay: () {
                // Handle video play
                print('Video played');
              },
            ),
            const SizedBox(height: 24),
            ServicesSection(),
          ],
        ),
      ),
    );
  }
}
