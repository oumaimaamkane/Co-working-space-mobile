import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space_mobile/core/models/service_model.dart';

class ServiceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Service> services = []; // Remove the final keyword

  Future<List<Service>> fetchServices() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('services').get();
      services = snapshot.docs.map((doc) {
        return Service.fromDocument(doc);
      }).toList();
      return services;
    } catch (e) {
      throw Exception('Failed to load services');
    }
  }

  Future<void> addService(String name) async {
    try {
      await _firestore.collection('services').add({
        'name': name,
      });
    } catch (e) {
      throw Exception('Failed to add service');
    }
  }

  Future<void> deleteService(String id) async {
    try {
      await _firestore.collection('services').doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete service');
    }
  }

  Future<void> updateService(String id, String name) async {
    try {
      await _firestore.collection('services').doc(id).update({
        'name': name,
      });
    } catch (e) {
      throw Exception('Failed to update service');
    }
  }
}
