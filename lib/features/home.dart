import 'dart:async';
import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/layout/main_layout.dart';

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
      child: Column(
        children: [
          Container(
            height: 200, // Adjust the height to make the hero section smaller
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Image.asset(
                          imageUrls[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Adjust padding to make text box smaller
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min, // Minimize the size of the column
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  child: Text(
                                    titles[index],
                                    key: Key(titles[index]),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: index == _currentPageIndex ? 20 : 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  child: Text(
                                    descriptions[index],
                                    key: Key(descriptions[index]),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          right: 16,
                          bottom: 16,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Schedule A Tour'),
                          ),
                        ),
                      ],
                    );
                  },
                  onPageChanged: (int index) {
                    setState(() {
                      _currentPageIndex = index;
                    });
                  },
                ),
              ],
            ),
          ),
          const Text(
            'Your additional content goes here...',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
