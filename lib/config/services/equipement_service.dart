import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space_mobile/core/models/equipement_model.dart';

class EquipementService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Equipement>> fetchEquipements() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('equipements').get();
      return snapshot.docs.map((doc) {
        return Equipement.fromDocument(doc);
      }).toList();
    } catch (e) {
      throw Exception('Failed to load equipements');
    }
  }

  Future<void> addEquipement(String name) async {
    try {
      await _firestore.collection('equipements').add({
        'name': name,
      });
    } catch (e) {
      throw Exception('Failed to add equipement');
    }
  }

  Future<void> deleteEquipement(String id) async {
    try {
      await _firestore.collection('equipements').doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete equipement');
    }
  }

  Future<void> updateEquipement(String id, String name) async {
  try {
    await _firestore.collection('equipements').doc(id).update({
      'name': name,
    });
  } catch (e) {
    throw Exception('Failed to update equipement');
  }
}

}
