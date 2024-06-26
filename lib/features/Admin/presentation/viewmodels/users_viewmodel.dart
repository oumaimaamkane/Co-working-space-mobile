import 'package:coworking_space_mobile/core/models/user_model.dart';
import 'package:get/get.dart';
import 'package:coworking_space_mobile/config/services/user_infos.dart';

class UsersViewModel extends GetxController {
  final UserInfos _userInfos = UserInfos();
  RxList<UserModel> users = RxList<UserModel>();

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      print('Starting fetchUsers...');
      List<UserModel> fetchedUsers = await _userInfos.fetchUsers();
      print('Fetched ${fetchedUsers.length} users');
      users.assignAll(fetchedUsers);
      print('Users loaded: ${users.length}');
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  Future<void> banUser(UserModel user) async {
    try {
      if (user.id == null) {
        throw Exception('User id is null');
      }
      print('Banning user: ${user.name}');
      await _userInfos.banUser(user.id); // Use user.id to access the unique identifier
      user.isBanned = true;
      users.refresh();
    } catch (e) {
      print('Error banning user: $e');
    }
  }
}
