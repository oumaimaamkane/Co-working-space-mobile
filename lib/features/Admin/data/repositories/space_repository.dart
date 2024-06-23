import 'package:coworking_space_mobile/core/models/space_model.dart';

class SpaceRepository {
  Space? _selectedSpace;

  Space? get selectedSpace => _selectedSpace;

  void updateSpaceImage(String imageUrl) {
    // _selectedSpace?.imageUrl = imageUrl;
  }
}
