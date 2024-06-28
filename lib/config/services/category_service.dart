import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space_mobile/core/models/category_model.dart';

class CategoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Category> categories = []; // Remove the final keyword

  Future<Category?> getCategoryById(String id) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('categories').doc(id).get();
      if (doc.exists) {
        return Category.fromDocument(doc);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to fetch category');
    }
  }
  
  Future<List<Category>> fetchCategories() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('categories').get();
      categories = snapshot.docs.map((doc) {
        return Category.fromDocument(doc);
      }).toList();
      return categories;
    } catch (e) {
      throw Exception('Failed to load categories');
    }
  }

  Future<void> addCategory(String name) async {
    try {
      await _firestore.collection('categories').add({
        'name': name,
      });
    } catch (e) {
      throw Exception('Failed to add category');
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await _firestore.collection('categories').doc(id).delete();
    } catch (e) {
      throw Exception('Failed to delete category');
    }
  }

  Future<void> updateCategory(String id, String name) async {
    try {
      await _firestore.collection('categories').doc(id).update({
        'name': name,
      });
    } catch (e) {
      throw Exception('Failed to update category');
    }
  }
}
