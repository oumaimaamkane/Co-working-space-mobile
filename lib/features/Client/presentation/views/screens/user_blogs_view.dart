import 'package:coworking_space_mobile/config/services/blog_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/core/models/blog_model.dart';
import 'package:coworking_space_mobile/features/constants.dart';
import 'package:coworking_space_mobile/config/routes/app_routes.dart';

class UserBlogsView extends StatelessWidget {
  final BlogService blogService = BlogService();
  final String userId = Get.arguments as String;
  final RxList<Blog> blogs = <Blog>[].obs; // Reactive list

  UserBlogsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Fetch blogs when the view is created
    fetchBlogs();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Blogs',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Blogs',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Explore and manage your blogs here.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              // Use Obx to update the UI when blogs change
              if (blogs.isEmpty) {
                return const Center(child: Text('No blogs found'));
              }
              return ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  final blog = blogs[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            blog.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            blog.content,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Image.network(
                            blog.imageUrl,
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  final result = await Get.toNamed(AppRoutes.updateBlog, arguments: blog);
                                  if (result != null && result) {
                                    fetchBlogs(); // Refresh blogs after returning from update
                                  }
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Handle delete action
                                  showDeleteConfirmationDialog(context, blog);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.toNamed(AppRoutes.createBlog, arguments: userId);
          if (result != null && result) {
            fetchBlogs();
          }
        },
        backgroundColor: tPrimaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  void fetchBlogs() async {
  final fetchedBlogs = await blogService.fetchUserBlogs(userId);
  blogs.assignAll(fetchedBlogs); // Update the reactive list
}


  void showDeleteConfirmationDialog(BuildContext context, Blog blog) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Blog'),
        content: const Text('Are you sure you want to delete this blog?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await blogService.deleteBlog(blog.id); 
              Navigator.of(context).pop();
              fetchBlogs();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
