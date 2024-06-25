import 'package:coworking_space_mobile/config/services/equipement_service.dart';
import 'package:coworking_space_mobile/core/models/equipement_model.dart';
import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/models/space_model.dart';
import 'package:coworking_space_mobile/core/models/service_model.dart';
import 'package:coworking_space_mobile/config/services/service_service.dart';
import 'package:coworking_space_mobile/config/services/category_service.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/spaces_viewmodel.dart';
import 'package:coworking_space_mobile/core/utils/image_utils.dart';
import 'dart:io';

class UpdateSpaceViewModel extends ChangeNotifier {
  final SpaceViewModel spaceViewModel;
  final CategoryService categoryService;
  final Space space;
  final ServiceService serviceService = ServiceService();
  final EquipementService equipementService = EquipementService();

  final TextEditingController floorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();

  List<Service> allServices = [];
  List<Service> selectedServices = [];
  List<Equipement> allEquipements = [];
  List<Equipement> selectedEquipements = [];

  String? _imageUrl;
  String _selectedStatus; // Updated to non-nullable to ensure it's initialized
  String _selectedCategory;

  UpdateSpaceViewModel(this.spaceViewModel, this.categoryService, this.space)
      : _selectedStatus = space.status,
        _selectedCategory = space.categoryId {
    floorController.text = space.floor.toString();
    descriptionController.text = space.description;
    priceController.text = space.price.toString();
    capacityController.text = space.capacity.toString();
    selectedServices = space.services.map((serviceId) => Service(id: serviceId, name: '')).toList();
    selectedEquipements = space.equipements.map((equipementId) => Equipement(id: equipementId, name: '')).toList();
    _loadServices();
    _loadEquipements();
  }

  Future<void> _loadServices() async {
    allServices = await serviceService.fetchServices();
    selectedServices = allServices.where((service) => space.services.contains(service.id)).toList();
    notifyListeners();
  }

  Future<void> _loadEquipements() async {
    allEquipements = await equipementService.fetchEquipements();
    selectedEquipements = allEquipements.where((equipement) => space.equipements.contains(equipement.id)).toList();
    notifyListeners();
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

  Space getSpace() {
    return Space(
      id: space.id,
      floor: int.parse(floorController.text),
      description: descriptionController.text,
      status: _selectedStatus,
      price: double.parse(priceController.text),
      capacity: int.parse(capacityController.text),
      categoryId: _selectedCategory,
      services: selectedServices.map((s) => s.id).toList(),
      equipements: selectedEquipements.map((e) => e.id).toList(),
      imageUrl: _imageUrl ?? space.imageUrl,
    );
  }

  Future<void> uploadImage(File imageFile) async {
    String? imageUrl = await ImageUtils.uploadImage(imageFile, 'spaces');
    if (imageUrl != null) {
      _imageUrl = imageUrl;
      notifyListeners();
    }
  }

  Future<void> updateSpace(BuildContext context, Space updatedSpace) async {
    await spaceViewModel.updateSpace(updatedSpace);
    notifyListeners();
    Navigator.of(context).pop();
  }

  void setSelectedStatus(String status) {
    _selectedStatus = status;
    notifyListeners();
  }

  String get selectedStatus => _selectedStatus;

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  String get selectedCategoryId => _selectedCategory;
}
