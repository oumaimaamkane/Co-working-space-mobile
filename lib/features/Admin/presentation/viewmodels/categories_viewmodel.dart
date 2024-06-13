// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/core/models/category_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:coworking_space_mobile/config/services/category_service.dart';

class CategoryViewModel extends GetxController {
  final CategoryService _categoryService = CategoryService();
  final BehaviorSubject<List<Category>> _categoriesSubject =
    BehaviorSubject<List<Category>>();
  Stream<List<Category>> get categoriesStream => _categoriesSubject.stream;

  CategoryViewModel() {
    _categoryService.fetchCategories().then((data) {
      _categoriesSubject.add(data);
    });
  }

  Future<void> updateCategory(String id, String name) async {
    try {
      await _categoryService.updateCategory(id, name);
      // Get updated data from Firestore (optional)
      final updatedData = await _categoryService.fetchCategories();
      _categoriesSubject.add(updatedData);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> addCategory(String name) async {
    try {
      await _categoryService.addCategory(name);
      final updatedData = await _categoryService.fetchCategories();
      _categoriesSubject.add(updatedData);
    } catch (e) {
      throw Exception('Failed to add category');
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await _categoryService.deleteCategory(id);
      final updatedData = await _categoryService.fetchCategories();
      _categoriesSubject.add(updatedData);
    } catch (e) {
      throw Exception('Failed to delete category');
    }
  }
}
