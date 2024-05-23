import 'package:flutter/material.dart';

class ServiceBox extends StatefulWidget {
  final IconData iconData;
  final String title;
  final String description;

  const ServiceBox({
    Key? key,
    required this.iconData,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  _ServiceBoxState createState() => _ServiceBoxState();
}

class _ServiceBoxState extends State<ServiceBox> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _isExpanded ? 200 : 100, // Adjust the height of the service box
      decoration: BoxDecoration(
        color: _isExpanded ? Color(0xFF55bbae) : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
                parent: ModalRoute.of(context)!.animation!,
                curve: Curves.fastOutSlowIn,
              )),
              child: Icon(
                widget.iconData,
                size: 40,
                color: Color.fromARGB(255, 60, 132, 122), // Customize the icon color
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
              crossFadeState: _isExpanded
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
      ),
    );
  }
}
