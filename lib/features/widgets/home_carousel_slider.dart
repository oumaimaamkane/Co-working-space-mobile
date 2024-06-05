import 'package:coworking_space_mobile/features/constants.dart';
import 'package:flutter/material.dart';

class CarouselSlider extends StatelessWidget {
  final List<String> imageUrls;
  final List<String> titles;
  final List<String> descriptions;
  final ValueChanged<int> onPageChanged;
  final int currentPageIndex; // Add this line

  const CarouselSlider({
    super.key,
    required this.imageUrls,
    required this.titles,
    required this.descriptions,
    required this.onPageChanged,
    required this.currentPageIndex, // Add this line
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Adjust the height to make the hero section smaller
      child: PageView.builder(
        itemCount: imageUrls.length,
        onPageChanged: onPageChanged,
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
                            fontSize: index == currentPageIndex ? 20 : 16, // Use currentPageIndex here
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
                  style: buttonStyle,
                  child: const Text('Schedule A Tour'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
