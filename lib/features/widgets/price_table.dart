import 'package:coworking_space_mobile/features/constants.dart';
import 'package:flutter/material.dart';

class PriceTable extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final List<String> features;
  final String? ribbon;

  PriceTable({
    required this.title,
    required this.price,
    required this.description,
    required this.features,
    this.ribbon,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = ribbon != null ? const Color(0xFF55bbae) : Colors.grey;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor), // Set border color based on ribbon
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (ribbon != null)
            Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  ribbon!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          Text(
            title,
            style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 8.0),
          Text(
            price,
            style: const TextStyle(fontSize: 20.0, color: Colors.green),
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          const SizedBox(height: 8.0),
          ...features.map((feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  children: [
                    const Icon(Icons.check, color: Colors.green),
                    const SizedBox(width: 8.0),
                    Expanded(
                        child: Text(
                      feature,
                      style: const TextStyle(color: Colors.white),
                    )),
                  ],
                ),
              )),
          const SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: const Text("Join Now"),
            ),
          ),
        ],
      ),
    );
  }
}
