import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space_mobile/core/models/blog_model.dart';

class BlogService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Blog>> fetchBlogs() async {
    try {
      final snapshot = await _firestore.collection('blogs').get();
      final blogs = snapshot.docs.map((doc) => Blog.fromDocument(doc)).toList();
      return blogs;
    } catch (e) {
      throw Exception('Failed to load blogs');
    }
  }

  Future<List<Blog>> fetchUserBlogs(String userId) async {
    try {
      final snapshot = await _firestore.collection('blogs')
        .where('userId', isEqualTo: userId)
        .get();
      final blogs = snapshot.docs.map((doc) => Blog.fromDocument(doc)).toList();
      return blogs;
    } catch (e) {
      throw Exception('Failed to load user blogs');
    }
  }

  Future<void> addBlog(Blog blog) async {
    try {
      await _firestore.collection('blogs').add({
        'title': blog.title,
        'content': blog.content,
        'imageUrl': blog.imageUrl,
        'status': blog.status,
        'userId': blog.userId,
      });
    } catch (e) {
      throw Exception('Failed to add blog: $e');
    }
  }

  Future<void> updateBlog(String docId, Blog updatedBlog) async {
    try {
      await _firestore.collection('blogs').doc(docId).update({
        'title': updatedBlog.title,
        'content': updatedBlog.content,
        'imageUrl': updatedBlog.imageUrl,
        'status': updatedBlog.status,
        'userId': updatedBlog.userId,
      });
    } catch (e) {
      throw Exception('Failed to update blog: $e');
    }
  }

  Future<void> deleteBlog(String docId) async {
    try {
      await _firestore.collection('blogs').doc(docId).delete();
    } catch (e) {
      throw Exception('Failed to delete blog: $e');
    }
  }
}
