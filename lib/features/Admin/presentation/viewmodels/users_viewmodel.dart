import 'package:get/get.dart';
import 'package:coworking_space_mobile/config/services/user_infos.dart';
import 'package:coworking_space_mobile/core/models/user_model.dart';

class UsersViewModel extends GetxController {
  final UserInfos _userInfos = UserInfos();
  RxList<UserModel> users = RxList<UserModel>();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  // Future<void> fetchUsers() async {
  //   try {
  //     List<UserModel> fetchedUsers = await _userInfos.fetchUsers();
  //     print('Fetched ${fetchedUsers.length} users');
  //     users.assignAll(fetchedUsers);
  //     print('Users loaded: ${users.length}');
  //   } catch (e) {
  //     print('Error fetching users: $e');
  //   }
  // }
  Future<void> fetchUsers() async {
    try {
      // Static list of users for demonstration
      List<UserModel> fetchedUsers = [
        UserModel(name: 'John Doe', email: 'john.doe@example.com', password: 'fgzkdslklfksd', role: 'user', phone: '+1234567890'),
        UserModel(name: 'Jane Smith', email: 'jane.smith@example.com', password: 'dnfsnfkls', role: 'admin', phone: '+9876543210'),
      ];
      users.assignAll(fetchedUsers);
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  Future<void> banUser(UserModel user) async {
    try {
      // Implement ban logic here (e.g., update user status in Firestore)
      // For demonstration, let's just print the user's name
      print('Banning user: ${user.name}');
    } catch (e) {
      print('Error banning user: $e');
    }
  }
}
