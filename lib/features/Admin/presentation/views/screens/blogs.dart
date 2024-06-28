import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coworking_space_mobile/core/models/blog_model.dart';
import 'package:coworking_space_mobile/core/layout/dash_layout.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/headline.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/blogs_viewmodel.dart';

class BlogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BlogsViewModel()..fetchBlogs(),
      child: DashLayout(
        body: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<BlogsViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.blogs.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Headline(
                        title: "Blogs",
                        caption: "Management of blogs",
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8.0,
                        children: [
                          FilterChip(
                            label: const Text('Pending'),
                            selected: viewModel.selectedFilter == 'pending',
                            onSelected: (bool selected) {
                              viewModel.setSelectedFilter(selected ? 'pending' : '');
                            },
                          ),
                          FilterChip(
                            label: const Text('Published'),
                            selected: viewModel.selectedFilter == 'published',
                            onSelected: (bool selected) {
                              viewModel.setSelectedFilter(selected ? 'published' : '');
                            },
                          ),
                          FilterChip(
                            label: const Text('Unpublished'),
                            selected: viewModel.selectedFilter == 'unpublished',
                            onSelected: (bool selected) {
                              viewModel.setSelectedFilter(selected ? 'unpublished' : '');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Expanded(
                        child: ListView.builder(
                          itemCount: viewModel.filteredBlogs.length,
                          itemBuilder: (context, index) {
                            final blog = viewModel.filteredBlogs[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              child: ListTile(
                                title: Text(blog.title),
                                subtitle: Text(blog.content),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(blog.imageUrl),
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.info),
                                      onPressed: () {
                                        // Handle info action
                                      },
                                    ),
                                    if (blog.status == 'pending') ...[
                                      IconButton(
                                        icon: const Icon(Icons.check),
                                        onPressed: () {
                                          viewModel.updateBlogStatus(index, 'published');
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.close),
                                        onPressed: () {
                                          viewModel.updateBlogStatus(index, 'unpublished');
                                        },
                                      ),
                                    ] else if (blog.status == 'published') ...[
                                      IconButton(
                                        icon: const Icon(Icons.archive),
                                        onPressed: () {
                                          viewModel.updateBlogStatus(index, 'archived');
                                        },
                                      ),
                                    ] else ...[
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          viewModel.deleteBlog(index);
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Blog deleted')),
                                          );
                                        },
                                      ),
                                    ],
                                  ],
                                ),
                                onTap: () {
                                  // Navigate to blog details/edit screen
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Navigate to add new blog screen
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
