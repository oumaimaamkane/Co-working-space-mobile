import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/config/services/blog_service.dart';
import 'package:coworking_space_mobile/core/models/blog_model.dart';
import 'package:coworking_space_mobile/features/constants.dart';

class CreateBlogView extends StatelessWidget {
  final BlogService blogService = BlogService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final String userId;

  CreateBlogView({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Blog',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Blog',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Write a new blog post here.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                labelText: 'Content',
              ),
            ),
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Image URL',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Blog newBlog = Blog(
                  id: '',
                  title: titleController.text,
                  content: contentController.text,
                  imageUrl: imageUrlController.text,
                  status: 'pending', // Set status to pending
                  userId: userId, // Pass the userId here
                );

                await blogService.addBlog(newBlog);

                Get.back(result: true); // Return true to indicate success
              },
              style: buttonStyle,
              child: const Text('Create Blog'),
            ),
          ],
        ),
      ),
    );
  }
}
