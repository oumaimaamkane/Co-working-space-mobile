import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:coworking_space_mobile/core/models/user_model.dart';

class UserInfos {
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> updateUserInfo(String userId, Map<String, dynamic> data) {
    return usersCollection.doc(userId).update(data);
  }

  Future<DocumentSnapshot> getUserData(String userId) async {
    return await usersCollection.doc(userId).get();
  }

  String getUserId() {
    if (FirebaseAuth.instance.currentUser != null) {
      return FirebaseAuth.instance.currentUser!.uid;
    }
    throw Exception('User not logged in');
  }

  Future<List<UserModel>> fetchUsers() async {
    try {
      print('Fetching users from Firestore...');
      QuerySnapshot querySnapshot = await usersCollection.get();
      print('Firestore returned ${querySnapshot.docs.length} documents');
      List<UserModel> fetchedUsers = querySnapshot.docs.map((doc) {
        print('Processing user: ${doc.id}, data: ${doc.data()}');
        return UserModel(
          name: doc['name'] ?? '',
          email: doc['email'] ?? '',
          password: doc['password'] ?? '',
          role: doc['role'] ?? 'user',
          phone: doc['phone'],
        );
      }).toList();
      return fetchedUsers;
    } catch (e) {
      print('Error fetching users: $e');
      throw e;
    }
  }
}
