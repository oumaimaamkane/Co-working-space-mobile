import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/constants.dart';

class EventHostSection extends StatelessWidget {
  const EventHostSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/h2-bg1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 34.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Text(
                'Host your next event at Coworkshop',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.0),
              child: Text(
                'The perfect place for dev gatherings, demo nights, speaker panels, launch parties, and creative brainstorming.',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {
                      // Add your navigation logic here
                    },
                    child: const Text('Host Event'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
