import 'package:coworking_space_mobile/core/models/category_model.dart';
import 'package:coworking_space_mobile/core/models/space_model.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/constants.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/update_space_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:coworking_space_mobile/features/Admin/presentation/views/widgets/list_services.dart';

class UpdateSpaceScreen extends StatelessWidget {
  final UpdateSpaceViewModel viewModel;
  final List<Category> categories;

  const UpdateSpaceScreen({
    Key? key,
    required this.viewModel,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<UpdateSpaceViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Update Space', style: TextStyle(color: Colors.white)),
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Update space details below:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16.0),
                  if (viewModel.space.imageUrl.isNotEmpty)
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(viewModel.space.imageUrl), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                  if (viewModel.space.imageUrl.isEmpty)
                    const Text('No images for this space', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: viewModel.floorController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Floor Number', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: viewModel.descriptionController,
                    maxLines: null,
                    decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    value: viewModel.selectedStatus, // Ensure this is set correctly
                    items: [
                      'Occupied',
                      'Available',
                      'Under Maintenance',
                    ].map((status) {
                      return DropdownMenuItem<String>(
                        value: status,
                        child: Text(status),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.setSelectedStatus(value!); // Update the selected status in the viewModel
                    },
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a status';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: viewModel.priceController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Price', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: viewModel.capacityController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Capacity', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 16.0),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Services',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListServices(
                    services: viewModel.allServices,
                    selectedServices: viewModel.selectedServices,
                    onServiceSelected: (service) => viewModel.toggleService(service),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final imagePicker = ImagePicker();
                      final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        viewModel.uploadImage(File(pickedFile.path));
                      }
                    },
                    style: buttonStyle,
                    child: const Text('Upload Image'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Space updatedSpace = viewModel.getSpace();
                      viewModel.updateSpace(context, updatedSpace);
                    },
                    style: buttonStyle,
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
