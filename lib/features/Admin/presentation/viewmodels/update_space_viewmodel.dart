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
  final ServiceService serviceService = ServiceService(); // Create an instance of ServiceService

  final TextEditingController floorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  
  List<Service> allServices = [];
  List<Service> selectedServices = [];
  
  String? _imageUrl;

  UpdateSpaceViewModel(this.spaceViewModel, this.categoryService, this.space) {
    floorController.text = space.floor.toString();
    descriptionController.text = space.description;
    statusController.text = space.status;
    priceController.text = space.price.toString();
    capacityController.text = space.capacity.toString();
    selectedServices = space.services.map((serviceId) => Service(id: serviceId, name: '')).toList();
    _loadServices();
  }

  Future<void> _loadServices() async {
    allServices = await serviceService.fetchServices(); // Use the instance to fetch services
    selectedServices = allServices.where((service) => space.services.contains(service.id)).toList();
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

  Space getSpace() {
    return Space(
      id: space.id,
      floor: int.parse(floorController.text),
      description: descriptionController.text,
      status: statusController.text,
      price: double.parse(priceController.text),
      capacity: int.parse(capacityController.text),
      categoryId: space.categoryId,
      services: selectedServices.map((s) => s.id).toList(),
      imageUrl: _imageUrl ?? space.imageUrl,
    );
  }

  Future<void> uploadImage(File imageFile) async {
    String? imageUrl = await ImageUtils.uploadImage(imageFile, 'spaces');
    if (imageUrl != null) {
      _imageUrl = imageUrl;
    }
  }

  Future<void> updateSpace(BuildContext context, Space updatedSpace) async {
    await spaceViewModel.updateSpace(updatedSpace);
    notifyListeners();
    Navigator.of(context).pop();
  }
}
