import 'package:cloud_firestore/cloud_firestore.dart';
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
}
