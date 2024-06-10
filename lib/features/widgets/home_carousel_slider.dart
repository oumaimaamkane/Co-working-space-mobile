import 'dart:async';
import 'package:flutter/material.dart';
import 'co_place_searchbar.dart'; // Import the search bar widget

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final List<String> imageUrls = [
    'images/leyer1.jpg',
    'images/leyer1.jpg',
    'images/leyer1.jpg',
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
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
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
    return Column(
      children: [
        SizedBox(
          height: 400, // Increased height to accommodate the search bar
          width: double.infinity, // Make the container take full width
          child: CarouselSlider(
            imageUrls: imageUrls,
            titles: titles,
            descriptions: descriptions,
            onPageChanged: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            currentPageIndex: _currentPageIndex,
            pageController: _pageController,
          ),
        ),
      ],
    );
  }
}

class CarouselSlider extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> titles;
  final List<String> descriptions;
  final Function(int) onPageChanged;
  final int currentPageIndex;
  final PageController pageController;

  const CarouselSlider({
    Key? key,
    required this.imageUrls,
    required this.titles,
    required this.descriptions,
    required this.onPageChanged,
    required this.currentPageIndex,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              PageView.builder(
                controller: pageController,
                onPageChanged: onPageChanged,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        imageUrls[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Container(
                        color: Colors.black54,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                titles[index],
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                descriptions[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Positioned(
                bottom: 50, // Adjust as needed
                left: 0,
                right: 0,
                child: Center(
                  child: coPlaceSearchBar(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


