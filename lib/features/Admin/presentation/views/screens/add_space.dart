import 'dart:io';
import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/add_space_viewmodel.dart';
import 'package:coworking_space_mobile/features/constants.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:coworking_space_mobile/core/models/category_model.dart';

class AddSpaceScreen extends StatefulWidget {
  final AddSpaceViewModel viewModel;
  final List<Category> categories;

  AddSpaceScreen({Key? key, required this.viewModel, required this.categories})
      : super(key: key);

  @override
  _AddSpaceScreenState createState() => _AddSpaceScreenState();
}

class _AddSpaceScreenState extends State<AddSpaceScreen> {
  File? _pickedImage;
  bool _isImageVisible = false;

  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => widget.viewModel,
      child: Consumer<AddSpaceViewModel>(
        builder: (context, viewModel, child) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Add Space',
              style: TextStyle(color: Colors.white),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: viewModel.isLoadingCategories
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Add a new space by filling out the details below:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        if (_isImageVisible)
                          Container(
                            height: 200, // Set the height of the image container
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(_pickedImage!),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey),
                            ),
                          ),
                        const SizedBox(height: 20),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: viewModel.descriptionController,
                                decoration: const InputDecoration(
                                    labelText: 'Description'),
                                maxLines:
                                    null, // Allows the description field to expand vertically
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a description';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: viewModel.servicesController,
                                decoration: const InputDecoration(
                                    labelText: 'Services (comma separated)'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter services';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: viewModel.floorController,
                                      decoration: const InputDecoration(
                                          labelText: 'Floor'),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a floor number';
                                        }
                                        if (int.tryParse(value) == null) {
                                          return 'Floor must be a number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: TextFormField(
                                      controller: viewModel.statusController,
                                      decoration: const InputDecoration(
                                          labelText: 'Status'),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: viewModel.priceController,
                                      decoration: const InputDecoration(
                                          labelText: 'Price'),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a price';
                                        }
                                        if (double.tryParse(value) == null) {
                                          return 'Price must be a number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: TextFormField(
                                      controller: viewModel.capacityController,
                                      decoration: const InputDecoration(
                                          labelText: 'Capacity'),
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter a capacity';
                                        }
                                        if (int.tryParse(value) == null) {
                                          return 'Capacity must be a number';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              DropdownButtonFormField<String>(
                                value: viewModel.selectedCategory,
                                items: viewModel.categories.map((category) {
                                  return DropdownMenuItem<String>(
                                    value: category.id,
                                    child                                  : Text(category.name),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  viewModel.setSelectedCategory(value!);
                                },
                                decoration:
                                    const InputDecoration(labelText: 'Category'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a category';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () async {
                                  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                                  if (pickedFile != null) {
                                    setState(() {
                                      _pickedImage = File(pickedFile.path);
                                      _isImageVisible = true;
                                    });
                                    viewModel.uploadImage(File(pickedFile.path));
                                  }
                                },
                                style: buttonStyle,
                                child: const Text('Upload Image'),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await viewModel.addSpace();
                                    Navigator.of(context).pop();
                                  }
                                },
                                style: buttonStyle,
                                child: const Text('Add Space'),
                              ),
                            ],
                          ),
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
