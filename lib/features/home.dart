import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/layout/main_layout.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Home Page',
      child: Column(
        children: [
          ImageSlideshow(
            width: double.infinity,
            height: 200,
            initialPage: 0,
            indicatorColor: Colors.blue,
            indicatorBackgroundColor: Colors.grey,
            onPageChanged: (value) {
              print('Page changed: $value');
            },
            autoPlayInterval: 3000,
            isLoop: true,
            children: [
              Image.asset(
                'images/sample_image_1.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'images/sample_image_2.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'images/sample_image_3.jpg',
                fit: BoxFit.cover,
              ),
            ],
          ),
          const Center(
            child: Text('Welcome to the Home Page'),
          ),
        ],
      ),
    );
  }
}
