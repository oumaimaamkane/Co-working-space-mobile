import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfos {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateUserInfo(String userId, Map<String, dynamic> data) {
    return usersCollection.doc(userId).update(data);
  }
}
