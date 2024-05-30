import 'package:flutter/material.dart';

class BouncingPreloader extends StatefulWidget {
  const BouncingPreloader({Key? key}) : super(key: key);

  @override
  _BouncingPreloaderState createState() => _BouncingPreloaderState();
}

class _BouncingPreloaderState extends State<BouncingPreloader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    
    _animations = List.generate(5, (index) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          (index / 5), // Staggered start for each dot
          ((index + 1) / 5), // Staggered end for each dot
          curve: Curves.easeInOut,
        ),
      ));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Transform.translate(
                offset: Offset(
                  0.0,
                  -10.0 * _animations[index].value, // Apply animation to offset
                ),
                child: child,
              ),
            );
          },
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }
}
