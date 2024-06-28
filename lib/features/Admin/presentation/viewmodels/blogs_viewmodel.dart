import 'package:flutter/material.dart';
import 'package:coworking_space_mobile/core/models/blog_model.dart';
import 'package:coworking_space_mobile/config/services/blog_service.dart';

class BlogsViewModel extends ChangeNotifier {
  final BlogService _blogService = BlogService();
  List<Blog> blogs = [];
  String selectedFilter = 'pending';

  Future<void> fetchBlogs() async {
    try {
      blogs = await _blogService.fetchBlogs();
      notifyListeners();
    } catch (e) {
      // Handle error
    }
  }

  List<Blog> get filteredBlogs {
    return blogs.where((blog) {
      if (selectedFilter == 'published' && blog.status == 'published') {
        return true;
      } else if (selectedFilter == 'unpublished' && blog.status == 'unpublished') {
        return true;
      } else if (selectedFilter == 'pending' && blog.status == 'pending') {
        return true;
      }
      return false;
    }).toList();
  }

  void setSelectedFilter(String filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  void deleteBlog(int index) {
    blogs.removeAt(index);
    notifyListeners();
  }

  void updateBlogStatus(int index, String status) {
    blogs[index] = blogs[index].copyWith(status: status);
    notifyListeners();
  }
}
