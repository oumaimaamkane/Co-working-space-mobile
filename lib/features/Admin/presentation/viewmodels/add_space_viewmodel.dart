import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/models/space_model.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/spaces_viewmodel.dart';
import 'package:coworking_space_mobile/config/services/category_service.dart';
import 'package:coworking_space_mobile/core/models/category_model.dart';

class AddSpaceViewModel extends ChangeNotifier {
  final SpaceViewModel spaceViewModel;
  final CategoryService categoryService;
  List<Category> categories = []; // Initialize with an empty list
  bool isLoadingCategories = true; // Add a loading flag

  final TextEditingController floorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController servicesController = TextEditingController();

  String? selectedCategory;

  AddSpaceViewModel(this.spaceViewModel, this.categoryService) {
    fetchCategories(); // Fetch categories on initialization
  }

  Future<void> fetchCategories() async {
    try {
      categories = await categoryService.fetchCategories();
    } catch (e) {
      // Handle the error appropriately
      print('Failed to load categories: $e');
    } finally {
      isLoadingCategories = false;
      notifyListeners();
    }
  }

  void setSelectedCategory(String categoryId) {
    selectedCategory = categoryId;
    notifyListeners();
  }

  Future<void> addSpace() async {
    await spaceViewModel.addSpace(Space(
      id: '',
      floor: int.parse(floorController.text),
      description: descriptionController.text,
      status: statusController.text,
      price: double.parse(priceController.text),
      capacity: int.parse(capacityController.text),
      categoryId: selectedCategory!,
      services: servicesController.text.split(',').map((e) => e.trim()).toList(),
    ));
    await spaceViewModel.fetchSpaces();
    notifyListeners();
  }

  void disposeControllers() {
    floorController.dispose();
    descriptionController.dispose();
    statusController.dispose();
    priceController.dispose();
    capacityController.dispose();
    servicesController.dispose();
  }
}
