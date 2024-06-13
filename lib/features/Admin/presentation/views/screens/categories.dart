import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/core/models/category_model.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/categories_viewmodel.dart';
import 'package:coworking_space_mobile/core/layout/dash_layout.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/headline.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryViewModel viewModel = Get.put(CategoryViewModel());
  final TextEditingController nameController = TextEditingController();

  CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashLayout(
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Headline(
                  title: "Categories",
                  caption: "Management of available categories",
                ),
                const SizedBox(height: 32),
                StreamBuilder<List<Category>>(
                  stream: viewModel.categoriesStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error loading data'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No categories available'));
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final category = snapshot.data![index];
                          return Card(
                            margin: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: const Icon(Icons.category),
                              title: Text(category.name),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      nameController.text = category.name;
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Edit Category'),
                                            content: TextField(
                                              controller: nameController,
                                              decoration: const InputDecoration(
                                                hintText: 'Category Name',
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  nameController.clear();
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  viewModel.updateCategory(
                                                    category.id,
                                                    nameController.text,
                                                  );
                                                  nameController.clear();
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Save'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Confirm Delete'),
                                            content: const Text(
                                                'Are you sure you want to delete this category?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  viewModel.deleteCategory(category.id);
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Delete'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add Category'),
                  content: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: 'Category Name',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        nameController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        await viewModel.addCategory(nameController.text);
                        nameController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Add'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
