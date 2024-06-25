import 'dart:io';
import 'package:coworking_space_mobile/core/models/equipement_model.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/models/space_model.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/spaces_viewmodel.dart';
import 'package:coworking_space_mobile/config/services/category_service.dart';
import 'package:coworking_space_mobile/config/services/service_service.dart';
import 'package:coworking_space_mobile/core/models/service_model.dart';
import 'package:coworking_space_mobile/core/models/category_model.dart';
import 'package:coworking_space_mobile/core/utils/image_utils.dart';

class AddSpaceViewModel extends ChangeNotifier {
  final SpaceViewModel spaceViewModel;
  final CategoryService categoryService;
  final ServiceService serviceService;

  List<Category> categories = [];
  List<Service> services = [];
  List<Service> selectedServices = [];
  List<Equipement> equipements = [];
  List<Equipement> selectedEquipements = [];
  bool isLoadingCategories = true;
  bool isLoadingServices = true;

  final TextEditingController floorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();

  String? selectedCategory;
  String? selectedStatus;
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
      services = await serviceService.fetchServices();
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

  void toggleEquipement(Equipement equipement) {
    if (selectedEquipements.contains(equipement)) {
      selectedEquipements.remove(equipement);
    } else {
      selectedEquipements.add(equipement);
    }
    notifyListeners();
  }

  void setSelectedCategory(String categoryId) {
    selectedCategory = categoryId;
    notifyListeners();
  }

  void setSelectedStatus(String status) {
    selectedStatus = status;
    notifyListeners();
  }

  Future<void> addSpace() async {
  if (selectedCategory != null) {
    // Define a static imageUrl for testing purposes
    String staticImageUrl = 'https://example.com/static-image.jpg';

    await spaceViewModel.addSpace(Space(
      id: '',
      floor: int.parse(floorController.text),
      description: descriptionController.text,
      status: selectedStatus!,
      price: double.parse(priceController.text),
      capacity: int.parse(capacityController.text),
      categoryId: selectedCategory!,
      services: selectedServices.map((s) => s.id).toList(),
      equipements: selectedEquipements.map((e) => e.id).toList(),
      imageUrl: staticImageUrl, // Assign staticImageUrl here
    ));
    await spaceViewModel.fetchSpaces();
    notifyListeners();
  }
}


  void disposeControllers() {
    _pickedImage = null;
    floorController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    capacityController.dispose();
  }
}
