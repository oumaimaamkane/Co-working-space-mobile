import 'dart:async';
import 'package:coworking_space_mobile/core/models/space_model.dart';
import 'package:coworking_space_mobile/config/services/space_service.dart';

class SpaceViewModel {
  final SpaceService _spaceService = SpaceService();
  final StreamController<List<Space>> _spacesController = StreamController<List<Space>>();

  Stream<List<Space>> get spacesStream => _spacesController.stream;

  SpaceViewModel() {
    fetchSpaces();
  }

  Future<void> fetchSpaces() async {
    try {
      List<Space> spaces = await _spaceService.fetchSpaces();
      _spacesController.add(spaces);
    } catch (e) {
      throw Exception('Failed to load spaces');
    }
  }

  Future<void> addSpace(Space space) async {
    try {
      await _spaceService.addSpace(space);
      fetchSpaces(); // Fetch and update the list of spaces
    } catch (e) {
      throw Exception('Failed to add space');
    }
  }


Future<void> updateSpace(Space space) async {
    try {
      await _spaceService.updateSpace(space);
      fetchSpaces(); // Fetch and update the list of spaces
    } catch (e) {
      throw Exception('Failed to update space');
    }
}



  Future<void> deleteSpace(String id) async {
    await _spaceService.deleteSpace(id);
    fetchSpaces(); // Fetch and update the list of spaces
  }

  void dispose() {
    _spacesController.close();
  }
}
