import 'package:cloud_firestore/cloud_firestore.dart';

class Space {
  final String id;
  final int floor;
  final String description;
  final String status;
  final double price;
  final int capacity;
  final String categoryId;
  final List<String> services;
  final String imageUrl;

  Space({
    required this.id,
    required this.floor,
    required this.description,
    required this.status,
    required this.price,
    required this.capacity,
    required this.categoryId,
    required this.services,
    required this.imageUrl,
  });

  factory Space.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Space(
      id: doc.id, // Add this line
      floor: data['floor'] ?? 0,
      description: data['description'] ?? '',
      status: data['status'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      capacity: data['capacity'] ?? 0,
      categoryId: data['category_id'] ?? '',
      services: List<String>.from(data['services'] ?? []),
      imageUrl: data['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'floor': floor,
      'description': description,
      'status': status,
      'price': price,
      'capacity': capacity,
      'category_id': categoryId,
      'services': services,
      'image_url': imageUrl,
    };
  }
}
