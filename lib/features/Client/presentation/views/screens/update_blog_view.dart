import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/core/models/blog_model.dart';
import 'package:coworking_space_mobile/config/services/blog_service.dart';
import 'package:coworking_space_mobile/features/constants.dart';

class UpdateBlogScreen extends StatelessWidget {
  final Blog blog;

  const UpdateBlogScreen({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController(text: blog.title);
    final TextEditingController contentController = TextEditingController(text: blog.content);
    final TextEditingController imageUrlController = TextEditingController(text: blog.imageUrl);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Blog',
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
                    'Update Blog',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Modify your blog post here.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: contentController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                labelText: 'Content',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: imageUrlController,
              decoration: const InputDecoration(
                labelText: 'Image URL',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await BlogService().updateBlog(
                  blog.id,
                  Blog(
                    id: blog.id,
                    title: titleController.text,
                    content: contentController.text,
                    imageUrl: imageUrlController.text,
                    userId: blog.userId,
                    status: blog.status,
                  ),
                );
                Get.back(result: true); // Return true to indicate update success
              },
              style: buttonStyle,
              child: const Text('Update Blog'),
            ),
          ],
        ),
      ),
    );
  }
}
