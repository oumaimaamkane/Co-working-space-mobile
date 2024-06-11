// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/core/models/equipement_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:coworking_space_mobile/config/services/equipement_service.dart';

class EquipementViewModel extends GetxController {
  final EquipementService _equipementService = EquipementService();
  final BehaviorSubject<List<Equipement>> _equipementsSubject =
    BehaviorSubject<List<Equipement>>();
  Stream<List<Equipement>> get equipementsStream => _equipementsSubject.stream;

  EquipementViewModel() {
    _equipementService.fetchEquipements().then((data) {
      _equipementsSubject.add(data);
    });
  }

  Future<void> updateEquipement(String id, String name) async {
    try {
      await _equipementService.updateEquipement(id, name);
      // Get updated data from Firestore (optional)
      final updatedData = await _equipementService.fetchEquipements();
      _equipementsSubject.add(updatedData);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> addEquipement(String name) async {
    try {
      await _equipementService.addEquipement(name);
      final updatedData = await _equipementService.fetchEquipements();
      _equipementsSubject.add(updatedData);
    } catch (e) {
      throw Exception('Failed to add equipement');
    }
  }

  Future<void> deleteEquipement(String id) async {
    try {
      await _equipementService.deleteEquipement(id);
      final updatedData = await _equipementService.fetchEquipements();
      _equipementsSubject.add(updatedData);
    } catch (e) {
      throw Exception('Failed to delete equipement');
    }
  }
}
