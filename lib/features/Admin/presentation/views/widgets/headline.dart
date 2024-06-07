import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Headline extends StatelessWidget {
  final String title;
  final String? caption;

  const Headline({
    Key? key,
    required this.title,
    this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.width <= 600) {
      return Padding(
        padding: const EdgeInsets.only(left: 52.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            caption != null
                ? Text(
                    caption!,
                    style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold), 
                  )
                : const SizedBox.shrink(),
          ],
        ),
      );
    } else {
      return caption != null
          ? Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  height: 24,
                  child: const VerticalDivider(indent: 0, endIndent: 0),
                ),
                Text(
                  caption!,
                  style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold), 
                ),
              ],
            )
          : Text(
              title,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            );
    }
  }
}
