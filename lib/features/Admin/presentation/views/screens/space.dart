import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/spaces_viewmodel.dart';
import 'package:coworking_space_mobile/core/models/space_model.dart';
import 'package:coworking_space_mobile/core/layout/dash_layout.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/headline.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/add_space_viewmodel.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/update_space_viewmodel.dart';
import 'package:coworking_space_mobile/config/services/category_service.dart';
import 'package:coworking_space_mobile/config/services/service_service.dart';
import 'package:coworking_space_mobile/core/models/category_model.dart';
import 'package:coworking_space_mobile/core/models/service_model.dart'; // Make sure Service is imported
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/update_space.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/views/screens/add_space.dart';

class SpaceScreen extends StatelessWidget {
  final SpaceViewModel viewModel = SpaceViewModel();
  final CategoryService categoryService = CategoryService();
  final ServiceService serviceService = ServiceService(); // Define serviceService here

  SpaceScreen({Key? key}) : super(key: key);

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
                  title: "Spaces",
                  caption: "Management of available spaces",
                ),
                const SizedBox(height: 32),
                StreamBuilder<List<Space>>(
                  stream: viewModel.spacesStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error loading data'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No spaces available'));
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final space = snapshot.data![index];
                          return Card(
                            margin: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: const Icon(Icons.location_city),
                              title: Text(space.description),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => UpdateSpaceScreen(
                                            viewModel: UpdateSpaceViewModel(
                                              viewModel,
                                              categoryService,
                                              space,
                                            ),
                                          ),
                                        ),
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
                                                'Are you sure you want to delete this space?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  viewModel.deleteSpace(space.id);
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
          onPressed: () async {
            List<Category> fetchedCategories = [];
            List<Service> fetchedServices = [];
            try {
              fetchedCategories = await categoryService.fetchCategories();
              fetchedServices = await serviceService.fetchServices();
            } catch (e) {
              // Handle error fetching categories or services
              print('Error fetching categories or services: $e');
            }

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddSpaceScreen(
  viewModel: AddSpaceViewModel(
    viewModel,
    categoryService,
    serviceService,
    fetchedServices, // Pass fetched services to the AddSpaceViewModel
  ),
  categories: fetchedCategories,
  services: fetchedServices, // Pass fetched services to the AddSpaceScreen
),

              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
