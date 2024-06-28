import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final String status;
  final String userId;

  Blog({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.status,
    required this.userId,
  });

  static Blog fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Blog(
      id: doc.id,
      title: data['title'] as String? ?? '',
      content: data['content'] as String? ?? '',
      imageUrl: data['imageUrl'] as String? ?? '',
      status: data['status'] as String? ?? '',
      userId: data['userId'] as String? ?? '',
    );
  }

  Blog copyWith({
    String? id,
    String? title,
    String? content,
    String? imageUrl,
    String? status,
    String? userId,
  }) {
    return Blog(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
      userId: userId ?? this.userId,
    );
  }
}
