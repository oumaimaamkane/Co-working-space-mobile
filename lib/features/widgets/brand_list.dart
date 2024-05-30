import 'dart:async';
import 'package:flutter/material.dart';

class BrandList extends StatefulWidget {
  @override
  _BrandListState createState() => _BrandListState();
}

class _BrandListState extends State<BrandList> {
  late PageController _pageController;
  late Timer _timer;
  int _currentPageIndex = 1000; // Set an initial index that is a multiple of the brand count

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.333,
      initialPage: _currentPageIndex,
    );
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _currentPageIndex++;
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          SizedBox(
            height: 120.0, // Adjust the height as needed
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // Use modulo to loop around the brand list
                final brandIndex = index % 5; // Assuming you have 5 brands
                return BrandItem(imageUrl: 'images/brand_${brandIndex + 1}.jpg');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BrandItem extends StatelessWidget {
  final String imageUrl;

  BrandItem({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      child: Image.asset(imageUrl),
    );
  }
}
