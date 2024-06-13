import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space_mobile/core/models/space_model.dart';

class SpaceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Space>> fetchSpaces() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('spaces').get();
      return snapshot.docs.map((doc) {
        return Space.fromDocument(doc);
      }).toList();
    } catch (e) {
      throw Exception('Failed to load spaces');
    }
  }

  Future<void> addSpace(Space space) async {
    try {
      await _firestore.collection('spaces').add(space.toJson());
    } catch (e) {
      throw Exception('Failed to add space');
    }
  }

  Future<void> deleteSpace(String id) async {
    try {
      await _firestore.collection('spaces').doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete space');
    }
  }

  Future<void> updateSpace(Space space) async {
    try {
      await _firestore.collection('spaces').doc(space.id).update(space.toJson());
    } catch (e) {
      throw Exception('Failed to update space');
    }
  }
}
