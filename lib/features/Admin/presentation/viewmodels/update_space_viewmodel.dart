import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/models/space_model.dart';
import 'package:coworking_space_mobile/config/services/category_service.dart';
import 'package:coworking_space_mobile/features/Admin/presentation/viewmodels/spaces_viewmodel.dart';

class UpdateSpaceViewModel extends ChangeNotifier {
  final SpaceViewModel spaceViewModel;
  final CategoryService categoryService;

  final TextEditingController floorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController servicesController = TextEditingController();

  final Space space;

  UpdateSpaceViewModel(this.spaceViewModel, this.categoryService, this.space) {
    floorController.text = space.floor.toString();
    descriptionController.text = space.description;
    statusController.text = space.status;
    priceController.text = space.price.toString();
    capacityController.text = space.capacity.toString();
    servicesController.text = space.services.join(", ");
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
      services: servicesController.text.split(", ").map((s) => s.trim()).toList(),
    );
  }

  Future<void> updateSpace(BuildContext context, Space updatedSpace) async {
    await spaceViewModel.updateSpace(updatedSpace);
    notifyListeners();
    Navigator.of(context).pop(); // Navigate back to the previous screen
  }
}
