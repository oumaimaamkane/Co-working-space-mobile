import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coworking_space_mobile/core/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfos {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

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
      QuerySnapshot querySnapshot = await usersCollection.get();
      List<UserModel> fetchedUsers = querySnapshot.docs.map((doc) {
        return UserModel(
          name: doc['name'] ?? '', // Check if 'name' exists, otherwise use empty string
          email: doc['email'] ?? '', // Check if 'email' exists, otherwise use empty string
          password: doc['password'] ?? '', // Check if 'password' exists, otherwise use empty string or appropriate default
          role: doc['role'] ?? 'user', // Check if 'role' exists, otherwise default to 'user'
          phone: doc['phone'], // 'phone' can be nullable based on your data model
        );
      }).toList();
      return fetchedUsers;
    } catch (e) {
      print('Error fetching users: $e');
      throw e; // Propagate the error if necessary
    }
  }
}
