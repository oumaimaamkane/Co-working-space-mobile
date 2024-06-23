
import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  final String id;
  final String name;

  Service({required this.id, required this.name});

  factory Service.fromDocument(DocumentSnapshot doc) {
    return Service(
      id: doc.id,
      name: doc['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
