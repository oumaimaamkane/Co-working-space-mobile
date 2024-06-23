import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/models/space_model.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/spaces_viewmodel.dart';
import 'package:coworking_space_mobile/config/services/category_service.dart';
import 'package:coworking_space_mobile/config/services/service_service.dart';
import 'package:coworking_space_mobile/core/models/service_model.dart';
import 'package:coworking_space_mobile/core/models/category_model.dart';
import 'dart:io';
import 'package:coworking_space_mobile/core/utils/image_utils.dart';

class AddSpaceViewModel extends ChangeNotifier {
  final SpaceViewModel spaceViewModel;
  final CategoryService categoryService;
  final ServiceService? serviceService;
  
  List<Category> categories = [];
  List<Service> services = [];
  List<Service> selectedServices = [];
  bool isLoadingCategories = true;
  bool isLoadingServices = true;

  final TextEditingController floorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();

  String? selectedCategory;
  String? _imageUrl;
  File? _pickedImage;

  AddSpaceViewModel(
  this.spaceViewModel,
  this.categoryService,
  this.serviceService,
  this.services, // Accept services in the constructor
) {
  fetchCategories();
}


  Future<void> uploadImage(File imageFile) async {
    String? imageUrl = await ImageUtils.uploadImage(imageFile, 'spaces');
    if (imageUrl != null) {
      _imageUrl = imageUrl;
      _pickedImage = imageFile;
      notifyListeners();
      await addSpace();
    }
  }

  Future<void> fetchCategories() async {
    try {
      categories = await categoryService.fetchCategories();
    } catch (e) {
      print('Failed to load categories: $e');
    } finally {
      isLoadingCategories = false;
      notifyListeners();
    }
  }

  Future<void> fetchServices() async {
  try {
    services = await serviceService?.fetchServices() ?? [];
  } catch (e) {
    print('Failed to load services: $e');
  } finally {
    isLoadingServices = false;
    notifyListeners();
  }
}


  void toggleService(Service service) {
    if (selectedServices.contains(service)) {
      selectedServices.remove(service);
    } else {
      selectedServices.add(service);
    }
    notifyListeners();
  }

  void setSelectedCategory(String categoryId) {
    selectedCategory = categoryId;
    notifyListeners();
  }

  Future<void> addSpace() async {
    if (selectedCategory != null && _imageUrl != null) {
      await spaceViewModel.addSpace(Space(
        id: '',
        floor: int.parse(floorController.text),
        description: descriptionController.text,
        status: statusController.text,
        price: double.parse(priceController.text),
        capacity: int.parse(capacityController.text),
        categoryId: selectedCategory!,
        services: selectedServices.map((s) => s.id).toList(),
        imageUrl: _imageUrl!,
      ));
      await spaceViewModel.fetchSpaces();
      notifyListeners();
    }
  }

  void disposeControllers() {
    _pickedImage = null;
    floorController.dispose();
    descriptionController.dispose();
    statusController.dispose();
    priceController.dispose();
    capacityController.dispose();
  }
}
