import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:webview_flutter/webview_flutter.dart';

class PlayVideoSection extends StatefulWidget {
  final VoidCallback onVideoPlay;

  const PlayVideoSection({Key? key, required this.onVideoPlay}) : super(key: key);

  @override
  _PlayVideoSectionState createState() => _PlayVideoSectionState();
}

class _PlayVideoSectionState extends State<PlayVideoSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1500));
    _animation = Tween<double>(begin: 1, end: 1.4).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Text(
            'Play Video',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              _controller.stop();
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    content: kIsWeb
                        ? Image.network('https://img.youtube.com/vi/giQBy1EUwbI/0.jpg')
                        : const WebView(
                            initialUrl: 'https://www.youtube.com/embed/giQBy1EUwbI',
                            javascriptMode: JavascriptMode.unrestricted,
                          ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          _controller.repeat(reverse: true);
                          Navigator.of(context).pop();
                        },
                        child: const Text("Close"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'images/leyer1.jpg', // Your video preview image path
                  width: double.infinity,
                  height: 200, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.6), // Adjust opacity as needed
                  ),
                ),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: child,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5), // Adjust opacity as needed
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_circle_outline,
                      size: 48,
                      color: Color(0xFF55bbae),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
