import 'package:coworking_space_mobile/config/services/category_service.dart';
import 'package:coworking_space_mobile/features/constants.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/models/space_model.dart';
import 'package:coworking_space_mobile/core/models/category_model.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  final CategoryService _categoryService = CategoryService();

  SpaceCard({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Image.network(
            space.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // Description and Details
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<Category?>(
                  future: _categoryService.getCategoryById(space.categoryId),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return Text('Category not found');
                    } else {
                      String categoryName = snapshot.data!.name;
                      return Text(
                        categoryName,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E3954),
                        ),
                      );
                    }
                  },
                ),

                const SizedBox(height: 8.0),

                // Team Size
                Row(
                  children: [
                    const Icon(Icons.group, size: 20, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      'Ideal for team size ${space.capacity} people',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),

                // Description
                Text(
                  space.description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8.0),

                // Price
                Text(
                  'From \$${space.price}${space.categoryId == "Meeting Room" ? "/hr" : "/mo"}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 16.0),

                // Button
                ElevatedButton(
                  onPressed: () {
                    // Handle booking logic here
                  },
                  style: buttonStyle,
                  // style: ElevatedButton.styleFrom(
                  //   // primary: Colors.teal,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  // ),
                  child: const Text('Learn More'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
