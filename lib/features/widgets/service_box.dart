import 'package:flutter/material.dart';

class ServiceBox extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String description;
  final bool isExpanded;
  final VoidCallback onTap; 
  final Animation<double> scaleAnimation;

  const ServiceBox({
    super.key,
    required this.iconData,
    required this.title,
    required this.description,
    this.isExpanded = false,
    required this.onTap,
    required this.scaleAnimation,
  });

  @override
  _ServiceBoxState createState() => _ServiceBoxState();
}

class _ServiceBoxState extends State<ServiceBox> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: widget.isExpanded ? 200 : 100,
      decoration: BoxDecoration(
        color: widget.isExpanded ? const Color(0xFF55bbae) : const Color.fromARGB(255, 210, 210, 210),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: Transform.scale(
        scale: widget.scaleAnimation.value,
        child: InkWell(
        onTap: () {
          widget.onTap(); // Call onTap function when tapped
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: Tween<double>(begin: 1, end: widget.isExpanded ? 1.5 : 1)
                  .animate(CurvedAnimation(
                parent: ModalRoute.of(context)!.animation!,
                curve: Curves.fastOutSlowIn,
              )),
              child: Icon(
                widget.iconData,
                size: 40,
                color: const Color.fromARGB(
                    255, 60, 132, 122),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 300),
              crossFadeState: widget.isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Container(),
              secondChild: Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),)
    );
  }
}
