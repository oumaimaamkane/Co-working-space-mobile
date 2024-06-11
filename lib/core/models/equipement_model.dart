// lib/models/equipement.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Equipement {
  final String id;
  final String name;

  Equipement({required this.id, required this.name});

  factory Equipement.fromDocument(DocumentSnapshot doc) {
    return Equipement(
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
